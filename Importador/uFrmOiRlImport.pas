unit uFrmOiRlImport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmStandard, Vcl.StdCtrls, uFraEmpresa;

type
  TfrmOiRlImport = class(TfrmStandard)
    Button1: TButton;
    Button2: TButton;
    frEmpresa1: TfrEmpresa;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FIMP_ID: Integer;
  public
    { Public declarations }
    property IDImportacao: Integer read FIMP_ID write FIMP_ID;
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
  if (frEmpresa1.dcbEMP.KeyValue = null) then
  begin
    frEmpresa1.dcbEMP.SetFocus;
    raise Exception.Create('Por favor, selecione uma empresa');
  end;

  Relatorio := TFrmRlImport.Create(nil);
  try
    Relatorio.EMP_Codigo := frEmpresa1.dcbEMP.KeyValue;
    Relatorio.IMP_ID := FIMP_ID;
    Relatorio.rrpMain.Preview;
  finally
    FreeAndNil(Relatorio);
  end;
end;

procedure TfrmOiRlImport.FormCreate(Sender: TObject);
begin
  inherited;
  frEmpresa1.AbrirQuery;
  FIMP_ID := 0;
end;

end.
