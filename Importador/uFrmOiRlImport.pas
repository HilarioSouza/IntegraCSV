unit uFrmOiRlImport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmStandard, Vcl.StdCtrls;

type
  TfrmOiRlImport = class(TfrmStandard)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOiRlImport: TfrmOiRlImport;

implementation

{$R *.dfm}

uses uFrmRlImportacao, RLReport;

procedure TfrmOiRlImport.Button1Click(Sender: TObject);
var
  Relatorio: TFrmRlImport;
begin
  inherited;
  Relatorio := TFrmRlImport.Create(nil);
  try
    Relatorio.rrpMain.Preview;
  finally
    FreeAndNil(Relatorio);
  end;
end;

end.
