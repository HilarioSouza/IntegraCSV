unit uFraEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Mask;

type
  TfrEmpresa = class(TFrame)
    ddsEMP: TDataSource;
    fqrEMP: TFDQuery;
    dcbEMP: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edtCodEmpresa: TDBEdit;
    procedure dcbEMPExit(Sender: TObject);
    procedure dcbEMPCloseUp(Sender: TObject);
    procedure edtCodEmpresaExit(Sender: TObject);
    procedure edtCodEmpresaChange(Sender: TObject);
  private
    procedure AtualizarEMP_Nome;
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

procedure TfrEmpresa.edtCodEmpresaChange(Sender: TObject);
begin
  AtualizarEMP_Nome;
end;

procedure TfrEmpresa.edtCodEmpresaExit(Sender: TObject);
begin
  AtualizarEMP_Nome;
end;

procedure TfrEmpresa.AtualizarEMP_Nome;
begin
  if Length(edtCodEmpresa.Text) < 4 then
    Exit;
  fqrEMP.IndexFieldNames := 'CODIGO';
  if fqrEMP.FindKey([edtCodEmpresa.Text]) then
    dcbEMP.KeyValue := edtCodEmpresa.Text
  else
    ShowMessage('Empresa não cadastrada');
end;

end.
