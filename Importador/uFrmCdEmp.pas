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
    gbxCartorioXimenes: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    gbxXimenesServices: TGroupBox;
    detReceita: TDBEdit;
    Label7: TLabel;
    detCentroResultados: TDBEdit;
    Label6: TLabel;
    detEstabelecimento: TDBEdit;
    Label5: TLabel;
    qryMainCARTORIOEST: TStringField;
    qryMainCARTORIOCRD: TStringField;
    qryMainCARTORIOCRS: TStringField;
    qryMainSERVICESEST: TStringField;
    qryMainSERVICESCRD: TStringField;
    qryMainSERVICESCRS: TStringField;
    gbxContasaPagar: TGroupBox;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    qryMainCPG_EST: TStringField;
    qryMainCPG_CRD: TStringField;
    qryMainCPG_CRS: TStringField;
    qryMainVDR_COB_CODIGO: TStringField;
    qryMainSER_CODIGO: TStringField;
    qryMainVDR_TDC_CODIGO: TStringField;
    qryMainMDS_CODIGO: TStringField;
    qryMainCPG_FRN_CNPJ: TStringField;
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
