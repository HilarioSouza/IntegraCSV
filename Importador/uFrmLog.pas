unit uFrmLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmStandard, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmLog = class(TfrmStandard)
    mmoLog: TMemo;
    pnlButtons: TPanel;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnlButtonsResize(Sender: TObject);
  private
    function GetText: String;
    procedure SetText(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property Text: String read GetText write SetText;
  end;

var
  frmLog: TfrmLog;

implementation

{$R *.dfm}

procedure TfrmLog.btnOkClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

function TfrmLog.GetText: String;
begin
  Result := mmoLog.Text;
end;

procedure TfrmLog.pnlButtonsResize(Sender: TObject);
begin
  inherited;
  btnOk.Left := Trunc((frmLog.Width / 2) + 40);
end;

procedure TfrmLog.SetText(const Value: String);
begin
  mmoLog.Text := Value;
end;

end.
