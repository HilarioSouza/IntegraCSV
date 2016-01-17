unit uFrmCdEmp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCrudbasic, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmCdEmp = class(TfrmCrudbasic)
    qryMainCODIGO: TStringField;
    qryMainNOME: TStringField;
    edtNome: TDBEdit;
    lblNome: TLabel;
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

uses udmConnect, uMain;

procedure TfrmCdEmp.FormCreate(Sender: TObject);
begin
  inherited;
  fPrincipal := frmMain;
end;

end.