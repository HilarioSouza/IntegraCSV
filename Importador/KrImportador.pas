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
    EMP_Codigo      : String;
    ID              : Integer;
    Protocolo       : String; //Identificador do Registro
    DataCadastro    : TDateTime;
    VlrXimenes      : Double;
    Despachante     : Double;
    Distribuidor    : Double;
    VlrCartorio     : Double;
    DAJ             : Double;
    VlrTotalCustas  : Double;
    Convenio        : String; //CNPJ do Cliente
    CustasFechadas  : Integer;
    VlrXimenesGestao: Double;
    VlrXimenesAut   : Double;
    VlrXimenesRec   : Double;
    VlrXimenesOutros: Double;
    Representante   : String; //CPF do Representante
    IMP_ID          : Integer;
    SER_Codigo      : String;
    MDS_Codigo      : String;
    function GetValorVencimento: Double;
    function GetValorRateioServices: Double;
    function GetValorRateioCartorio: Double;
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

  TImportadorBase = class
  private
    FFinanceiro: IFinanceiro;
    FRegistro: TRegistro;
    FEMP_Codigo: String;
    FIMP_ID: Integer;
    FDadosServices: TEstabelecimento;
    FDadosCartorio: TEstabelecimento;
    function PopularFinanceiroAG: IFinanceiro;
    procedure PopularListaRegistro(ListaRegistro: TListaRegistros; IMP_ID: Integer);
  public
    constructor Create(const EMP_Codigo: String; const IMP_ID: Integer);
    destructor Destroy; override;
  end;

  TImportadorCRE = class(TImportadorBase)
  private
    procedure PopularContasaReceber(ContasaReceber: IContasaReceber);
    procedure PopularVencimentosaReceber(Vencimentos: IVencimentosaReceber);
    procedure PopularServicosaReceber(Servicos: IServicosaReceber);
    procedure PopularRateiosaReceber(Rateios: IRateiosaReceber);
    procedure PopularComissionadosaReceber(Comissionados: IComissionadosServicosaReceber);
  public
    procedure GravarContasaReceber;
  end;

  TImportadorCPG = class(TImportadorBase)
  private
    procedure PopularContasaPagar(ContasaPagar: IContasaPagar);
    procedure PopularVencimentosaPagar(Vencimentos: IVencimentosaPagar);
  public
    procedure GravarContasaPagar;
  end;

  TImportador = class
  public
    class procedure ImportarArquivo(const cEMP_Codigo, cCaminhoArquivo: String); static;
  end;

implementation

uses System.SysUtils, uUtils, uInterfaceQuery, FireDAC.Comp.Client, iwSystem,
  uFuncoesIni, System.Math, uDBUtils, udmConnect;

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
        ' ValorXimenesOutros, Representante, IMP_ID) '+
        ' values (:EMP_Codigo, :ID, :Protocolo, :DataCadastro, :VlrXimenes, :Despachante, :Distribuidor, :VlrCartorio, :DAJ, '+
        ' :VlrTotalCustas, :Convenio, :CustasFechadas, :VlrXimenesGestao, :VlrXimenesAut, :VlrXimenesRec, '+
        ' :VlrXimenesOutros, :Representante, :IMP_ID)';
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
  Query.ParamByName('CustasFechadas').AsInteger := Registro.CustasFechadas;
  Query.ParamByName('VlrXimenesGestao').AsFloat := Registro.VlrXimenesGestao;
  Query.ParamByName('VlrXimenesAut').AsFloat    := Registro.VlrXimenesAut;
  Query.ParamByName('VlrXimenesRec').AsFloat    := Registro.VlrXimenesRec;
  Query.ParamByName('VlrXimenesOutros').AsFloat := Registro.VlrXimenesOutros;
  Query.ParamByName('Representante').AsString   := Registro.Representante;
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
  Registro.Convenio         := ArrayDados[IdxConvenio];
  Registro.CustasFechadas   := IfThen(ArrayDados[IdxCustasFechadas] = 'SIM', 1, 0);
  Registro.VlrXimenesGestao := StrToFloatDef(ArrayDados[IdxVlrXimenesGestao], 0);
  Registro.VlrXimenesAut    := StrToFloatDef(ArrayDados[IdxVlrXimenesAut], 0);
  Registro.VlrXimenesRec    := StrToFloatDef(ArrayDados[IdxVlrXimenesRec], 0);
  Registro.VlrXimenesOutros := StrToFloatDef(ArrayDados[IdxVlrXimenesOutros], 0);
  Registro.Representante    := ArrayDados[IdxRepresentante];
end;

function TImportadorBase.PopularFinanceiroAG: IFinanceiro;
var
  Query: TFDQuery;
