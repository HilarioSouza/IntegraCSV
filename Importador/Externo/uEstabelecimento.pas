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
    constructor Create(EMP_Codigo: String; sTipoEst: TIDEstabelecimento);
    property EST_Codigo: String read FEST_Codigo;
    property EMP_Codigo: String read FEMP_Codigo;
    property CRS_Codigo: String read FCRS_Codigo;
    property CRD_Codigo: String read FCRD_Codigo;
    property TipoEST: TIDEstabelecimento read FTipoEst;
  end;

  TEstabelecimentoContasaPagar = class(TEstabelecimento)
  private
    FFRN_Codigo: String;
    procedure PopularDadosEstabelecimento; override;
  public
    function GetSQLContasaPagar: String;
    property FRN_Codigo: String read FFRN_Codigo;
  end;

  TServico = class
    SER_Codigo: String;
    MDS_Codigo: String;
  end;

  TVencimentoCRE = class
    COB_Codigo: String;
    TDC_Codigo: String;
  end;

implementation

uses System.SysUtils, FireDAC.Comp.Client, uInterfaceQuery;

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
    raise Exception.Create('Tipo de estabelecimento inv�lido.');
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
  Result := ' select CPG_EST as EST, CPG_CRD as CRD, CPG_CRS as CRS, CPG_FRN_CNPJ as FRN from EMP where EMP.Codigo = ' + FEMP_Codigo.QuotedString;
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
  FCRS_Codigo := Query.FieldByName('FRN').AsString;
  Query.Close;
end;

end.
