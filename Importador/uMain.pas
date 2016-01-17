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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Banco1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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
  uFrmImportacao, uFrmCdEmp, ufConfiguracaoBD, uAtualizaBanco;

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
  FFTDI := TFTDI.Create(Self, TfrmImportacao);
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