begin
  Query := NewQuery('SELECT * FROM CFG WHERE CFG.EMP_CODIGO = ' + FEMP_Codigo.QuotedString);
  Query.Open;
  FFinanceiro.DriverNameBanco := 'INTRBASE';
  FFinanceiro.UsuarioBanco := Query.FieldByName('USUARIO').AsString;
  FFinanceiro.SenhaBanco := Query.FieldByName('SENHA').AsString;
  FFinanceiro.Open(Query.FieldByName('CAMINHOBANCO').AsString);
  FFinanceiro.Empresa := FEMP_Codigo;
end;

constructor TImportadorBase.Create(const EMP_Codigo: String; const IMP_ID: Integer);
begin
  FEMP_Codigo := EMP_Codigo;
  FIMP_ID := IMP_ID;
  FDadosServices := TEstabelecimento.Create(FEMP_Codigo, tidServices);
  FDadosCartorio := TEstabelecimento.Create(FEMP_Codigo, tidCartorio);
end;

destructor TImportadorBase.Destroy;
begin
  FreeAndNil(FDadosServices);
  FreeAndNil(FDadosCartorio);
  inherited;
end;

procedure TImportadorCRE.GravarContasaReceber;
var
  CRE: IContasaReceber;
  ListaRegistro: TListaRegistros;
  I: Integer;
begin
  try
    FFinanceiro := GetFinanceiro(gsAppPath);
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
  PopularFinanceiroAG;
  CRE := FFinanceiro.GetContasaReceber;
  ListaRegistro := TListaRegistros.Create;
  try
    FFinanceiro.StartTransaction;
    try
      PopularListaRegistro(ListaRegistro, FIMP_ID);
      for I := 0 to ListaRegistro.Count - 1 do
      begin
        CRE.Append;
        FRegistro := ListaRegistro[I];
        PopularContasaReceber(CRE);
        CRE.Post;
      end;
      FFinanceiro.Commit;
    finally
      FreeAndNil(ListaRegistro);
    end;
  except
    on E: Exception do
    begin
      FFinanceiro.Rollback;
      raise Exception.Create('Ocorreu um erro durante a importação dos Contas a Receber. Exceção: ' + E.Message);
    end;
  end;
end;

procedure TImportadorBase.PopularListaRegistro(ListaRegistro: TListaRegistros; IMP_ID: Integer);
var
  Registro: TRegistro;
  Query: TFDQuery;
begin
  Query := NewQuery;
  Query.Open('SELECT * FROM REG WHERE REG.EMP_CODIGO = ' + FEMP_Codigo.QuotedString + ' AND REG.IMP_ID = ' + IMP_ID.ToString);
  Registro := TRegistro.Create;
  ListaRegistro.Add(Registro);
  Registro.EMP_Codigo       := FEMP_Codigo;
  Registro.IMP_ID           := IMP_ID;
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
  Registro.CustasFechadas   := Query.FieldByName('CustasFechadas').AsInteger;
  Registro.VlrXimenesGestao := Query.FieldByName('ValorXimenesGestao').AsFloat;
  Registro.VlrXimenesAut    := Query.FieldByName('ValorXimenesAut').AsFloat;
  Registro.VlrXimenesRec    := Query.FieldByName('ValorXimenesRec').AsFloat;
  Registro.VlrXimenesOutros := Query.FieldByName('ValorXimenesOutros').AsFloat;
  Registro.Representante    := Query.FieldByName('Representante').AsString;
end;

procedure TImportadorCRE.PopularContasaReceber(ContasaReceber :IContasaReceber);
begin
  ContasaReceber.Cliente               := FRegistro.Convenio;
  //ContasaReceber.CodigoCliente         := '';
  ContasaReceber.Documento             := FRegistro.Protocolo;
  ContasaReceber.TipoGeracao           := 'C'; //Aparentemente se for Cargas, não é possível editar no AG...
  ContasaReceber.Emissao               := FRegistro.DataCadastro;
  ContasaReceber.ISS                   := 0;
  ContasaReceber.IRRF                  := 0;
  ContasaReceber.INSS                  := 0;
  ContasaReceber.PIS                   := 0;
  ContasaReceber.COFINS                := 0;
  ContasaReceber.CSLL                  := 0;
  ContasaReceber.ExportaAC             := 0;
  ContasaReceber.Obs                   := '';
  ContasaReceber.MesAno                := FormatDateTime('mmaaaa', FRegistro.DataCadastro);
  PopularVencimentosaReceber(ContasaReceber.VencimentosaReceber);
  PopularServicosaReceber(ContasaReceber.ServicosaReceber);
  PopularRateiosaReceber(ContasaReceber.RateiosaReceber);
end;

