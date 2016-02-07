unit KrImportador;

interface

uses
  Classes, System.Types, System.Generics.Collections, IntfFinanceiro, uEstabelecimento;

type

  TClasseBase = class(TPersistent)
  private
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
  end;

  TRegistro = class(TClasseBase)
  public
    EMP_Codigo       : String;
    ID               : Integer;
    CustasFechadas   : Boolean;
    Protocolo        : String;
    DataCadastro     : TDateTime;
    VlrXimenes       : Double;
    Despachante      : Double;
    Distribuidor     : Double;
    VlrCartorio      : Double;
    DAJ              : Double;
    VlrTotalCustas   : Double;
    Convenio         : String; //CNPJ do Cliente
    VlrXimenesGestao : Double;
    VlrXimenesAut    : Double;
    VlrXimenesRec    : Double;
    VlrXimenesOutros : Double;
    Representante    : String; //CPF do Representante
    IMP_ID           : Integer;
    ServicoAG        : String;
    ModalidadeAG     : String;
    AgenteCobradorAG : String;
    TipoDocumentoAG  : String;
    CPG_Codigo       : String;
    CRE_Codigo       : String;
    Linha            : String;
    NumLinha         : Integer;
    NovoValorCPG     : Double;
    NovoValorCRE     : Double;
    procedure ValidarCustasFechadas;
    procedure PopularNovosValores;
    function GetValorVencimento: Double;
    function GetValorRateioServices: Double;
    function GetValorRateioCartorio: Double;
    function GetValorContasaPagar: Double;
    function JaImportado(out REG_ID: Integer): Boolean;
  end;

  TListaRegistros = class(TObjectList<TRegistro>);

  ILeitor = Interface
    ['{A05F12A1-D8FF-48D2-B039-01A4A7CEECA6}']
    function GetIMP_ID: Integer;
    function GetEMP_Codigo: String;
    property IMP_ID:Integer read GetIMP_ID;
    property EMP_Codigo: String read GetEMP_Codigo;
    procedure LerArquivo(Filename: String);
    function GravarImportacao: Integer;
    function GetLista: TListaRegistros;
    //
    property ListaRegistros: TListaRegistros read GetLista;
  end;

  TLeitorCSV = class(TClasseBase, ILeitor)
  private
    FListaRegistros: TListaRegistros;
    FEMP_Codigo: String;
    LinhaRegistro: String;
    FIMP_ID: Integer;
    procedure PopularDadosRegistro(Registro: TRegistro);
    procedure GravarRegistrosNoBanco;
    procedure GravarRegistro(Registro: TRegistro);
    function GetIMP_ID: Integer;
    function GetEMP_Codigo: String;
    function GetLista: TListaRegistros;
  published
    constructor Create(const EMP_Codigo: String);
    destructor Destroy; override;
    procedure LerArquivo(Filename: String);
    function GravarImportacao: Integer;
    property IMP_ID:Integer read GetIMP_ID;
    property EMP_Codigo: String read GetEMP_Codigo;
    property ListaRegistros: TListaRegistros read GetLista;
  end;

  IMovimentoFinanceiro = Interface
  ['{9CA44B6B-23D2-4D48-B7C2-183729DAD6CC}']
    procedure PopularListaRegistro(ListaRegistro: TListaRegistros);
    procedure Popular;
    procedure Append;
    Procedure Post;
    procedure Cancel;
    procedure SetRegistro(const Value: TRegistro);
    procedure Delete;
    function TratarRegistroJaImportado: Boolean;
    function GetRegistro: TRegistro;
    function GetCodigo: String;
    function GetTipo: String;
    function FindIDWS(const IDWS: String): Boolean;
    //
    property Registro: TRegistro read GetRegistro write SetRegistro;
  end;

  TMovimentoBase = class(TClasseBase)
  private
    FRegistro: TRegistro;
    FEMP_Codigo: String;
    FIMP_ID: Integer;
    procedure PopularListaRegistro(ListaRegistro: TListaRegistros);
    function GetRegistro: TRegistro;
    procedure SetRegistro(const Value: TRegistro);
  public
    constructor Create(Financeiro: IFinanceiro; const EMP_Codigo: String; const IMP_ID: Integer);
    property Registro: TRegistro read GetRegistro write SetRegistro;
  end;

  TMovimentoCRE = class(TMovimentoBase, IMovimentoFinanceiro)
  private
    FContasaReceber: IContasaReceber;
    FDadosServices: TEstabelecimento;
    FDadosCartorio: TEstabelecimento;
    FDadosServico: TServico;
    FDadosVenc: TDadosVencimentoCRE;
    procedure PopularVencimentosaReceber(Vencimentos: IVencimentosaReceber);
    procedure PopularServicosaReceber(Servicos: IServicosaReceber);
    procedure PopularRateiosaReceber(Rateios: IRateiosaReceber);
    procedure PopularComissionadosaReceber(Comissionados: IComissionadosServicosaReceber);
    procedure Popular;
    procedure Append;
    Procedure Post;
    procedure Cancel;
    procedure Delete;
    function FindIDWS(const IDWS: String): Boolean;
    function TratarRegistroJaImportado: Boolean;
  public
    constructor Create(Financeiro: IFinanceiro; const EMP_Codigo: String; const IMP_ID: Integer);
    destructor Destroy; override;
    function GetCodigo: String;
    function GetTipo: String;
  end;

  TMovimentoCPG = class(TMovimentoBase, IMovimentoFinanceiro)
  private
    FContasaPagar: IContasaPagar;
    FBaixasaPagar: IBaixaVencimentoaPagar;
    FDadosEST: TEstabelecimentoContasaPagar;
    FDadosBaixa: TDadosBaixaCPG;
    procedure Popular;
    procedure Append;
    Procedure Post;
    procedure Cancel;
    procedure Delete;
    function FindIDWS(const IDWS: String): Boolean;
    procedure PopularVencimentosaPagar(Vencimentos: IVencimentosaPagar);
    procedure IncluirBaixaVencimentosaPagar(Vencimento: IVencimentosaPagar);
    procedure DeletarBaixas;
    function TratarRegistroJaImportado: Boolean;
  public
    constructor Create(Financeiro: IFinanceiro; const EMP_Codigo: String; const IMP_ID: Integer);
    destructor Destroy; override;
    function GetCodigo: String;
    function GetTipo: String;
  end;

  TImportador = class
  private
    FEmp_Codigo: String;
    FImportacao_ID: Integer;
    FTotalRegistrosImportados: Integer;
    FFinanceiro: IFinanceiro;
    procedure PopularFinanceiroAG;
    procedure DeletarMovimentosImportados;
    procedure DeletarMovimentos(Movimento: IMovimentoFinanceiro);
  public
    constructor Create(const EMP_Codigo: String);
    procedure ImportarArquivo(const cEMP_Codigo, cCaminhoArquivo: String);
    Procedure ImportarMovimento(Movimento: IMovimentoFinanceiro; ListaRegistro: TListaRegistros);
    procedure DesfazerImportacao(const IMP_ID: Integer);
  end;

