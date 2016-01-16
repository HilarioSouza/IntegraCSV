unit uFrmImportacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmStandard, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TfrmImportacao = class(TFrmStandard)
    Panel1: TPanel;
    edtCaminhoArquivo: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure ImportarArquivo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportacao: TfrmImportacao;

implementation

uses
  KrImportador, uUtils;

{$R *.dfm}

procedure TfrmImportacao.Button1Click(Sender: TObject);
begin
  ImportarArquivo;
end;

procedure TfrmImportacao.SpeedButton1Click(Sender: TObject);
begin
  edtCaminhoArquivo.Text := TUtil.GetCaminhoArquivo;
end;

procedure TfrmImportacao.ImportarArquivo;
var
  Leitor: ILeitor;
begin
  Leitor := TLeitorCSV.Create;
  try
    Leitor.LerArquivo(edtCaminhoArquivo.Text);
    ShowMessage('Teste Ok');
  except
    on E: Exception do
      raise Exception.Create('Falha no teste: ' + E.Message);
  end;
end;

end.
