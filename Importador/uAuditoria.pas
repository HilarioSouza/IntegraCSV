unit uAuditoria;

interface

uses KrImportador;

type
  TAuditor = class
  public
    class procedure GravarAuditoria(Registro: TRegistro);
  end;

implementation

uses
  FireDAC.Comp.Client, uInterfaceQuery, uDBUtils;

{ TAuditor }

class procedure TAuditor.GravarAuditoria(Registro: TRegistro);
var
  Query: TFDQuery;
begin
  if Registro.CustasFechadas then
  begin
    Query := NewQuery('INSERT INTO AUD (EMP_CODIGO, ID, PROTOCOLO, REGISTRO) VALUES (:EMP_CODIGO, :ID, :PROTOCOLO, :REGISTRO)');
    Query.ParamByName('EMP_CODIGO').AsString := Registro.EMP_Codigo;
    Query.ParamByName('ID').AsInteger := TDBUtils.GetProxID('AUD');
    Query.ParamByName('PROTOCOLO').AsString := Registro.Protocolo;
    Query.ParamByName('REGISTRO').AsString := Registro.Linha;
  //  Query.ParamByName('DATA').AsDateTime := Now;
    Query.ExecSQL;
  end;
end;

end.