implementation

uses System.SysUtils, uUtils, uInterfaceQuery, FireDAC.Comp.Client, iwSystem,
  uFuncoesIni, System.Math, uDBUtils, udmConnect, uAuditoria, uLogger,
  Winapi.Windows;

const
  IdxProtocolo        = 0;
  IdxDataCadastro     = 1;
  IdxVlrXimenes       = 2;
  IdxDespachante      = 3;
  IdxDistribuidor     = 4;
  IdxVlrCartorio      = 5;
  IdxDAJ              = 6;
  IdxVlrTotalCustas   = 7;
  IdxConvenio         = 8;
  IdxCustasFechadas   = 9;
  IdxVlrXimenesGestao = 10;
  IdxVlrXimenesAut    = 11;
  IdxVlrXimenesRec    = 12;
  IdxVlrXimenesOutros = 13;
  IdxRepresentante    = 14;
  //
  NEW_LINE = #10#13;

{ TLeitorCSV }

procedure TLeitorCSV.LerArquivo(Filename: String);
var
  Registro: TRegistro;
  Arquivo: Textfile;
  ArquivoAberto: Boolean;
begin
  ArquivoAberto := False;
  if Filename.IsEmpty then
    raise Exception.Create('Arquivo não informado. Por favor informe o caminho do arquivo.');
  if (not FileExists(Filename)) then
    raise Exception.Create('Arquivo não encontrado. Por favor verifique o caminho do arquivo.');
  AssignFile(Arquivo, FileName);
  try
    try
      FIMP_ID := TDBUtils.GetProxID('IMP');
      FileMode := fmOpenRead;
      Reset(Arquivo);
      ArquivoAberto := True;
      Readln(Arquivo);
      while not Eof(Arquivo) do
      begin
        Readln(Arquivo, LinhaRegistro);
        if not LinhaRegistro.IsEmpty then
        begin
          Registro := TRegistro.Create;
          FListaRegistros.Add(TRegistro(Registro));
          PopularDadosRegistro(Registro);
          Registro.NumLinha := FListaRegistros.Count + 1;
        end;
      end;
    finally
      if ArquivoAberto then
        CloseFile(Arquivo);
    end;
  except
    on E: Exception do
      raise Exception.Create('Erro: ' + E.Message);
  end;
end;

procedure TLeitorCSV.GravarRegistrosNoBanco;
var
  I: Integer;
begin
  for I := 0 to FListaRegistros.Count-1 do
  begin
    GravarRegistro(FListaRegistros[I]);
  end;
end;

constructor TLeitorCSV.Create(const EMP_Codigo: String);
begin
  Self.FEMP_Codigo := EMP_Codigo;
  FListaRegistros := TListaRegistros.Create;
end;

destructor TLeitorCSV.Destroy;
begin
  FreeAndNil(FListaRegistros);
  inherited;
end;

function TLeitorCSV.GetEMP_Codigo: String;
begin
  Result := FEMP_Codigo;
end;

function TLeitorCSV.GetIMP_ID: Integer;
begin
  Result := FIMP_ID;
end;

function TLeitorCSV.GetLista: TListaRegistros;
begin
  Result := FListaRegistros;
end;

