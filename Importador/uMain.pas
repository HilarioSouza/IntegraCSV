unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uFTDI, Vcl.Menus;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Configuraes1: TMenuItem;
    Sair1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FFTDI: TFTDI;
  public
    { Public declarations }
    property FTDI: TFTDI read FFTDI write FFTDI;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  uFrmImportacao;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FFTDI := TFTDI.Create(Self, TfrmImportacao);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FFTDI);
end;

end.
