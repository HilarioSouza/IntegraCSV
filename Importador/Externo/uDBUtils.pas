unit uDBUtils;

interface

uses FireDAC.Comp.Client;

type
  TDBUtils = class
  public
    class function GetMaxID(TableName: String): Integer; static;
    class procedure SetID(Query: TFDQuery; const TableName: String); static;
  end;

implementation

uses uInterfaceQuery;

class function TDBUtils.GetMaxID(TableName: String): Integer;
var
  Query: TFDQuery;
begin
  Query := NewQuery;
  Query.Open('select max(id) as ID from ' + TableName);
  Result := Query.FieldByName('ID').AsInteger;
end;

class procedure TDBUtils.SetID(Query: TFDQuery; const TableName: String);
begin
  Query.FieldByName('ID').AsInteger := GetMaxID(TableName) + 1;
end;

end.