function TLeitorCSV.GravarImportacao: Integer;
begin
  FIMP_ID := TDBUtils.GetProxID('IMP');
  TDBUtils.QueryExecute(' INSERT INTO IMP (EMP_CODIGO, ID, DATA) '+
                        ' VALUES (' + FEMP_Codigo.QuotedString +',' + FIMP_ID.ToString + ',' +
                                      FormatDateTime('yyyy-mm-dd', Now).QuotedString +')');
  GravarRegistrosNoBanco;
  Result := FIMP_ID;
end;

procedure TLeitorCSV.GravarRegistro(Registro: TRegistro);
const
  SQL = ' INSERT INTO REG (EMP_Codigo, ID, Protocolo, DataCadastro, ValorXimenes, Despachante, Distribuidor, ValorCartorio, DAJ, '+
        ' ValorTotalCustas, Convenio, CustasFechadas, ValorXimenesGestao, ValorXimenesAut, ValorXimenesRec, '+
        ' ValorXimenesOutros, Representante, IMP_ID, NumLinha, CPG_CODIGO, CRE_CODIGO) '+
        ' values (:EMP_Codigo, :ID, :Protocolo, :DataCadastro, :VlrXimenes, :Despachante, :Distribuidor, :VlrCartorio, :DAJ, '+
        ' :VlrTotalCustas, :Convenio, :CustasFechadas, :VlrXimenesGestao, :VlrXimenesAut, :VlrXimenesRec, '+
        ' :VlrXimenesOutros, :Representante, :IMP_ID, :NumLinha, :CPG_CODIGO, :CRE_CODIGO)';
var
  Query: TFDQuery;
begin
  Query := NewQuery;
  Query.SQL.Text := SQL;
  Query.ParamByName('EMP_Codigo').AsString      := Registro.EMP_Codigo;
  Query.ParamByName('ID').AsInteger             := TDBUtils.GetProxID('REG');
  Query.ParamByName('IMP_ID').AsInteger         := Registro.IMP_ID;
  Query.ParamByName('Protocolo').AsString       := Registro.Protocolo;
  Query.ParamByName('DataCadastro').AsDateTime  := Registro.DataCadastro;
  Query.ParamByName('VlrXimenes').AsFloat       := Registro.VlrXimenes;
  Query.ParamByName('Despachante').AsFloat      := Registro.Despachante;
  Query.ParamByName('Distribuidor').AsFloat     := Registro.Distribuidor;
  Query.ParamByName('VlrCartorio').AsFloat      := Registro.VlrCartorio;
  Query.ParamByName('DAJ').AsFloat              := Registro.DAJ;
  Query.ParamByName('VlrTotalCustas').AsFloat   := Registro.VlrTotalCustas;
  Query.ParamByName('Convenio').AsString        := Registro.Convenio;
  Query.ParamByName('CustasFechadas').AsInteger := IfThen(Registro.CustasFechadas, 1, 0);
  Query.ParamByName('VlrXimenesGestao').AsFloat := Registro.VlrXimenesGestao;
  Query.ParamByName('VlrXimenesAut').AsFloat    := Registro.VlrXimenesAut;
  Query.ParamByName('VlrXimenesRec').AsFloat    := Registro.VlrXimenesRec;
  Query.ParamByName('VlrXimenesOutros').AsFloat := Registro.VlrXimenesOutros;
  Query.ParamByName('Representante').AsString   := Registro.Representante;
  Query.ParamByName('NumLinha').AsInteger       := Registro.NumLinha;
  Query.ParamByName('CPG_Codigo').AsString      := Registro.CPG_Codigo;
  Query.ParamByName('CRE_Codigo').AsString      := Registro.CRE_Codigo;
  Query.ExecSQL;
end;

procedure TLeitorCSV.PopularDadosRegistro(Registro: TRegistro);
var
  ArrayDados: TStringDynArray;
  sIMP_ID: Integer;
begin
  ArrayDados := TUtil.Split(LinhaRegistro, ';');
  Registro.EMP_Codigo       := FEMP_Codigo;
  Registro.IMP_ID           := IMP_ID;
  Registro.Protocolo        := ArrayDados[IdxProtocolo];
  Registro.DataCadastro     := StrToDateTimeDef(ArrayDados[IdxDataCadastro], 0);
  Registro.VlrXimenes       := StrToFloatDef(ArrayDados[IdxVlrXimenes], 0);
  Registro.Despachante      := StrToFloatDef(ArrayDados[IdxDespachante], 0);
  Registro.Distribuidor     := StrToFloatDef(ArrayDados[IdxDistribuidor], 0);
  Registro.VlrCartorio      := StrToFloatDef(ArrayDados[IdxVlrCartorio], 0);
  Registro.DAJ              := StrToFloatDef(ArrayDados[IdxDAJ], 0);
  Registro.VlrTotalCustas   := StrToFloatDef(ArrayDados[IdxVlrTotalCustas], 0);
  Registro.Convenio         := TUtil.GetOnlyNumbers(ArrayDados[IdxConvenio]);
  Registro.CustasFechadas   := ArrayDados[IdxCustasFechadas] = 'SIM';
  Registro.VlrXimenesGestao := StrToFloatDef(ArrayDados[IdxVlrXimenesGestao], 0);
  Registro.VlrXimenesAut    := StrToFloatDef(ArrayDados[IdxVlrXimenesAut], 0);
  Registro.VlrXimenesRec    := StrToFloatDef(ArrayDados[IdxVlrXimenesRec], 0);
  Registro.VlrXimenesOutros := StrToFloatDef(ArrayDados[IdxVlrXimenesOutros], 0);
  Registro.Representante    := ArrayDados[IdxRepresentante];
  Registro.Linha            := LinhaRegistro;
  Registro.PopularNovosValores;
