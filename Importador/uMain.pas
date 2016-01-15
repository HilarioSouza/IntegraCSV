unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  KrImportador;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Leitor: ILeitor;
begin
  Leitor := TLeitorCSV.Create;
  try
    Leitor.LerArquivo('C:\Users\Hilario\Dropbox\Projetos\Importador\Dados\csv.txt');
    //Leitor.LerArquivo('C:\Projetos\Importador\Dados\csv.txt');
    ShowMessage('Teste Ok');
  except
    on E: Exception do
      raise Exception.Create('Falha no teste: ' + E.Message);
  end;
end;

end.
