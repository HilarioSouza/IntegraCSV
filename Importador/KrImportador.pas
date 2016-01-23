unit KrImportador;

interface

uses
  Classes, System.Types, System.Generics.Collections, IntfFinanceiro;

type
  ILeitor = Interface
    ['{A05F12A1-D8FF-48D2-B039-01A4A7CEECA6}']
    procedure LerArquivo(Filename: String);
  end;

//  IRegistro = Interface
//    ['{0465B2BB-5627-493B-A458-33769A4511DB}']
//    FProtocolo       : String;
//    FDataCadastro    : String;
//    FVlrXimenes      : Double;
//    FDespachante     : String;
//    FDistribuidor    : String;
//    FVlrCartorio     : Double;
//    FDAJ             : String;
//    FVlrTotalCustas  : Double;
//    FConvenio        : String;
//    FCustasFechadas  : String;
//    FVlrXimenesGestao: Double;
//    FVlrXimenesAut   : Double;
//    FVlrXimenesRec   : Double;
//    FVlrXimenesOutros: Double;
//    FRepresentante   : String;
//    //
//    property Protocolo       : String read FProtocolo        write FProtocolo       ;
//    property DataCadastro    : String read FDataCadastro     write FDataCadastro    ;
//    property VlrXimenes      : Double read FVlrXimenes       write FVlrXimenes      ;
//    property Despachante     : String read FDespachante      write FDespachante     ;
//    property Distribuidor    : String read FDistribuidor     write FDistribuidor    ;
//    property VlrCartorio     : Double read FVlrCartorio      write FVlrCartorio     ;
//    property DAJ             : String read FDAJ              write FDAJ             ;
//    property VlrTotalCustas  : Double read FVlrTotalCustas   write FVlrTotalCustas  ;
//    property Convenio        : String read FConvenio         write FConvenio        ;
//    property CustasFechadas  : String read FCustasFechadas   write FCustasFechadas  ;
//    property VlrXimenesGestao: Double read FVlrXimenesGestao write FVlrXimenesGestao;
//    property VlrXimenesAut   : Double read FVlrXimenesAut    write FVlrXimenesAut   ;
//    property VlrXimenesRec   : Double read FVlrXimenesRec    write FVlrXimenesRec   ;
//    property VlrXimenesOutros: Double read FVlrXimenesOutros write FVlrXimenesOutros;
//    property Representante   : String read FRepresentante    write FRepresentante   ;
//  end;

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
    Protocolo       : String;
    DataCadastro    : TDateTime;
    VlrXimenes      : Double;
    Despachante     : Double;
    Distribuidor    : Double;
    VlrCartorio     : Double;
    DAJ             : Double;
    VlrTotalCustas  : Double;
    Convenio        : String;
    CustasFechadas  : Integer;
    VlrXimenesGestao: Double;
    VlrXimenesAut   : Double;
    VlrXimenesRec   : Double;
    VlrXimenesOutros: Double;
    Representante   : String;
    IMP_Codigo      : Integer;
  end;

  TLeitorCSV = class(TClasseBase, ILeitor)
  private
    FEMP_Codigo: String;
    LinhaRegistro: String;
    IMP_Codigo: Integer;
    procedure PopularDadosRegistro(Registro: TRegistro);
    procedure GravarRegistrosNoBanco(ListaRegistros: TObjectList<TRegistro>);
    procedure GravarRegistro(Registro: TRegistro);
    function GravarImportacao: Integer;
  published
    procedure LerArquivo(Filename: String);
    constructor Create(const EMP_Codigo: String);
  end;

  TImportador = class
  public
    procedure GravarContasaReceber;
  end;

implementation

uses System.SysUtils, uUtils, uInterfaceQuery, FireDAC.Comp.Client, iwSystem,
  uFuncoesIni, System.Math, uDBUtils, udmConnect;

var
  FFinanceiro: IFinanceiro;

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
  Lista: TObjectList<TRegistro>;
  ArquivoAberto: Boolean;
