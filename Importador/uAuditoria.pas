unit uAuditoria;

interface

uses KrImportador;

type
  TAuditor = class
  public
    class procedure GravarAuditoria(Movimento: IMovimentoFinanceiro);
  end;

  TDadosAuditoria = class
  public
    Empresa: String;
    RegistroOriginal: String;
    Data: TDateTime;
    ID_Importacao: Integer;
    Existe: Boolean;
    constructor Create(const EMP_Codigo: String; const IMP_ID: Integer);
  end;

implementation

uses
  FireDAC.Comp.Client, uInterfaceQuery, uDBUtils, System.SysUtils;

{ TAuditor }

class procedure TAuditor.GravarAuditoria(Movimento: IMovimentoFinanceiro);
var
  Query: TFDQuery;
  aRegistro: TRegistro;
begin
  aRegistro := Movimento.Registro;
  if aRegistro.CustasFechadas then
  begin
    Query := NewQuery('INSERT INTO AUD (EMP_CODIGO, ID, PROTOCOLO, REGISTRO, DATA, TIPO) ' +
                       '        VALUES (:EMP_CODIGO, :ID, :PROTOCOLO, :REGISTRO, :DATA, :TIPO)');
    Query.ParamByName('EMP_CODIGO').AsString := aRegistro.EMP_Codigo;
    Query.ParamByName('ID').AsInteger := TDBUtils.GetProxID('AUD');
    Query.ParamByName('PROTOCOLO').AsString := aRegistro.Protocolo;
    Query.ParamByName('REGISTRO').AsString := aRegistro.Linha;
    Query.ParamByName('DATA').AsDateTime := Now;
    Query.ParamByName('TIPO').AsString := Movimento.GetTipo;
    Query.ExecSQL;
  end;
end;

{ TDadosAuditoria}

constructor TDadosAuditoria.Create(const EMP_Codigo: String; const IMP_ID: Integer);
var
  Query: TFDQuery;
begin
  Empresa := EMP_Codigo;
  ID_Importacao := IMP_ID;
  Query := NewQuery;
  Query.Open(' SELECT * FROM AUD WHERE AUD.EMP_CODIGO = ' + EMP_Codigo.QuotedString +
             '    AND AUD.ID = ' + IMP_ID.ToString.QuotedString +
             '    AND AUD.TIPO =''CRE'' ');
  Query.First;
  Existe := not Query.Eof;
  if Existe then
  begin
    Data := Query.FieldByName('DATA').AsDateTime;
    RegistroOriginal := Query.FieldByName('REGISTRO').AsString;
  end;
end;

end.
