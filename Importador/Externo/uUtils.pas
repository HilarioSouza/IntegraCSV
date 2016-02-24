unit uUtils;

interface

uses System.SysUtils, System.Types, Vcl.Controls;

type
  TUtil = class
  public
    class function Parse(S: string; Count: Integer; char: String = ';'): string;
    class function TrocarCaracteres(Old, New, aFonte: String): String;
    class function IIf(Expressao, ParteTRUE, ParteFALSE: Variant): Variant;
    class function TrocaVirgPPto(Valor: string): String;
    class function LPad(S: string; Ch: char; Len: Integer): string;
    class function Split(const aStr: string; aSeparator: char = '|'): TStringDynArray;
    class function GetOnlyNumbers(const Text: String): String;
    class function FormatarData(const Data: TDateTime; Formato: String = 'dd/mm/yyyy'): String;
    class function FormatarDataSQL(const Data: TDateTime; Formato: String = 'yyyy-mm-dd'): String;
    class function GetVersionInfo(aIdent: String): String;
  end;

  TUtilArquivo = class
  public
    class function GetCaminhoArquivo(const InitialDir: String = ''): String; static;
  end;

  TControlUtils = class
  public
    class procedure TryFocus(Control: TWinControl);
  end;

implementation

uses
  Dialogs, Winapi.Windows, System.Classes, Math;

class function TUtil.Parse(S: string; Count: Integer;
  char: String = ';'): string;
var
  I: Integer;
  T: string;
begin
  if S[Length(S)] <> char then
    S := S + char;
  for I := 1 to Count do
  begin
    T := Copy(S, 0, Pos(char, S) - 1);
    S := Copy(S, Pos(char, S) + 1, Length(S));
  end;
  Result := T;
end;

class function TUtil.TrocarCaracteres(Old, New, aFonte: String): String;
begin
  Result := StringReplace(aFonte, Old, New, [rfReplaceAll, rfIgnoreCase]);
end;

class function TUtil.TrocaVirgPPto(Valor: string): String;
var
  I: Integer;
begin
  if Valor <> '' then
  begin
    for I := 0 to Length(Valor) do
    begin
      if Valor[I] = ',' then
        Valor[I] := '.';
    end;
  end;
  Result := Valor;
end;

class function TUtil.FormatarData(const Data: TDateTime; Formato: String): String;
begin
  Result := FormatDateTime(Formato, Data);
end;

class function TUtil.FormatarDataSQL(const Data: TDateTime; Formato: String): String;
begin
  Result := FormatarData(Data, Formato).QuotedString;
end;

class function TUtil.GetOnlyNumbers(const Text: String): String;
var
  I: Integer;
begin
  Result := '';
  if Text.IsEmpty then
    Exit;
  for I := Low(Text) to High(Text) do
  begin
    if CharInSet(Text[I],['0'..'9']) then
      Result := Result + Text[I];
  end;
end;

class function TUtil.GetVersionInfo(aIdent: String): String;
type
  TLang = packed record
    Lng, Page: WORD;
  end;

  TLangs = array [0 .. 10000] of TLang;

  PLangs = ^TLangs;

var
  BLngs: PLangs;
  BLngsCnt: Cardinal;
  BLangId: String;
  RM: TMemoryStream;
  RS: TResourceStream;
  BP: PChar;
  BL: Cardinal;
  BId: String;

begin
  // Assume error
  Result := '';

  RM := TMemoryStream.Create;
  try
    // Load the version resource into memory
    RS := TResourceStream.CreateFromID(HInstance, 1, RT_VERSION);
    try
      RM.CopyFrom(RS, RS.Size);
    finally
      FreeAndNil(RS);
    end;

    // Extract the translations list
    if not VerQueryValue(RM.Memory, '\\VarFileInfo\\Translation', Pointer(BLngs), BL) then
      Exit; // Failed to parse the translations table
    BLngsCnt := BL div sizeof(TLang);
    if BLngsCnt <= 0 then
      Exit; // No translations available

    // Use the first translation from the table (in most cases will be OK)
    with BLngs[0] do
      BLangId := IntToHex(Lng, 4) + IntToHex(Page, 4);

    // Extract field by parameter
    BId := '\\StringFileInfo\\' + BLangId + '\\' + AIdent;
    if not VerQueryValue(RM.Memory, PChar(BId), Pointer(BP), BL) then
      Exit; // No such field

    // Prepare result
    Result := BP;
  finally
    FreeAndNil(RM);
  end;
end;

class function TUtil.IIf(Expressao: Variant;
  ParteTRUE, ParteFALSE: Variant): Variant;
begin
  if Expressao then
    Result := ParteTRUE
  else
    Result := ParteFALSE;
end;

class function TUtil.LPad(S: string; Ch: char; Len: Integer): string;
var
  RestLen: Integer;
begin
  Result := S;
  RestLen := Len - Length(S);
  if RestLen < 1 then
    Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;

class function TUtil.Split(const aStr: string; aSeparator: char = '|'): TStringDynArray;
var
  I, Count, Last, Index: Integer;
begin
  if aStr = '' then
  begin
    SetLength(Result, 0);
    Exit;
  end;

  Count := 1;
  for I := 1 to Length(aStr) do
    if aStr[I] = aSeparator then
      Inc(Count);

  SetLength(Result, Count);
  Index := 0;
  I := 1;

  while I <= Length(aStr) do
  begin
    Last := I;
    while (I <= Length(aStr)) and (aStr[I] <> aSeparator) do
      Inc(I);
    Result[Index] := Copy(aStr, Last, I - Last);
    Inc(I);
    Inc(Index);
  end;
end;

class function TUtilArquivo.GetCaminhoArquivo(const InitialDir: String = ''): String;
var
  odlCaminho: TOpenDialog;
begin
  odlCaminho := TOpenDialog.Create(nil);
  try
    if not InitialDir.IsEmpty then
      odlCaminho.InitialDir := InitialDir;
    odlCaminho.Filter := '*.csv';
    odlCaminho.FilterIndex := 1;
    odlCaminho.Execute;
    if (odlCaminho.FileName = '') then
      Result := InitialDir
    else
      Result := odlCaminho.FileName;
  finally
    FreeAndNil(odlCaminho);
  end;
end;

{ TControlUtil }

class procedure TControlUtils.TryFocus(Control: TWinControl);
begin
  try
    if Control.CanFocus then
      Control.SetFocus;
  except
    //Nada a fazer;
  end;
end;

end.