end;

function TMovimentoBase.GetRegistro: TRegistro;
begin
  Result := FRegistro;
end;

constructor TMovimentoBase.Create(Financeiro: IFinanceiro; const EMP_Codigo: String; const IMP_ID: Integer);
begin
  FEMP_Codigo := EMP_Codigo;
  FIMP_ID := IMP_ID;
end;

procedure TMovimentoCRE.Append;
begin
  FContasaReceber.Append;
end;

procedure TMovimentoCRE.Cancel;
begin
  FContasaReceber.Cancel;
end;

constructor TMovimentoCRE.Create(Financeiro: IFinanceiro; const EMP_Codigo: String; const IMP_ID: Integer);
begin
  inherited;
  FDadosServices  := TEstabelecimento.Create(FEMP_Codigo, tidServices);
  FDadosCartorio  := TEstabelecimento.Create(FEMP_Codigo, tidCartorio);
  FDadosVenc      := TDadosVencimentoCRE.Create(FEMP_Codigo);
  FDadosServico   := TServico.Create(FEMP_Codigo);
  FContasaReceber := Financeiro.GetContasaReceber;
end;

procedure TMovimentoCRE.Delete;
begin
  FContasaReceber.Delete;
end;

destructor TMovimentoCRE.Destroy;
begin
  FreeAndNil(FDadosServices);
  FreeAndNil(FDadosCartorio);
  FreeAndNil(FDadosVenc);
  FreeAndNil(FDadosServico);
  FContasaReceber := nil;
  inherited;
end;

function TMovimentoCRE.FindIDWS(const IDWS: String): Boolean;
begin
  Result := FContasaReceber.FindIDWS(IDWS);
end;

function TMovimentoCRE.TratarRegistroJaImportado: Boolean;
begin
  Result := False;
  if FContasaReceber.FindIDWS(FRegistro.Protocolo) then
  begin
    Result := True;
    if (FRegistro.NovoValorCRE > 0) then
    begin
      FContasaReceber.Edit(True);
      PopularVencimentosaReceber(FContasaReceber.VencimentosaReceber);
      FContasaReceber.Post;
    end;
  end;
end;

function TMovimentoCRE.GetCodigo: String;
begin
  Result := FContasaReceber.Codigo;
end;

function TMovimentoCRE.GetTipo: String;
begin
  Result := 'CRE';
end;

procedure TMovimentoBase.PopularListaRegistro(ListaRegistro: TListaRegistros);
var
  Registro: TRegistro;
  Query: TFDQuery;
begin
  Query := NewQuery;
  Query.Open('SELECT REG.*, EMP.* FROM REG ' +
             '  LEFT JOIN EMP ON EMP.CODIGO = REG.EMP_CODIGO' +
             ' WHERE REG.EMP_CODIGO = ' + FEMP_Codigo.QuotedString + ' AND REG.IMP_ID = ' + FIMP_ID.ToString);
  Query.First;
  while not Query.Eof do
  begin
    Registro := TRegistro.Create;
    ListaRegistro.Add(Registro);
    Registro.EMP_Codigo       := FEMP_Codigo;
    Registro.IMP_ID           := FIMP_ID;
    Registro.ID               := Query.FieldByName('ID').AsInteger;
    Registro.Protocolo        := Query.FieldByName('Protocolo').AsString;
    Registro.DataCadastro     := Query.FieldByName('DataCadastro').AsDateTime;
    Registro.VlrXimenes       := Query.FieldByName('ValorXimenes').AsFloat;
    Registro.Despachante      := Query.FieldByName('Despachante').AsFloat;
    Registro.Distribuidor     := Query.FieldByName('Distribuidor').AsFloat;
    Registro.VlrCartorio      := Query.FieldByName('ValorCartorio').AsFloat;
    Registro.DAJ              := Query.FieldByName('DAJ').AsFloat;
    Registro.VlrTotalCustas   := Query.FieldByName('ValorTotalCustas').AsFloat;
    Registro.Convenio         := Query.FieldByName('Convenio').AsString;
    Registro.CustasFechadas   := Query.FieldByName('CustasFechadas').AsInteger = 1;
    Registro.VlrXimenesGestao := Query.FieldByName('ValorXimenesGestao').AsFloat;
    Registro.VlrXimenesAut    := Query.FieldByName('ValorXimenesAut').AsFloat;
    Registro.VlrXimenesRec    := Query.FieldByName('ValorXimenesRec').AsFloat;
    Registro.VlrXimenesOutros := Query.FieldByName('ValorXimenesOutros').AsFloat;
    Registro.Representante    := Query.FieldByName('Representante').AsString;
    Registro.ServicoAG        := Query.FieldByName('SER_CODIGO').AsString;
    Registro.AgenteCobradorAG := Query.FieldByName('VDR_COB_CODIGO').AsString;
    Registro.TipoDocumentoAG  := Query.FieldByName('VDR_TDC_CODIGO').AsString;
    Registro.ModalidadeAG     := Query.FieldByName('MDS_CODIGO').AsString;
    Registro.NumLinha         := Query.FieldByName('NumLinha').AsInteger;
    Query.Next;
  end;
