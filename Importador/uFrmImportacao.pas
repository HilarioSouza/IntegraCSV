unit uFrmImportacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmStandard, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TfrmImportacao = class(TfrmStandard)
    Panel1: TPanel;
    edtCaminhoArquivo: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
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
  KrImportador, uUtils, uMain;

{$R *.dfm}

procedure TfrmImportacao.Button1Click(Sender: TObject);
begin
  ImportarArquivo;
end;

procedure TfrmImportacao.SpeedButton1Click(Sender: TObject);
begin
  edtCaminhoArquivo.Text := TUtilArquivo.GetCaminhoArquivo;
end;

procedure TfrmImportacao.Button2Click(Sender: TObject);
begin
  Sair;
end;

procedure TfrmImportacao.Button3Click(Sender: TObject);
var Imp: TImportador;
begin
  inherited;
  imp := timportador.Create;


end;

procedure TfrmImportacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmImportacao.ImportarArquivo;
var
  Leitor: ILeitor;
begin
  Leitor := TLeitorCSV.Create;
  try
    Leitor.LerArquivo(edtCaminhoArquivo.Text);
    ShowMessage('Importação realizada com sucesso.');
  except
    on E: Exception do
      raise Exception.Create('Erro durante a importação: ' + E.Message);
  end;
end;

end.
