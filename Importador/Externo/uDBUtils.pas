unit uDBUtils;

interface

uses FireDAC.Comp.Client;

type
  TDBUtils = class
  public
    class function GetProxID(TableName: String): Integer; static;
    class function GetMaxID(TableName: String): Integer; static;
    class procedure SetID(Query: TFDQuery; const TableName: String); static;
    class function MainServer: TFDConnection;
    class procedure QueryExecute(const SQL: String);
    class function ExisteRegistro(const SQL: String): Boolean;
    class procedure RefreshQuery(Query: TFDQuery);
  end;

implementation

uses uInterfaceQuery, udmConnect, System.SysUtils;

class function TDBUtils.GetMaxID(TableName: String): Integer;
var
  Query: TFDQuery;
begin
  Query := NewQuery;
  Query.Open('select max(id) as ID from ' + TableName);
  Result := Query.FieldByName('ID').AsInteger;
end;

class function TDBUtils.GetProxID(TableName: String): Integer;
begin
  Result := GetMaxID(TableName) + 1;
end;

class function TDBUtils.MainServer: TFDConnection;
begin
  Result := dmConnect.fdConn;
end;

class function TDBUtils.ExisteRegistro(const SQL: String): Boolean;
var
  Query: TFDQuery;
begin
  Query := NewQuery(SQL);
  Query.Open;
  Result := not Query.Eof;
end;

class procedure TDBUtils.QueryExecute(const SQL: String);
var
  Query: TFDQuery;
begin
  Query := NewQuery(SQL);
  Query.ExecSQL;
end;

class procedure TDBUtils.RefreshQuery(Query: TFDQuery);
begin
  try
  if Query <> nil then
  begin
    if Query.Active then
      Query.Refresh
    else
      Query.Open;
  end;
  except
    on E: Exception do
      raise Exception.Create('Não foi possível atualizar a query. Exceção: ' + E.message);
  end;
end;

class procedure TDBUtils.SetID(Query: TFDQuery; const TableName: String);
begin
  Query.FieldByName('ID').AsInteger := GetProxID(TableName);
end;

end.