end;

procedure TMovimentoBase.SetRegistro(const Value: TRegistro);
begin
  FRegistro := Value;
end;

procedure TMovimentoCRE.Popular;
begin
  FContasaReceber.Cliente               := FRegistro.Convenio;
  FContasaReceber.Estabelecimento       := FDadosServices.EST_Codigo;//Só porque é obrigatório.
  FContasaReceber.Documento             := FRegistro.Protocolo;
  FContasaReceber.TipoGeracao           := 'C'; //Aparentemente se for Cargas, não é possível editar no AG...
  FContasaReceber.Emissao               := FRegistro.DataCadastro;
  FContasaReceber.Obs                   := 'Importação via arquivo Ximenes. Protocolo: ' + FRegistro.Protocolo;
  FContasaReceber.MesAno                := FormatDateTime('mmaaaa', FRegistro.DataCadastro);
  FContasaReceber.IDWS                  := FRegistro.Protocolo; //Atualizar AGLib urgente...
  PopularVencimentosaReceber(FContasaReceber.VencimentosaReceber);
  PopularServicosaReceber(FContasaReceber.ServicosaReceber);
  PopularRateiosaReceber(FContasaReceber.RateiosaReceber);
end;

procedure TMovimentoCRE.PopularVencimentosaReceber(Vencimentos: IVencimentosaReceber);
begin
  Vencimentos.Append;
  try
    Vencimentos.Vencimento     := FContasaReceber.Emissao;
    Vencimentos.Valor          := FRegistro.GetValorVencimento;
    Vencimentos.AgenteCobrador := FDadosVenc.COB_Codigo;
    Vencimentos.TipoDocumento  := FDadosVenc.TDC_Codigo;
    Vencimentos.Post;
  except
    on E: Exception do
    begin
      Vencimentos.Cancel;
      raise Exception.Create('Erro ao popular o vencimento a receber: ' + E.Message);
    end;
  end;
end;

procedure TMovimentoCRE.Post;
begin
  FContasaReceber.Post;
end;

procedure TMovimentoCRE.PopularServicosaReceber(Servicos: IServicosaReceber);
begin
  Servicos.Append;
  Servicos.Servico    := FDadosServico.SER_Codigo;
  Servicos.Modalidade := FDadosServico.MDS_Codigo;
  Servicos.Valor      := FRegistro.GetValorVencimento;
  Servicos.Post;
//  PopularComissionadosaReceber(Servicos.ComissionadosServicosaReceber);
end;

procedure TMovimentoCRE.PopularComissionadosaReceber(Comissionados: IComissionadosServicosaReceber);
begin
  Comissionados.Append;
  Comissionados.VendedorRepresentante := FRegistro.Representante;
  Comissionados.PercentualComissao    := 0;
  Comissionados.Post;
end;

procedure TMovimentoCRE.PopularRateiosaReceber(Rateios: IRateiosaReceber);
begin
  Rateios.Append;
  Rateios.Estabelecimento    := FDadosServices.EST_Codigo;
  Rateios.CentroDeResultados := FDadosServices.CRS_Codigo;
  Rateios.Receita            := FDadosServices.CRD_Codigo;
  Rateios.Observacao         := 'Rateio referente ao estabelecimento Ximenes Services';
  Rateios.Valor              := FRegistro.GetValorRateioServices + FRegistro.GetValorContasaPagar;
  Rateios.Post;

  Rateios.Append;
  Rateios.Estabelecimento    := FDadosCartorio.EST_Codigo;
  Rateios.CentroDeResultados := FDadosCartorio.CRS_Codigo;
  Rateios.Receita            := FDadosCartorio.CRD_Codigo;
  Rateios.Observacao         := 'Rateio referente ao estabelecimento Cartório Ximenes';
  Rateios.Valor              := FRegistro.GetValorRateioCartorio;
  Rateios.Post;
end;

{ TClasseBase }

function TClasseBase._AddRef: Integer;
begin
  Result := 0;
end;

function TClasseBase._Release: Integer;
begin
  Result := 0;
end;

function TClasseBase.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin
  Result := 0;
end;

{ TRegistro }

function TRegistro.GetValorRateioCartorio: Double;
begin
  Result := VlrXimenesAut + VlrXimenesRec;
end;

function TRegistro.GetValorContasaPagar: Double;
begin
  if (CompareValue(NovoValorCPG, 0) > 0) then
    Result := NovoValorCPG
  else
    Result := Despachante + Distribuidor + VlrCartorio;
end;

function TRegistro.GetValorRateioServices: Double;
begin
  Result := VlrXimenesGestao;
