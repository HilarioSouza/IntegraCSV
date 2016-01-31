unit KrImportador;

interface

uses
  Classes, System.Types, System.Generics.Collections, IntfFinanceiro, uEstabelecimento;

type
  ILeitor = Interface
    ['{A05F12A1-D8FF-48D2-B039-01A4A7CEECA6}']
    function GetIMP_ID: Integer;
    function GetEMP_Codigo: String;
    property IMP_ID:Integer read GetIMP_ID;
    property EMP_Codigo: String read GetEMP_Codigo;
    procedure LerArquivo(Filename: String);
  end;

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
    Linha            : String;
    NumLinha         : Integer;
    procedure ValidarCustasFechadas;
    function GetValorVencimento: Double;
    function GetValorRateioServices: Double;
    function GetValorRateioCartorio: Double;
    function GetValorContasaPagar: Double;
  end;

  TListaRegistros = class(TObjectList<TRegistro>);

  TLeitorCSV = class(TClasseBase, ILeitor)
  private
    FEMP_Codigo: String;
    LinhaRegistro: String;
    FIMP_ID: Integer;
    procedure PopularDadosRegistro(Registro: TRegistro);
    procedure GravarRegistrosNoBanco(ListaRegistros: TListaRegistros);
    procedure GravarRegistro(Registro: TRegistro);
    function GravarImportacao: Integer;
    function GetIMP_ID: Integer;
    function GetEMP_Codigo: String;
  published
    property IMP_ID:Integer read GetIMP_ID;
    property EMP_Codigo: String read GetEMP_Codigo;
    procedure LerArquivo(Filename: String);
    constructor Create(const EMP_Codigo: String);
    class procedure DesfazerImportacao(const EMP_Codigo: String; const IMP_ID: Integer);
  end;

  IMovimentoFinanceiro = Interface
  ['{9CA44B6B-23D2-4D48-B7C2-183729DAD6CC}']
    procedure PopularListaRegistro(ListaRegistro: TListaRegistros);
    procedure Popular;
    procedure Append;
    Procedure Post;
    procedure Cancel;
    procedure SetRegistro(const Value: TRegistro);
    procedure AtualizarRegistro(const Codigo: String);
    function GetRegistro: TRegistro;
    function GetCodigo: String;
    function GetTipo: String;
    //
    property Registro: TRegistro read GetRegistro write SetRegistro;
  end;

  TImportadorBase = class(TClasseBase)
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

  TImportadorCRE = class(TImportadorBase, IMovimentoFinanceiro)
  private
    FContasaReceber: IContasaReceber;
    FDadosServices: TEstabelecimento;
    FDadosCartorio: TEstabelecimento;
    procedure PopularVencimentosaReceber(Vencimentos: IVencimentosaReceber);
    procedure PopularServicosaReceber(Servicos: IServicosaReceber);
    procedure PopularRateiosaReceber(Rateios: IRateiosaReceber);
    procedure PopularComissionadosaReceber(Comissionados: IComissionadosServicosaReceber);
    procedure AtualizarRegistro(const Codigo: String);
    procedure Popular;
    procedure Append;
    Procedure Post;
    procedure Cancel;
  public
    constructor Create(Financeiro: IFinanceiro; const EMP_Codigo: String; const IMP_ID: Integer);
    function GetCodigo: String;
    function GetTipo: String;
  end;

  TImportadorCPG = class(TImportadorBase, IMovimentoFinanceiro)
  private
    FContasaPagar: IContasaPagar;
    FBaixasaPagar: IBaixaVencimentoaPagar;
    FDadosEST: TEstabelecimentoContasaPagar;
    procedure Popular;
    procedure Append;
    Procedure Post;
    procedure Cancel;
    procedure PopularVencimentosaPagar(Vencimentos: IVencimentosaPagar);
    procedure AtualizarRegistro(const Codigo: String);
    procedure IncluirBaixaVencimentosaPagar(Vencimento: IVencimentosaPagar);
  public
    constructor Create(Financeiro: IFinanceiro; const EMP_Codigo: String; const IMP_ID: Integer);
    function GetCodigo: String;
    function GetTipo: String;
  end;

  TImportador = class
  private
    FEmp_Codigo: String;
    FFinanceiro: IFinanceiro;
    procedure PopularFinanceiroAG;
  public
    constructor Create(const EMP_Codigo: String);
    procedure ImportarArquivo(const cEMP_Codigo, cCaminhoArquivo: String);
    Procedure ImportarMovimento(Movimento: IMovimentoFinanceiro);
  end;

implementation

