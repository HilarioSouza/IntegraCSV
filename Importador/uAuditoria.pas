unit uAuditoria;

interface

uses KrImportador;

type
  TAuditor = class
  public
    class procedure GravarAuditoria(Lista: TListaRegistros; const IMP_ID: Integer);
  end;

  TDadosAuditoria = class
  private
    FRegistro: TRegistro;
    function ImportacaoExiste: Boolean;
  public
    Empresa: String;
    ID_Importacao: Integer;
    RegistroOriginal: String;
    Data: TDateTime;
    Existe: Boolean;
    constructor Create(Registro: TRegistro);
  end;

implementation

uses
  FireDAC.Comp.Client, uInterfaceQuery, uDBUtils, System.SysUtils;

{ TAuditor }

class procedure TAuditor.GravarAuditoria(Lista: TListaRegistros; const IMP_ID: Integer);
var
  Query: TFDQuery;
  aRegistro: TRegistro;
  I: Integer;
begin
  for I := 0 to Lista.Count - 1 do
  begin
    aRegistro := Lista[I];
    if aRegistro.CustasFechadas then
    begin
      Query := NewQuery('INSERT INTO AUD (EMP_CODIGO, ID, PROTOCOLO, REGISTRO, DATA, IMP_ID) ' +
                         '        VALUES (:EMP_CODIGO, :ID, :PROTOCOLO, :REGISTRO, :DATA, :IMP_ID)');
      Query.ParamByName('EMP_CODIGO').AsString := aRegistro.EMP_Codigo;
      Query.ParamByName('ID').AsInteger := TDBUtils.GetProxID('AUD');
      Query.ParamByName('PROTOCOLO').AsString := aRegistro.Protocolo;
      Query.ParamByName('REGISTRO').AsString := aRegistro.Linha;
      Query.ParamByName('DATA').AsDateTime := Now;
      Query.ParamByName('IMP_ID').AsInteger := IMP_ID;
      Query.ExecSQL;
    end;
  end;
end;

{ TDadosAuditoria}

constructor TDadosAuditoria.Create(Registro: TRegistro);
var
  Query: TFDQuery;
begin
  FRegistro := Registro;
  Query := NewQuery;
  Query.Open(' SELECT * FROM AUD WHERE AUD.EMP_CODIGO = ' + FRegistro.EMP_Codigo.QuotedString +
             '    AND AUD.PROTOCOLO = ' + FRegistro.Protocolo.QuotedString);
  Query.First;
  ID_Importacao := Query.FieldByName('IMP_ID').AsInteger;
  Existe := (not Query.Eof) and ImportacaoExiste;
  if Existe then
  begin
    Data := Query.FieldByName('DATA').AsDateTime;
    RegistroOriginal := Query.FieldByName('REGISTRO').AsString;
  end;
end;

function TDadosAuditoria.ImportacaoExiste: Boolean;
const
  cSQL = ' SELECT COUNT(ID) FROM IMP WHERE IMP.EMP_CODIGO = :EMP_CODIGO AND IMP.ID = :IMP_ID ';
var
  Query: TFDQuery;
begin
  Query := NewQuery;
  Query.SQL.Text := cSQL;
  Query.ParamByName('EMP_CODIGO').AsString := FREgistro.EMP_Codigo;
  Query.ParamByName('IMP_ID').AsInteger := ID_Importacao;
  Query.Open;
  Result := Query.FieldByName('COUNT').AsInteger = 1;
end;

end.
