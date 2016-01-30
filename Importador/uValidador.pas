unit uValidador;

interface

uses
  uEstabelecimento;

type

  TEmpresa = class
  private
    FCodigo: String;
    FEST_Services: TEstabelecimento;
    FEST_Cartorio: TEstabelecimento;
    FEST_ContasaPagar: TEstabelecimentoContasaPagar;
    FServico: TServico;
    FVencimento: TVencimentoCRE;
    procedure Popular;
  public
    constructor Create(const EMP_Codigo: String);
  end;

  TValidadorEmpresa = class
    class function ValidarParametrizacaoEmpresa(const EMP_Codigo: String): Boolean;
  end;

implementation

uses
  FireDAC.Comp.Client, System.SysUtils, uInterfaceQuery;

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
  Popular;
end;

procedure TEmpresa.Popular;
const
  SQL = ' SELECT * FROM EMP WHERE EMP.CODIGO = ';
var
  Query: TFDQuery;
begin
  Query := NewQuery(SQL + FCodigo.QuotedString);
  Query.Open;



end;

end.
