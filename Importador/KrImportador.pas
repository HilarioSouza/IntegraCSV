unit KrImportador;

interface

uses
  Classes, System.Types;

type
  ILeitor = Interface
    ['{A05F12A1-D8FF-48D2-B039-01A4A7CEECA6}']
    procedure LerArquivo(Filename: String);
  end;

//  IRegistro = Interface
//    ['{0465B2BB-5627-493B-A458-33769A4511DB}']
//    FProtocolo       : String;
//    FDataCadastro    : String;
//    FVlrXimenes      : Double;
//    FDespachante     : String;
//    FDistribuidor    : String;
//    FVlrCartorio     : Double;
//    FDAJ             : String;
//    FVlrTotalCustas  : Double;
//    FConvenio        : String;
//    FCustasFechadas  : String;
//    FVlrXimenesGestao: Double;
//    FVlrXimenesAut   : Double;
//    FVlrXimenesRec   : Double;
//    FVlrXimenesOutros: Double;
//    FRepresentante   : String;
//    //
//    property Protocolo       : String read FProtocolo        write FProtocolo       ;
//    property DataCadastro    : String read FDataCadastro     write FDataCadastro    ;
//    property VlrXimenes      : Double read FVlrXimenes       write FVlrXimenes      ;
//    property Despachante     : String read FDespachante      write FDespachante     ;
//    property Distribuidor    : String read FDistribuidor     write FDistribuidor    ;
//    property VlrCartorio     : Double read FVlrCartorio      write FVlrCartorio     ;
//    property DAJ             : String read FDAJ              write FDAJ             ;
//    property VlrTotalCustas  : Double read FVlrTotalCustas   write FVlrTotalCustas  ;
//    property Convenio        : String read FConvenio         write FConvenio        ;
//    property CustasFechadas  : String read FCustasFechadas   write FCustasFechadas  ;
//    property VlrXimenesGestao: Double read FVlrXimenesGestao write FVlrXimenesGestao;
//    property VlrXimenesAut   : Double read FVlrXimenesAut    write FVlrXimenesAut   ;
//    property VlrXimenesRec   : Double read FVlrXimenesRec    write FVlrXimenesRec   ;
//    property VlrXimenesOutros: Double read FVlrXimenesOutros write FVlrXimenesOutros;
//    property Representante   : String read FRepresentante    write FRepresentante   ;
//  end;

  TClasseBase = class(TPersistent)
  private
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
  end;

  TRegistro = class(TClasseBase)
  public
    Protocolo       : String;
    DataCadastro    : String;
    VlrXimenes      : Double;
    Despachante     : String;
    Distribuidor    : String;
    VlrCartorio     : Double;
    DAJ             : String;
    VlrTotalCustas  : Double;
    Convenio        : String;
    CustasFechadas  : String;//Boolean? Double?
    VlrXimenesGestao: Double;
    VlrXimenesAut   : Double;
    VlrXimenesRec   : Double;
    VlrXimenesOutros: Double;
    Representante   : String;
  end;

  TLeitorCSV = class(TClasseBase, ILeitor)
  private
    LinhaRegistro: String;
    procedure PopularObjetoComRegistro(Registro: TRegistro);
    function Split(const aStr: string; aSeparator: char = '|'): TStringDynArray;
  published
    procedure LerArquivo(Filename: String);
  end;

implementation

uses SysUtils, System.Generics.Collections;

const
  IdxProtocolo        = 0;
  IdxDataCadastro     = 1;
  IdxVlrXimenes       = 2;
  IdxDespachante      = 3;
  IdxDistribuidor     = 4;
  IdxVlrCartorio      = 5;
  IdxDAJ              = 6;
  IdxVlrTotalCustas   = 7;
  IdxConvenio         = 8;
  IdxCustasFechadas   = 9;
  IdxVlrXimenesGestao = 10;
  IdxVlrXimenesAut    = 11;
  IdxVlrXimenesRec    = 12;
  IdxVlrXimenesOutros = 13;
  IdxRepresentante    = 14;

{ TLeitorCSV }

procedure TLeitorCSV.LerArquivo(Filename: String);
var
  Registro: TRegistro;
  Arquivo: Textfile;
  Lista: TObjectList<TRegistro>;
begin
  AssignFile(Arquivo, FileName);
  try
  Lista := TObjectList<TRegistro>.Create;
    FileMode := fmOpenRead;
    Reset(Arquivo);
    while not Eof(Arquivo) do
    begin
      Readln(Arquivo, LinhaRegistro);
      Registro := TRegistro.Create;
      Lista.Add(TRegistro(Registro));
      PopularObjetoComRegistro(Registro);
    end;
  finally
    CloseFile(Arquivo);
  end;
end;

procedure TLeitorCSV.PopularObjetoComRegistro(Registro: TRegistro);
var
  ArrayDados: TStringDynArray;
begin
  ArrayDados := Self.Split(LinhaRegistro, ';');
  Registro.Protocolo        := ArrayDados[IdxProtocolo];
  Registro.DataCadastro     := ArrayDados[IdxDataCadastro];
  Registro.VlrXimenes       := StrToFloatDef(ArrayDados[IdxVlrXimenes], 0);
  Registro.Despachante      := ArrayDados[IdxDespachante];
  Registro.Distribuidor     := ArrayDados[IdxDistribuidor];
  Registro.VlrCartorio      := StrToFloatDef(ArrayDados[IdxVlrCartorio], 0);
  Registro.DAJ              := ArrayDados[IdxDAJ];
  Registro.VlrTotalCustas   := StrToFloatDef(ArrayDados[IdxVlrTotalCustas], 0);
  Registro.Convenio         := ArrayDados[IdxConvenio];
  Registro.CustasFechadas   := ArrayDados[IdxCustasFechadas];
  Registro.VlrXimenesGestao := StrToFloatDef(ArrayDados[IdxVlrXimenesGestao], 0);
  Registro.VlrXimenesAut    := StrToFloatDef(ArrayDados[IdxVlrXimenesAut], 0);
  Registro.VlrXimenesRec    := StrToFloatDef(ArrayDados[IdxVlrXimenesRec], 0);
  Registro.VlrXimenesOutros := StrToFloatDef(ArrayDados[IdxVlrXimenesOutros], 0);
  Registro.Representante    := ArrayDados[IdxRepresentante];
end;

{ TClasseBase }

function TClasseBase._AddRef: Integer;
begin
  Result := 0;
end;

function TClasseBase._Release: Integer;
begin
  Result := 0;
end;

function TClasseBase.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin
  Result := 0;
end;

function TLeitorCSV.Split(const aStr: string; aSeparator: char = '|'): TStringDynArray;
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

//Utilidades - Remover?
function TokenN(aTokenList: String; aIndex: Integer; aTokenSeparator: char = ';'): String;
var
  i,m,count:integer;
begin
  Result:='';
  count:=0;
  i:=1;
  while i<=Length(aTokenList) do
  begin
    m:=i;
    while (i<=Length(aTokenList)) and (aTokenList[i]<>aTokenSeparator) do
      Inc(i);
    Inc(count);
    if count=aIndex then
    begin
      Result:=Copy(aTokenList,m,i-m);
      Break;
    end;
    Inc(i);
  end;
end;

end.
