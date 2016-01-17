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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
  private
    { Private declarations }
    FFTDI: TFTDI;
    procedure SetFTDI(const Value: TFTDI);
    function GetFTDI: TFTDI;
  public
    { Public declarations }
    property FTDI: TFTDI read GetFTDI write SetFTDI;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  uFrmImportacao, uFrmCdEmp;

{$R *.dfm}

procedure TfrmMain.Empresa1Click(Sender: TObject);
begin
  FFTDI.GetTDI.MostrarFormulario(TfrmCdEmp, False);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FFTDI := TFTDI.Create(Self, TfrmImportacao);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FFTDI);
end;

function TfrmMain.GetFTDI: TFTDI;
begin
  Result := FFTDI;
end;

procedure TfrmMain.SetFTDI(const Value: TFTDI);
begin
  Self.FTDI := Value;
end;

end.