uses System.SysUtils, uUtils, uInterfaceQuery, FireDAC.Comp.Client, iwSystem,
  uFuncoesIni, System.Math, uDBUtils, udmConnect, uAuditoria, uLogger;

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
  Lista: TListaRegistros;
  ArquivoAberto: Boolean;
begin
  ArquivoAberto := False;
  if (Filename = '') then
    raise Exception.Create('Arquivo não informado. Por favor informe o caminho do arquivo.');
  if (not FileExists(Filename)) then
    raise Exception.Create('Arquivo não encontrado. Por favor verifique o caminho do arquivo.');
  AssignFile(Arquivo, FileName);
  try
    try
      FIMP_ID := GravarImportacao;
      Lista := TListaRegistros.Create;
      FileMode := fmOpenRead;
      Reset(Arquivo);
      ArquivoAberto := True;
      Readln(Arquivo);
      while not Eof(Arquivo) do
      begin
        Readln(Arquivo, LinhaRegistro);
        Registro := TRegistro.Create;
        Lista.Add(TRegistro(Registro));
        PopularDadosRegistro(Registro);
        Registro.NumLinha := Lista.Count + 1;
      end;
      GravarRegistrosNoBanco(Lista);
    finally
      if ArquivoAberto then
        CloseFile(Arquivo);
    end;
  except
    on E: Exception do
      raise Exception.Create('Erro: ' + E.Message);
  end;
end;

procedure TLeitorCSV.GravarRegistrosNoBanco(ListaRegistros: TListaRegistros);
var
  I: Integer;
begin
  for I := 0 to ListaRegistros.Count-1 do
  begin
    GravarRegistro(ListaRegistros[I]);
  end;
end;

constructor TLeitorCSV.Create(const EMP_Codigo: String);
begin
  Self.FEMP_Codigo := EMP_Codigo;
end;

class procedure TLeitorCSV.DesfazerImportacao(const EMP_Codigo: String; const IMP_ID: Integer);
begin
  TDBUtils.QueryExecute(' DELETE FROM IMP '+
                        '  WHERE IMP.EMP_CODIGO = ' + EMP_Codigo.QuotedString +
                        '    AND IMP.ID = ' + IMP_ID.ToString);
end;

function TLeitorCSV.GetEMP_Codigo: String;
begin
  Result := FEMP_Codigo;
end;

function TLeitorCSV.GetIMP_ID: Integer;
begin
  Result := FIMP_ID;
end;

function TLeitorCSV.GravarImportacao: Integer;
var
  ID: Integer;
begin
  ID := TDBUtils.GetProxID('IMP');
  TDBUtils.QueryExecute(' INSERT INTO IMP (EMP_CODIGO, ID, DATA) '+
                        ' VALUES (' + FEMP_Codigo.QuotedString +',' + ID.ToString + ',' + FormatDateTime('yyyy-mm-dd', Now).QuotedString +')');
  Result := ID;
end;

procedure TLeitorCSV.GravarRegistro(Registro: TRegistro);
const
  SQL = ' INSERT INTO REG (EMP_Codigo, ID, Protocolo, DataCadastro, ValorXimenes, Despachante, Distribuidor, ValorCartorio, DAJ, '+
        ' ValorTotalCustas, Convenio, CustasFechadas, ValorXimenesGestao, ValorXimenesAut, ValorXimenesRec, '+
        ' ValorXimenesOutros, Representante, IMP_ID, NumLinha) '+
        ' values (:EMP_Codigo, :ID, :Protocolo, :DataCadastro, :VlrXimenes, :Despachante, :Distribuidor, :VlrCartorio, :DAJ, '+
        ' :VlrTotalCustas, :Convenio, :CustasFechadas, :VlrXimenesGestao, :VlrXimenesAut, :VlrXimenesRec, '+
        ' :VlrXimenesOutros, :Representante, :IMP_ID, :NumLinha)';
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
  Query.ExecSQL;
end;

procedure TLeitorCSV.PopularDadosRegistro(Registro: TRegistro);
var
  ArrayDados: TStringDynArray;
begin
  ArrayDados := TUtil.Split(LinhaRegistro, ';');
  Registro.EMP_Codigo       := FEMP_Codigo; //Tratar
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
end;

function TImportadorBase.GetRegistro: TRegistro;
begin
  Result := FRegistro;
end;

constructor TImportadorBase.Create(Financeiro: IFinanceiro; const EMP_Codigo: String; const IMP_ID: Integer);
begin
  FEMP_Codigo := EMP_Codigo;
  FIMP_ID := IMP_ID;
end;

procedure TImportadorCRE.Append;
begin
  FContasaReceber.Append;
end;

procedure TImportadorCRE.AtualizarRegistro(const Codigo: String);
var
  Query: TFDQuery;
