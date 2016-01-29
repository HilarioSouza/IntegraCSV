unit uLogger;

interface

uses KrImportador, System.Classes;

type
  TLogger = class
  private
    FLista: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Log(const Msg: String);
    procedure SaveLog(const FileName: String);
    function GetLog: String;
    function HasLog: Boolean;
    procedure Clear;
  end;

  TLoggerImport = class(TLogger)
    procedure Log(Registro: TRegistro; const Msg: String); overload;
  end;

function GetLogger: TLoggerImport;

implementation

uses
  System.SysUtils;

var
  Logger: TLoggerImport;

{ TLogger }

procedure TLogger.Clear;
begin
  FLista.Clear;
end;

constructor TLogger.Create;
begin
  FLista := TStringList.Create;
end;

destructor TLogger.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

function TLogger.GetLog: String;
begin
  Result := FLista.Text;
end;

function TLogger.HasLog: Boolean;
begin
  Result := not FLista.Text.IsEmpty;
end;

procedure TLogger.Log(const Msg: String);
begin
  FLista.Add(FormatDateTime('c.zzz', Now) + ': ' + Msg);
end;

procedure TLogger.SaveLog(const FileName: String);
begin
  FLista.SaveToFile(FileName);
end;

function GetLogger: TLoggerImport;
begin
  Result := Logger;
end;

{ TLoggerImport }

procedure TLoggerImport.Log(Registro: TRegistro; const Msg: String);
begin
  Self.Log('Linha : ' + Registro.NumLinha.ToString + ' Protocolo: ' + Registro.Protocolo + ' - ' + Msg);
end;

initialization
  Logger := TLoggerImport.Create;

finalization
  FreeAndNil(Logger);

end.
