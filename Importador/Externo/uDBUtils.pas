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
  end;

implementation

uses uInterfaceQuery, udmConnect;

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

class procedure TDBUtils.SetID(Query: TFDQuery; const TableName: String);
begin
  Query.FieldByName('ID').AsInteger := GetProxID(TableName);
end;

end.
