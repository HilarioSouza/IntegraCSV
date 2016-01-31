unit uEmpresa;

interface

uses
  FireDAC.Comp.Client, uEstabelecimento;

type

  TEmpresa = class
  private
    FCodigo          : String;
    FEST_Services    : TEstabelecimento;
    FEST_Cartorio    : TEstabelecimento;
    FEST_ContasaPagar: TEstabelecimentoContasaPagar;
    FServico         : TServico;
    FVencimento      : TVencimentoCRE;
  public
    constructor Create(const EMP_Codigo: String);
    destructor Destroy; override;
    class function GetConsultaEmpresa(const EMP_Codigo: String; Query: TFDQuery): Boolean;
  end;

  TValidadorEmpresa = class
    class function ValidarParametrizacaoEmpresa(const EMP_Codigo: String): Boolean;
  end;

implementation

uses
  System.SysUtils, uInterfaceQuery;

{ TValidador }

class function TValidadorEmpresa.ValidarParametrizacaoEmpresa(const EMP_Codigo: String): Boolean;
var
  Empresa: TEmpresa;
begin
  Result := True;
  try
    Empresa.Create(EMP_Codigo);
  finally
    FreeAndNil(Empresa);
  end;
end;

{ TEmpresa }

constructor TEmpresa.Create(const EMP_Codigo: String);
begin
  FCodigo := EMP_Codigo;
  FEST_Services := TEstabelecimento.Create(FCodigo, tidServices);
  FEST_Cartorio := TEstabelecimento.Create(FCodigo, tidCartorio);
  FEST_ContasaPagar := TEstabelecimentoContasaPagar.Create(FCodigo);
  FServico := TServico.Create(FCodigo);
  FVencimento := TVencimentoCRE.Create(FCodigo);
end;

destructor TEmpresa.Destroy;
begin
  FreeAndNil(FEST_Services);
  FreeAndNil(FEST_Cartorio);
  FreeAndNil(FEST_ContasaPagar);
  FreeAndNil(FServico);
  FreeAndNil(FVencimento);
  inherited;
end;

class function TEmpresa.GetConsultaEmpresa(const EMP_Codigo: String; Query: TFDQuery): Boolean;
const
  SQL = ' SELECT * FROM EMP WHERE EMP.CODIGO = ';
begin
  Query.SQL.Text := SQL + EMP_Codigo.QuotedString;
  Query.Open;
  Result := Query.RecordCount > 0;
end;

end.
