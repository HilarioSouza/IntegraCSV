unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uFTDI, Vcl.Menus, IntfFormPrincipal;

type
  TfrmMain = class(TForm, IFormprincipal)
    MainMenu1: TMainMenu;
    Configuraes1: TMenuItem;
    Sair1: TMenuItem;
    Cadastros1: TMenuItem;
    Empresa1: TMenuItem;
    Banco1: TMenuItem;
    Movimentos1: TMenuItem;
    Importao1: TMenuItem;
    Preferncias1: TMenuItem;
    Relatrio1: TMenuItem;
    Importaes1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Banco1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Importao1Click(Sender: TObject);
    procedure Preferncias1Click(Sender: TObject);
    procedure Importaes1Click(Sender: TObject);
  private
    { Private declarations }
    FFTDI: TFTDI;
    procedure SetFTDI(const Value: TFTDI);
    function GetFTDI: TFTDI;
    procedure AbrirConfiguracaobanco;
    procedure Atualizarbanco;
  public
    { Public declarations }
    property FTDI: TFTDI read GetFTDI write SetFTDI;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  uFrmImportacao, uFrmCdEmp, ufConfiguracaoBD, uAtualizaBanco, uFrmPreferencias,
  uFrmOiRlImport, uUtils;

{$R *.dfm}

procedure TfrmMain.Banco1Click(Sender: TObject);
begin
  AbrirConfiguracaoBanco;
end;

procedure TfrmMain.Empresa1Click(Sender: TObject);
begin
  FFTDI.GetTDI.MostrarFormulario(TfrmCdEmp, False);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FFTDI := TFTDI.Create(Self, nil);//TfrmImportacao);
  frmMain.Caption := frmMain.Caption + ' - Vers�o: ' + TUtil.GetVersionInfo('FileVersion');
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FFTDI);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  AtualizarBanco;
end;

procedure TfrmMain.Atualizarbanco;
var
  AtualizaBD: TAtualizabanco;
begin
  AtualizaBD := TAtualizaBanco.Create;
  try
    AtualizaBD.AtualizarBanco;
  finally
    FreeAndNil(AtualizaBD);
  end;
end;

function TfrmMain.GetFTDI: TFTDI;
begin
  Result := FFTDI;
end;

procedure TfrmMain.Importaes1Click(Sender: TObject);
var
  OiRlImport: TfrmOiRlImport;
begin
  OiRlImport := TfrmOiRlImport.Create(nil);
  try
    OiRlImport.ShowModal;
  finally
    FreeAndNil(OiRlImport);
  end;
end;

procedure TfrmMain.Importao1Click(Sender: TObject);
begin
  FFTDi.GetTDI.MostrarFormulario(TfrmImportacao, False);
end;

procedure TfrmMain.Preferncias1Click(Sender: TObject);
begin
  FFTDi.GetTDI.MostrarFormulario(TfrmPreferencias, False);
end;

procedure TfrmMain.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.SetFTDI(const Value: TFTDI);
begin
  Self.FTDI := Value;
end;

procedure TfrmMain.AbrirConfiguracaobanco;
var
  FrmConfig: TfConfiguracaoBD;
begin
  FrmConfig := TfConfiguracaoBD.Create(nil);
  try
    FrmConfig.ShowModal;
  finally
    FreeAndNil(FrmConfig);
  end;
end;

end.
