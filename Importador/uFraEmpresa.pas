unit uFraEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrEmpresa = class(TFrame)
    ddsEMP: TDataSource;
    fqrEMP: TFDQuery;
    dcbEMP: TDBLookupComboBox;
    Label1: TLabel;
    edtCodEmpresa: TEdit;
    Label2: TLabel;
    procedure dcbEMPExit(Sender: TObject);
    procedure dcbEMPCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizarEMP_Codigo;
    procedure AbrirQuery;
  end;

implementation

{$R *.dfm}

uses udmConnect;

procedure TfrEmpresa.AbrirQuery;
begin
  fqrEMP.Open;
end;

procedure TfrEmpresa.AtualizarEMP_Codigo;
begin
  edtCodEmpresa.Text := fqrEMP.FieldByName('CODIGO').AsString;
end;

procedure TfrEmpresa.dcbEMPCloseUp(Sender: TObject);
begin
  AtualizarEMP_Codigo;
end;

procedure TfrEmpresa.dcbEMPExit(Sender: TObject);
begin
  AtualizarEMP_Codigo;
end;

end.