end;

function TRegistro.GetValorVencimento: Double;
begin
  if (CompareValue(NovoValorCPG, 0) > 0) then
    Result := NovoValorCRE
  else
    Result := GetValorContasaPagar + GetValorRateioServices + GetValorRateioCartorio;
end;

function TRegistro.JaImportado(out REG_ID: Integer): Boolean;
const
  SQL = ' SELECT MAX(REG.ID) AS REG_ID FROM REG WHERE REG.EMP_CODIGO = :EMP_CODIGO AND REG.PROTOCOLO = :PROTOCOLO ';
var
  Query: TFDQuery;
begin
  Query := NewQuery(SQL);
  Query.ParamByName('EMP_CODIGO').AsString := EMP_Codigo;
  Query.ParamByName('PROTOCOLO').AsString := Protocolo;
  Query.Open;
  REG_ID := Query.FieldByName('REG_ID').AsInteger;
  Result :=  REG_ID > 0;
end;

procedure TRegistro.PopularNovosValores;
const
  sSQL = ' SELECT * FROM REG WHERE REG.EMP_CODIGO = :EMP_CODIGO ' +
        '    AND REG.PROTOCOLO = :PROTOCOLO AND REG.ID = :ID ';
var
  sID: Integer;
  Query: TFDQuery;
  ValorAntigoCPG: Double;
  ValorAntigoCRE: Double;
begin
  NovoValorCPG := 0;
  NovoValorCRE := 0;
  if JaImportado(sID) then
  begin
    Query := NewQuery(sSQL);
    Query.ParamByName('EMP_CODIGO').AsString := EMP_Codigo;
    Query.ParamByName('PROTOCOLO').AsString := Protocolo;
    Query.ParamByName('ID').AsInteger := sID;
    Query.Open;
    ValorAntigoCPG := Query.FieldByName('DESPACHANTE').AsFloat + Query.FieldByName('DISTRIBUIDOR').AsFloat +
                      Query.FieldByName('VALORCARTORIO').AsFloat;
    //VlrXimenesGestao + VlrXimenesAut + VlrXimenesRec
    ValorAntigoCRE := Query.FieldByName('VALORXIMENESGESTAO').AsFloat + Query.FieldByName('VALORXIMENESAUT').AsFloat +
                      Query.FieldByName('VALORXIMENESREC').AsFloat;
    NovoValorCPG := GetValorContasaPagar - ValorAntigoCPG;
    NovoValorCRE := GetValorVencimento - (ValorAntigoCPG + ValorAntigoCRE);
  end;
end;

procedure TRegistro.ValidarCustasFechadas;
var
  DadosAudit: TDadosAuditoria;
begin
  if CustasFechadas and (not Protocolo.IsEmpty) then
  begin
    DadosAudit := TDadosAuditoria.Create(Self);
    try
      if DadosAudit.Existe then
        raise Exception.Create('Este registro já foi enviado com as custas fechadas e portanto não será importado. '+ NEW_LINE +
                               ' Protocolo: ' +  Protocolo + ' Data: ' + TUtil.FormatarData(DadosAudit.Data) +
                               ' ID da Importação: ' + IMP_ID.ToString.QuotedString + NEW_LINE +
                               ' Registro original: ' + DadosAudit.RegistroOriginal);
    finally
      FreeAndNil(DadosAudit);
    end;
  end;
end;

constructor TImportador.Create(const EMP_Codigo: String);
begin
  FEmp_Codigo := EMP_Codigo;
  FFinanceiro:= GetFinanceiro(gsAppPath);
  PopularFinanceiroAG;
end;

procedure TImportador.ImportarArquivo(const cEMP_Codigo, cCaminhoArquivo: String);
var
  Leitor: ILeitor;
  ImportadorCRE: TMovimentoCRE;
  ImportadorCPG: TMovimentoCPG;
begin
  GetLogger.Clear;
  Leitor := TLeitorCSV.Create(cEMP_Codigo);
  try
    TDBUtils.MainServer.StartTransaction;
    FFinanceiro.StartTransaction;
    Leitor.LerArquivo(cCaminhoArquivo);
    ImportadorCRE := nil;
    ImportadorCPG := nil;
    try
      ImportadorCRE := TMovimentoCRE.Create(FFinanceiro, cEMP_Codigo, Leitor.IMP_ID);
      ImportarMovimento(ImportadorCRE, Leitor.ListaRegistros);
      ImportadorCPG := TMovimentoCPG.Create(FFinanceiro, cEMP_Codigo, Leitor.IMP_ID);
      ImportarMovimento(ImportadorCPG, Leitor.ListaRegistros);
      if FTotalRegistrosImportados > 0 then
      begin
        Leitor.GravarImportacao;
        TAuditor.GravarAuditoria(Leitor.ListaRegistros, Leitor.IMP_ID);
      end
      else
        raise Exception.Create('Não houve registros importados.');
    finally
      FreeAndNil(ImportadorCRE);
      FreeAndnil(ImportadorCPG);
    end;
    if GetLogger.HasLog then
    begin
      FFinanceiro.Rollback;
      TDBUtils.MainServer.Rollback;
      GetLogger.SaveLog(gsAppPath + gsAppName + '.log');
    end
    else
    begin
      FFinanceiro.Commit;
      TDBUtils.MainServer.Commit;
    end;
  except
    on E: Exception do
    begin
      FFinanceiro.Rollback;
      TDBUtils.MainServer.Rollback;
      raise Exception.Create('Erro durante a importação: ' + E.Message);
    end;
  end;