begin
  ArquivoAberto := False;
  if (Filename = '') then
    raise Exception.Create('Arquivo n�o informado. Por favor informe o caminho do arquivo.');
  AssignFile(Arquivo, FileName);
  try
    TDBUtils.MainServer.StartTransaction;
    try
      IMP_Codigo := GravarImportacao;
      Lista := TObjectList<TRegistro>.Create;
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
      TDBUtils.MainServer.Commit;
    finally
      if ArquivoAberto then
        CloseFile(Arquivo);
    end;
  except
    on E: Exception do
    begin
      TDBUtils.MainServer.Rollback;
      raise Exception.Create('Erro: ' + E.Message);
    end;
  end;
end;

procedure TLeitorCSV.GravarRegistrosNoBanco(ListaRegistros: TObjectList<TRegistro>);
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
        ' ValorXimenesOutros, Representante, IMP_Codigo) '+
        ' values (:EMP_Codigo, :ID, :Protocolo, :DataCadastro, :VlrXimenes, :Despachante, :Distribuidor, :VlrCartorio, :DAJ, '+
        ' :VlrTotalCustas, :Convenio, :CustasFechadas, :VlrXimenesGestao, :VlrXimenesAut, :VlrXimenesRec, '+
        ' :VlrXimenesOutros, :Representante, :IMP_Codigo)';
var
  Query: TFDQuery;
begin
  Query := NewQuery;
  Query.SQL.Text := SQL;
  Query.ParamByName('EMP_Codigo').AsString := Registro.EMP_Codigo;
  Query.ParamByName('ID').AsInteger := TDBUtils.GetProxID('REG');
  Query.ParamByName('IMP_Codigo').AsInteger := Registro.IMP_Codigo;
  Query.ParamByName('Protocolo').AsString := Registro.Protocolo;
  Query.ParamByName('DataCadastro').AsDateTime := Registro.DataCadastro;
  Query.ParamByName('VlrXimenes').AsFloat := Registro.VlrXimenes;
  Query.ParamByName('Despachante').AsFloat := Registro.Despachante;
  Query.ParamByName('Distribuidor').AsFloat := Registro.Distribuidor;
  Query.ParamByName('VlrCartorio').AsFloat := Registro.VlrCartorio;
  Query.ParamByName('DAJ').AsFloat := Registro.DAJ;
  Query.ParamByName('VlrTotalCustas').AsFloat := Registro.VlrTotalCustas;
  Query.ParamByName('Convenio').AsString := Registro.Convenio;
  Query.ParamByName('CustasFechadas').AsInteger := Registro.CustasFechadas;
  Query.ParamByName('VlrXimenesGestao').AsFloat := Registro.VlrXimenesGestao;
  Query.ParamByName('VlrXimenesAut').AsFloat := Registro.VlrXimenesAut;
  Query.ParamByName('VlrXimenesRec').AsFloat := Registro.VlrXimenesRec;
  Query.ParamByName('VlrXimenesOutros').AsFloat := Registro.VlrXimenesOutros;
  Query.ParamByName('Representante').AsString := Registro.Representante;
  Query.ExecSQL;
end;

procedure TLeitorCSV.PopularDadosRegistro(Registro: TRegistro);
var
  ArrayDados: TStringDynArray;
begin
  ArrayDados := TUtil.Split(LinhaRegistro, ';');
  Registro.EMP_Codigo       := FEMP_Codigo; //Tratar
  Registro.IMP_Codigo       := IMP_Codigo;
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

function GetEnderecoBanco: String;
begin
  Result := TFuncoesIni.LerIni('BANCO', 'Database');
end;

function GetFinanceiroAG: IFinanceiro;
begin
  FFinanceiro := GetFinanceiro(gsAppPath);
  FFinanceiro.Empresa := '0001';
  FFinanceiro.DriverNameBanco := '';
  FFinanceiro.UsuarioBanco := '';
  FFinanceiro.SenhaBanco := '';
  FFinanceiro.Open(GetEnderecoBanco);
end;

procedure TImportador.GravarContasaReceber;
var
  CRE: IContasaReceber;
begin
  CRE := FFinanceiro.GetContasaReceber;
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

end.