begin
  if Codigo.IsEmpty then
    Exit;
  Query := NewQuery('UPDATE REG SET REG.CRE_CODIGO = ' + Codigo.QuotedString +
                    ' WHERE REG.ID = ' + FRegistro.ID.ToString +
                    ' AND REG.EMP_CODIGO = ' + FEMP_Codigo.QuotedString);
  Query.ExecSQL;
end;

procedure TImportadorCRE.Cancel;
begin
  FContasaReceber.Cancel;
end;

constructor TImportadorCRE.Create(Financeiro: IFinanceiro; const EMP_Codigo: String; const IMP_ID: Integer);
begin
  inherited;
  FDadosServices := TEstabelecimento.Create(FEMP_Codigo, tidServices);
  FDadosCartorio := TEstabelecimento.Create(FEMP_Codigo, tidCartorio);
  FContasaReceber := Financeiro.GetContasaReceber;
end;

function TImportadorCRE.GetCodigo: String;
begin
  FContasaReceber.Codigo;
end;

function TImportadorCRE.GetTipo: String;
begin
  Result := 'CRE';
end;

procedure TImportadorBase.PopularListaRegistro(ListaRegistro: TListaRegistros);
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

procedure TImportadorBase.SetRegistro(const Value: TRegistro);
begin
  FRegistro := Value;
end;

procedure TImportadorCRE.Popular;
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

procedure TImportadorCRE.PopularVencimentosaReceber(Vencimentos: IVencimentosaReceber);
begin
  Vencimentos.Append;
  try
    Vencimentos.Vencimento     := FContasaReceber.Emissao + 1;
    Vencimentos.Valor          := FRegistro.GetValorVencimento;
    Vencimentos.AgenteCobrador := FRegistro.AgenteCobradorAG;
    Vencimentos.TipoDocumento  := FRegistro.TipoDocumentoAG;
    Vencimentos.Post;
  except
    on E: Exception do
    begin
      Vencimentos.Cancel;
      raise Exception.Create('Erro ao popular o vencimento a receber: ' + E.Message);
    end;
  end;
end;

procedure TImportadorCRE.Post;
begin
  FContasaReceber.Post;
end;

procedure TImportadorCRE.PopularServicosaReceber(Servicos: IServicosaReceber);
begin
  Servicos.Append;
  Servicos.Servico    := FRegistro.ServicoAG;
  Servicos.Modalidade := FRegistro.ModalidadeAG;
  Servicos.Valor      := FRegistro.GetValorVencimento;
  Servicos.Post;
//  PopularComissionadosaReceber(Servicos.ComissionadosServicosaReceber);
end;

procedure TImportadorCRE.PopularComissionadosaReceber(Comissionados: IComissionadosServicosaReceber);
begin
  Comissionados.Append;
  Comissionados.VendedorRepresentante := FRegistro.Representante;
  Comissionados.PercentualComissao    := 0;
  Comissionados.Post;
end;

procedure TImportadorCRE.PopularRateiosaReceber(Rateios: IRateiosaReceber);
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
  Result := Despachante + Distribuidor + VlrCartorio;
end;

function TRegistro.GetValorRateioServices: Double;
begin
  Result := VlrXimenesGestao;
end;

function TRegistro.GetValorVencimento: Double;
begin
  Result := GetValorContasaPagar + GetValorRateioServices + GetValorRateioCartorio;
end;

procedure TRegistro.ValidarCustasFechadas;
var
  DadosAudit: TDadosAuditoria;