end;

{ TMovimentoCPG }

procedure TMovimentoCPG.Append;
begin
  FContasaPagar.Append;
end;

procedure TMovimentoCPG.Cancel;
begin
  FContasaPagar.Cancel;
end;

constructor TMovimentoCPG.Create(Financeiro: IFinanceiro; const EMP_Codigo: String; const IMP_ID: Integer);
begin
  inherited;
  FDadosEST := TEstabelecimentoContasaPagar.Create(FEMP_Codigo, tidContasaPagar);
  FDadosBaixa := TDadosBaixaCPG.Create(FEMP_Codigo);
  FContasaPagar := Financeiro.GetContasaPagar;
  FBaixasaPagar := Financeiro.GetBaixaVencimentoaPagar;
end;

procedure TMovimentoCPG.DeletarBaixas;
begin
  //Deletar as baixas do CPG
  if FBaixasaPagar.Find(FContasaPagar.Codigo, FContasaPagar.VencimentosaPagar.Sequencial, FContasaPagar.VencimentosaPagar.Vencimento, 1) then
    FBaixasaPagar.Delete;
end;

function TMovimentoCPG.TratarRegistroJaImportado: Boolean;
var
  Vencimentos: IVencimentosaPagar;
begin
  Result := False;
  if FContasaPagar.FindIDWS(FRegistro.Protocolo) then
  begin
    Result := True;
    if (FRegistro.NovoValorCPG > 0) then
    begin
      FContasaPagar.Edit(True);
      Vencimentos := FContasaPagar.VencimentosaPagar;
      PopularVencimentosaPagar(Vencimentos);
      FContasaPagar.Post;
      IncluirBaixaVencimentosaPagar(Vencimentos);
    end;
  end;
end;

procedure TMovimentoCPG.Delete;
begin
//  DeletarBaixas;
  FContasaPagar.Delete;
end;

destructor TMovimentoCPG.Destroy;
begin
  FreeAndNil(FDadosEST);
  FreeAndNil(FDadosBaixa);
  FContasaPagar := nil;
  FBaixasaPagar := nil;
  inherited;
end;

function TMovimentoCPG.FindIDWS(const IDWS: String): Boolean;
begin
  Result := FContasaPagar.FindIDWS(IDWS);
end;

function TMovimentoCPG.GetCodigo: String;
begin
  Result := FContasaPagar.Codigo;
end;

function TMovimentoCPG.GetTipo: String;
begin
  Result := 'CPG';
end;

procedure TMovimentoCPG.Popular;
begin
  FContasaPagar.Fornecedor            := FDadosEST.FRN_CNPJ;
  FContasaPagar.Documento             := FRegistro.Protocolo;
  FContasaPagar.Emissao               := FRegistro.DataCadastro;
  FContasaPagar.MesAnoComp            := FormatDateTime('mmyyyy', FRegistro.DataCadastro);
  FContasaPagar.Estabelecimento       := FDadosEST.EST_Codigo;
  FContasaPagar.CentroResultados      := FDadosEST.CRS_Codigo;
  FContasaPagar.Despesa               := FDadosEST.CRD_Codigo;
  FContasaPagar.TipoDocumento         := FDadosEST.TDC_Codigo; //Falta adicionar o campo
  FContasaPagar.DtEntrada             := FRegistro.DataCadastro;
//  ContasaPagar.ValorBruto
  FContasaPagar.ContaFinanceira       := FDadosEST.CON_Codigo; // Falta adicionar o campo
  FContasaPagar.ExportaAC             := 0;
  FContasaPagar.Obs                   := 'Importação via arquivo Ximenes. Protocolo: ' + FRegistro.Protocolo;
  FContasaPagar.Origem                := 'C';
  FContasaPagar.IDWS                  := FRegistro.Protocolo;

  PopularVencimentosaPagar(FContasaPagar.VencimentosaPagar);
end;

procedure TMovimentoCPG.PopularVencimentosaPagar(Vencimentos: IVencimentosaPagar);
begin
  Vencimentos.Append;
  Vencimentos.Vencimento := FRegistro.DataCadastro;
  Vencimentos.Valor      := FRegistro.GetValorContasaPagar;
  Vencimentos.Titulo     := FRegistro.Protocolo;
  Vencimentos.Post;
end;

