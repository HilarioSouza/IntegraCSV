unit ufrmStandard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IntfFormPrincipal;

type
  TfrmStandard = class(TForm)
  private
    { Private declarations }
  protected
    procedure Sair;
  public
    { Public declarations }
  end;

var
  frmStandard: TfrmStandard;

implementation

{$R *.dfm}

uses uMain, Vcl.ComCtrls;

{ TfrmStandard }

procedure TfrmStandard.Sair;
const
  WM_CLOSE_TAB = WM_USER + 1;
begin
  PostMessage(frmMain.FTDI.GetHandleTDI, WM_CLOSE_TAB,
    TPageControl(Self.parent.parent).ActivePage.pageindex, 0);
end;

end.
