unit uEstabelecimento;

interface

type
  TIDEstabelecimento = (tidServices, tidCartorio);

  TEstabelecimento = class
  private
    FEST_Codigo,
    FEMP_Codigo: String;
    FCRS_Codigo,
    FCRD_Codigo: String;
    FTipoEst: TIDEstabelecimento;
    procedure PopularDadosEstabelecimento;
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
  Result := ' select CARTORIOEST as EST, CARTORIOCRD as CRD, CARTORIOCRS as CRS from cfg where CFG.EMP_Codigo = ' + FEMP_Codigo.QuotedString;
end;

function TEstabelecimento.GetSQLServices: String;
begin
  Result := ' select SERVICESEST as EST, SERVICESCRD as CRD, SERVICESCRS as CRS from cfg where CFG.EMP_Codigo = ' + FEMP_Codigo.QuotedString;
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

end.