procedure TMovimentoCPG.IncluirBaixaVencimentosaPagar(Vencimento: IVencimentosaPagar);
begin
  FBaixasaPagar.Append;
  try
    FBaixasaPagar.CPG_Codigo           := Vencimento.Codigo;
    FBaixasaPagar.DataVencimento       := Vencimento.Vencimento;
    FBaixasaPagar.SequencialVencimento := Vencimento.Sequencial;
    FBaixasaPagar.Data                 := Now;
    FBaixasaPagar.Valor                := Vencimento.Valor;
    FBaixasaPagar.LAN_ContaFinanceira  := FDadosBaixa.CON_Codigo;
    FBaixasaPagar.LAN_Historico        := 'PROTOCOLO: '+ FRegistro.Protocolo + ' BAIXA AUTOMÁTICA DA INTEGRAÇÃO VIA AGLIB.DLL';
    FBaixasaPagar.LAN_CRD_Desconto     := FDadosBaixa.CRD_Desc;
    FBaixasaPagar.LAN_CRD_Juros        := FDadosBaixa.CRD_Juros;
    FBaixasaPagar.Post;
  except
    on E: Exception do
    begin  
      FBaixasaPagar.Cancel;
      raise Exception.Create('Ocorreu um erro ao incluir a baixa do vencimento a pagar. '+ NEW_LINE +'Exceção: ' + E.Message);
    end;
  end;
end;

procedure TMovimentoCPG.Post;
begin
  FContasaPagar.Post;
  IncluirBaixaVencimentosaPagar(FContasaPagar.VencimentosaPagar);
end;

procedure TImportador.ImportarMovimento(Movimento: IMovimentoFinanceiro; ListaRegistro: TListaRegistros);
var
  I: Integer;
begin
  try
    for I := 0 to ListaRegistro.Count - 1 do
    begin
      Movimento.Registro := ListaRegistro[I];
      if Movimento.TratarRegistroJaImportado then
        Continue;
      Movimento.Append;
      try
        if Movimento.GetTipo = 'CRE' then
          Movimento.Registro.ValidarCustasFechadas;
        Movimento.Popular;
        Movimento.Post;
        if Movimento is TMovimentoCRE then
          Movimento.Registro.CRE_Codigo := Movimento.GetCodigo
        else
          Movimento.Registro.CPG_Codigo := Movimento.GetCodigo;
        Inc(FTotalRegistrosImportados); //2 Movimentos, apenas 1 Registro
      except
        on E: Exception do
        begin
          Movimento.Cancel;
          GetLogger.Log(Movimento.Registro, E.Message);
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Ocorreu um problema durante a importação. Exceção: ' + E.Message);
    end;
  end;
end;

procedure TImportador.PopularFinanceiroAG;
var
  Query: TFDQuery;
begin
  try
    Query := NewQuery('SELECT * FROM CFG WHERE CFG.EMP_CODIGO = ' + FEMP_Codigo.QuotedString);
    Query.Open;
    FFinanceiro.DriverNameBanco := 'INTRBASE';
    FFinanceiro.UsuarioBanco := Query.FieldByName('USUARIO').AsString;
    FFinanceiro.SenhaBanco := Query.FieldByName('SENHA').AsString;
    FFinanceiro.Open(Query.FieldByName('CAMINHOBANCO').AsString);
    FFinanceiro.Empresa := FEMP_Codigo;
  except
    on E: Exception do
      raise Exception.Create('Ocorreu um problema ao conectar com a DLL do AG. Exceção: ' + E.Message);
  end;
end;

procedure TImportador.DesfazerImportacao(const IMP_ID: Integer);
begin
  FFinanceiro.StartTransaction;
  try
    FImportacao_ID := IMP_ID;
    DeletarMovimentosImportados;
    TDBUtils.QueryExecute(' DELETE FROM IMP '+
                          '  WHERE IMP.EMP_CODIGO = ' + FEMP_Codigo.QuotedString +
                          '    AND IMP.ID = ' + FImportacao_ID.ToString);
    FFinanceiro.Commit;
  except
    on E: Exception do
    begin
      FFinanceiro.Rollback;
      raise Exception.Create('Não foi possível desfazer a importação. Exceção: ' + E.Message);
    end;
  end;
end;

procedure TImportador.DeletarMovimentosImportados;
var
  MovimentoCRE: TMovimentoCRE;
  MovimentoCPG: TMovimentoCPG;
begin
  try
    MovimentoCRE := nil;
    MovimentoCPG := nil;
    try
      MovimentoCRE := TMovimentoCRE.Create(FFinanceiro, FEmp_Codigo, FImportacao_ID);
      DeletarMovimentos(MovimentoCRE);
      MovimentoCPG := TMovimentoCPG.Create(FFinanceiro, FEmp_Codigo, FImportacao_ID);
      DeletarMovimentos(MovimentoCPG);
    finally
      FreeAndNil(MovimentoCRE);
      FreeAndNil(MovimentoCPG);
    end;
  except
    on E: Exception do
      raise Exception.Create('Não foi possível deletar os movimentos importados no Fortes Financeiro. Exceção: ' + e.Message);
  end;
end;

procedure TImportador.DeletarMovimentos(Movimento: IMovimentoFinanceiro);
var
  Lista: TListaRegistros;
  I: Integer;
begin
  Lista := TListaRegistros.Create;
  try
    Movimento.PopularListaRegistro(Lista);
    for I := 0 to Lista.Count - 1 do
      if Movimento.FindIDWS(Lista[I].Protocolo) then
        Movimento.Delete;
  finally
    FreeAndNil(Lista);
  end;
end;

end.