begin
  if CustasFechadas and (not Protocolo.IsEmpty) then
  begin
    DadosAudit := TDadosAuditoria.Create(EMP_Codigo, IMP_ID);
    try
      if DadosAudit.Existe then
        raise Exception.Create('Este registro já foi enviado com as custas fechadas e portanto não será importado. '+ NEW_LINE +
                               ' Protocolo: ' +  Protocolo + ' Data: ' + TUtil.FormatarData(DadosAudit.Data) +
                               ' ID da Importação: ' + DadosAudit.ID_Importacao.ToString + NEW_LINE +
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
  ImportadorCRE: TImportadorCRE;
  ImportadorCPG: TImportadorCPG;
begin
  GetLogger.Clear;
  Leitor := TLeitorCSV.Create(cEMP_Codigo);
  try
    TDBUtils.MainServer.StartTransaction;
    FFinanceiro.StartTransaction;
    ImportadorCRE := nil;
    ImportadorCPG := nil;
    try
      Leitor.LerArquivo(cCaminhoArquivo);
      ImportadorCRE := TImportadorCRE.Create(FFinanceiro, cEMP_Codigo, Leitor.IMP_ID);
      ImportarMovimento(ImportadorCRE);
      ImportadorCPG := TImportadorCPG.Create(FFinanceiro, cEMP_Codigo, Leitor.IMP_ID);
      ImportarMovimento(ImportadorCPG);
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
    finally
      FreeAndNil(ImportadorCRE);
      FreeAndNil(ImportadorCPG);
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

{ TImportadorCPG }

procedure TImportadorCPG.Append;
begin
  FContasaPagar.Append;
end;

procedure TImportadorCPG.AtualizarRegistro(const Codigo: String);
var
  Query: TFDQuery;
begin
  Query := NewQuery('UPDATE REG SET REG.CPG_CODIGO = ' + Codigo.QuotedString +
                    ' WHERE REG.ID = ' + FRegistro.ID.ToString +
                    ' AND REG.EMP_CODIGO = ' + FEMP_Codigo.QuotedString);
  Query.ExecSQL;
end;

procedure TImportadorCPG.Cancel;
begin
  FContasaPagar.Cancel;
end;

constructor TImportadorCPG.Create(Financeiro: IFinanceiro; const EMP_Codigo: String; const IMP_ID: Integer);
begin
  inherited;
  FDadosEST := TEstabelecimentoContasaPagar.Create(FEMP_Codigo, tidContasaPagar);
  FContasaPagar := Financeiro.GetContasaPagar;
  FBaixasaPagar := Financeiro.GetBaixaVencimentoaPagar;
end;

function TImportadorCPG.GetCodigo: String;
begin
  Result := FContasaPagar.Codigo;
end;

function TImportadorCPG.GetTipo: String;
begin
  Result := 'CPG';
end;

procedure TImportadorCPG.Popular;
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
  FContasaPagar.ExportaAC              := 0;
  FContasaPagar.Obs                := 'Importação via arquivo Ximenes. Protocolo: ' + FRegistro.Protocolo;
  FContasaPagar.Origem                := 'C';

  PopularVencimentosaPagar(FContasaPagar.VencimentosaPagar);
end;

procedure TImportadorCPG.PopularVencimentosaPagar(Vencimentos: IVencimentosaPagar);
begin
  Vencimentos.Append;
  Vencimentos.Vencimento := FRegistro.DataCadastro;
  Vencimentos.Valor      := FRegistro.GetValorContasaPagar;
  Vencimentos.Titulo     := FRegistro.Protocolo;
  Vencimentos.Post;
  IncluirBaixaVencimentosaPagar(Vencimentos);
end;

procedure TImportadorCPG.IncluirBaixaVencimentosaPagar(Vencimento: IVencimentosaPagar);
begin
  FBaixasaPagar.Append;
  try
    FBaixasaPagar.CPG_Codigo           := Vencimento.Codigo;
    FBaixasaPagar.DataVencimento       := Vencimento.Vencimento;
    FBaixasaPagar.SequencialVencimento := Vencimento.Sequencial;
    FBaixasaPagar.Data                 := Vencimento.Vencimento;
    FBaixasaPagar.Valor                := Vencimento.Valor;
    FBaixasaPagar.Post;
  except
    on E: Exception do
    begin  
      FBaixasaPagar.Cancel;
      raise Exception.Create('Ocorreu um erro ao incluir a baixa do vencimento a pagar. '+ NEW_LINE +'Exceção: ' + E.Message);
    end;
  end;
end;

procedure TImportadorCPG.Post;
begin
  FContasaPagar.Post;
end;

procedure TImportador.ImportarMovimento(Movimento: IMovimentoFinanceiro);
var
  ListaRegistro: TListaRegistros;
  I: Integer;
begin
  ListaRegistro := TListaRegistros.Create;
  try
    try
      Movimento.PopularListaRegistro(ListaRegistro);
      for I := 0 to ListaRegistro.Count - 1 do
      begin
        Movimento.Append;
        Movimento.Registro := ListaRegistro[I];
        try
          if Movimento.GetTipo = 'CRE' then
            Movimento.Registro.ValidarCustasFechadas;
          Movimento.Popular;
          Movimento.Post;
        except
          on E: Exception do
          begin
            Movimento.Cancel;
            GetLogger.Log(Movimento.Registro, E.Message);
          end;
        end;
        Movimento.AtualizarRegistro(Movimento.GetCodigo);
        TAuditor.GravarAuditoria(Movimento);
      end;
    finally
      FreeAndNil(ListaRegistro);
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Ocorreu um erro durante a importação. Exceção: ' + E.Message);
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
      raise Exception.Create('Erro ao conectar com a DLL do AG. Exceção: ' + E.Message);
  end;
end;

end.
