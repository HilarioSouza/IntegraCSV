unit uFrmCdEmp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCrudBasic;

type
  TfrmCdEmp = class(TfrmCrudbasic)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCdEmp: TfrmCdEmp;

implementation

{$R *.dfm}

uses uMain;

procedure TfrmCdEmp.FormCreate(Sender: TObject);
begin
  Self.fPrincipal := frmMain;
end;

end.
