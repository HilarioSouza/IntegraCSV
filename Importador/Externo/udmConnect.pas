unit udmConnect;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageXML,
  FireDAC.Stan.StorageJSON, FireDAC.Phys.IBBase,
  FireDAC.Phys.IB, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef;

type
  TdmConnect = class(TDataModule)
    fdConn: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfiguraConexao(User, Pass, DataBase: String);
    procedure Conectar;
  end;

var
  dmConnect: TdmConnect;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses uFuncoesIni, uMensagem, IWSystem;

{$R *.dfm}
{ TdmConnect }

procedure TdmConnect.Conectar;
var
  User, Pass, DataBase: string;
begin
  User := TFuncoesIni.LerIni('BANCO', 'User_name', 'SYSDBA');
  Pass := TFuncoesIni.LerIni('BANCO', 'Pass', 'masterkey');
  DataBase := TFuncoesIni.LerIni('BANCO', 'Database', gsAppPath + '\Dados\ImportadorAG.fdb');
  ConfiguraConexao(User, Pass, DataBase);
end;

procedure TdmConnect.ConfiguraConexao(User, Pass, DataBase: String);
begin
  if fdConn.Connected then
    fdConn.Connected := False;
  fdConn.Params.Values['User_Name'] := User;
  fdConn.Params.Values['Password'] := Pass;
  fdConn.Params.Values['Database'] := DataBase;
  fdConn.DriverName := 'FB';
  try
    fdConn.Connected := True;
  Except
    on e: Exception do
    begin
//      TMensagem.Informar('Falha na Configuração !' + #13#10 + e.Message);
    end;
  end;
end;

procedure TdmConnect.DataModuleCreate(Sender: TObject);
begin
  Conectar;
end;

end.
