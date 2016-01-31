unit uEstabelecimento;

interface

type
  TIDEstabelecimento = (tidServices, tidCartorio, tidContasaPagar);

  TEstabelecimento = class
  private
    FEST_Codigo,
    FEMP_Codigo,
    FCRS_Codigo,
    FCRD_Codigo: String;
    FTipoEst: TIDEstabelecimento;
    procedure PopularDadosEstabelecimento; virtual;
    function GetSQLCartorio: String;
    function GetSQLServices: String;
  public
    constructor Create(EMP_Codigo: String; sTipoEst: TIDEstabelecimento = tidContasaPagar);
    property EST_Codigo: String read FEST_Codigo;
    property EMP_Codigo: String read FEMP_Codigo;
    property CRS_Codigo: String read FCRS_Codigo;
    property CRD_Codigo: String read FCRD_Codigo;
    property TipoEST: TIDEstabelecimento read FTipoEst;
  end;

  TEstabelecimentoContasaPagar = class(TEstabelecimento)
  private
    FFRN_CNPJ: String;
    FTDC_Codigo: String;
    FCON_Codigo: String;
    procedure PopularDadosEstabelecimento; override;
  public
    function GetSQLContasaPagar: String;
    property FRN_CNPJ: String read FFRN_CNPJ;
    property TDC_Codigo: String read FTDC_Codigo;
    property CON_Codigo: String read FCON_Codigo;
  end;

  TServico = class
  public
    SER_Codigo: String;
    MDS_Codigo: String;
    constructor Create(const EMP_Codigo: String);
  end;

  TVencimentoCRE = class
    COB_Codigo: String;
    TDC_Codigo: String;
    constructor Create(const EMP_Codigo: String);
  end;

implementation

uses System.SysUtils, FireDAC.Comp.Client, uInterfaceQuery, uEmpresa;

{ TEstabelecimento }

constructor TEstabelecimento.Create(EMP_Codigo: String; sTipoEst: TIDEstabelecimento);
begin
  FEMP_Codigo := EMP_Codigo;
  FTipoEst := sTipoEST;
  PopularDadosEstabelecimento;
end;

function TEstabelecimento.GetSQLCartorio: String;
begin
  Result := ' select CARTORIOEST as EST, CARTORIOCRD as CRD, CARTORIOCRS as CRS from EMP where EMP.Codigo = ' + FEMP_Codigo.QuotedString;
end;

function TEstabelecimento.GetSQLServices: String;
begin
  Result := ' select SERVICESEST as EST, SERVICESCRD as CRD, SERVICESCRS as CRS from EMP where EMP.Codigo = ' + FEMP_Codigo.QuotedString;
end;

procedure TEstabelecimento.PopularDadosEstabelecimento;
var
  Query: TFDQuery;
  SQL: String;
begin
  case FTipoEst  of
    tidServices: SQL := GetSQLServices;
    tidCartorio: SQL := GetSQLCartorio;
  else
    raise Exception.Create('Tipo de estabelecimento inválido.');
  end;
  Query := NewQuery(SQL);
  Query.Open;
  FEST_Codigo := Query.FieldByName('EST').AsString;
  FCRD_Codigo := Query.FieldByName('CRD').AsString;
  FCRS_Codigo := Query.FieldByName('CRS').AsString;
  Query.Close;
end;

{ TEstabelecimentoContasaPagar }

function TEstabelecimentoContasaPagar.GetSQLContasaPagar: String;
begin
  Result := ' select CPG_EST as EST, CPG_CRD as CRD, CPG_CRS as CRS, CPG_FRN_CNPJ as FRN, ' +
            '        CPG_CON_CODIGO AS CON, CPG_TDC_CODIGO AS TDC ' +
            '   from EMP where EMP.Codigo = ' + FEMP_Codigo.QuotedString;
end;

procedure TEstabelecimentoContasaPagar.PopularDadosEstabelecimento;
var
  Query: TFDQuery;
  SQL: String;
begin
  SQL := GetSQLContasaPagar;
  Query := NewQuery(SQL);
  Query.Open;
  FEST_Codigo := Query.FieldByName('EST').AsString;
  FCRD_Codigo := Query.FieldByName('CRD').AsString;
  FCRS_Codigo := Query.FieldByName('CRS').AsString;
  FFRN_CNPJ   := Query.FieldByName('FRN').AsString;
  FCON_Codigo := Query.FieldByName('CON').AsString;
  FTDC_Codigo := Query.FieldByName('TDC').AsString;
  Query.Close;
end;

{ TServico }

constructor TServico.Create(const EMP_Codigo: String);
var
  Query: TFDQuery;
begin
  Query := NewQuery;
  if TEmpresa.GetConsultaEmpresa(EMP_Codigo, Query) then
  begin
    SER_Codigo := Query.FieldByName('SER_CODIGO').AsString;
    MDS_Codigo := Query.FieldByName('MDS_CODIGO').AsString;
  end;
end;

{ TVencimentoCRE }

constructor TVencimentoCRE.Create(const EMP_Codigo: String);
var
  Query: TFDQuery;
begin
  Query := NewQuery;
  if TEmpresa.GetConsultaEmpresa(EMP_Codigo, Query) then
  begin
    COB_Codigo := Query.FieldByName('VDR_COB_CODIGO').AsString;
    TDC_Codigo := Query.FieldByName('VDR_TDC_CODIGO').AsString;
  end;
end;

end.
