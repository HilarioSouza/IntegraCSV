program PrImportador;

uses
  Forms,
  uMain in 'uMain.pas' {Form1},
  KrImportador in 'KrImportador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