procedure TImportadorCRE.PopularVencimentosaReceber(Vencimentos: IVencimentosaReceber);
begin
  Vencimentos.Append;
  Vencimentos.Vencimento := FRegistro.DataCadastro;
  Vencimentos.Valor      := FRegistro.GetValorVencimento;
  Vencimentos.AgenteCobrador := '';//
  Vencimentos.Post;
end;

procedure TImportadorCRE.PopularServicosaReceber(Servicos: IServicosaReceber);
begin
  Servicos.Append;
  Servicos.Servico := FRegistro.SER_Codigo;
  Servicos.Modalidade := FRegistro.MDS_Codigo;
  Servicos.Valor := FRegistro.GetValorVencimento;
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
  Rateios.Valor              := FRegistro.GetValorRateioServices;//TO-DO - Valor do rateio;
  Rateios.Post;

  Rateios.Append;
  Rateios.Estabelecimento    := FDadosCartorio.EST_Codigo;
  Rateios.CentroDeResultados := FDadosCartorio.CRS_Codigo;
  Rateios.Receita            := FDadosCartorio.CRD_Codigo;
  Rateios.Observacao         := 'Rateio referente ao estabelecimento Cartório Ximenes';
  Rateios.Valor              := FRegistro.GetValorRateioCartorio;//TO-DO - Valor do rateio;
  Rateios.Post;

  //TO-DO - Falta o rateio do CPG - Perguntar ao Samuel.
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

function TRegistro.GetValorRateioServices: Double;
begin
  Result := VlrXimenesGestao;
end;

function TRegistro.GetValorVencimento: Double;
begin
  Result := Despachante + Distribuidor + VlrCartorio + VlrXimenes;
end;

class procedure TImportador.ImportarArquivo(const cEMP_Codigo, cCaminhoArquivo: String);
var
  Leitor: ILeitor;
  ImportadorCRE: TImportadorCRE;
begin
  Leitor := TLeitorCSV.Create(cEMP_Codigo);
  try
    TDBUtils.MainServer.StartTransaction;
    Leitor.LerArquivo(cCaminhoArquivo);
    ImportadorCRE := TImportadorCRE.Create(cEMP_Codigo, Leitor.IMP_ID);
    ImportadorCRE.GravarContasaReceber;
    TDBUtils.MainServer.Commit;
  except
    on E: Exception do
    begin
      TDBUtils.MainServer.Rollback;
      raise Exception.Create('Erro durante a importação: ' + E.Message);
    end;
  end;
end;

{ TImportadorCPG }

procedure TImportadorCPG.GravarContasaPagar;
var
  CPG: IContasaPagar;
  ListaRegistro: TListaRegistros;
  I: Integer;
begin
  FFinanceiro := GetFinanceiro(gsAppPath);
  PopularFinanceiroAG;
  CPG := FFinanceiro.GetContasaPagar;
  ListaRegistro := TListaRegistros.Create;
  try
    FFinanceiro.StartTransaction;
    try
      PopularListaRegistro(ListaRegistro, FIMP_ID);
      for I := 0 to ListaRegistro.Count - 1 do
      begin
        CPG.Append;
        FRegistro := ListaRegistro[I];
        PopularContasaPagar(CPG);
        CPG.Post;
      end;
      FFinanceiro.Commit;
    finally
      FreeAndNil(ListaRegistro);
    end;
  except
    on E: Exception do
    begin
      FFinanceiro.Rollback;
      raise Exception.Create('Ocorreu um erro durante a importação dos Contas a Receber. Exceção: ' + E.Message);
    end;
  end;
end;

procedure TImportadorCPG.PopularContasaPagar(ContasaPagar: IContasaPagar);
begin
  ContasaPagar.Fornecedor            := FRegistro.Convenio;
  //ContasaPagar.CodigoCliente         := '';
  ContasaPagar.Documento             := FRegistro.Protocolo;
  ContasaPagar.Emissao               := FRegistro.DataCadastro;
//  ContasaPagar.ISS                   := 0;
//  ContasaPagar.IRRF                  := 0;
//  ContasaPagar.INSS                  := 0;
//  ContasaPagar.PIS                   := 0;
//  ContasaPagar.COFINS                := 0;
//  ContasaPagar.CSLL                  := 0;
//  ContasaPagar.ExportaAC             := 0;
//  ContasaPagar.Obs                   := '';
//  ContasaPagar.MesAno                := FormatDateTime('mmaaaa', FRegistro.DataCadastro);
  PopularVencimentosaPagar(ContasaPagar.VencimentosaPagar);
end;

procedure TImportadorCPG.PopularVencimentosaPagar(Vencimentos: IVencimentosaPagar);
begin
  //Vencimentos.Append;
  //Vencimentos.Post;
end;

end.
