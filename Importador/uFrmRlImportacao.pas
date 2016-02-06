unit uFrmRlImportacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ufrmStandard;

type
  TFrmRlImport = class(TfrmStandard)
    rrpMain: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    ddsMain: TDataSource;
    fqrMain: TFDQuery;
    RLBand4: TRLBand;
    fqrMainEMP_CODIGO: TStringField;
    fqrMainID: TIntegerField;
    fqrMainPROTOCOLO: TStringField;
    fqrMainDATACADASTRO: TSQLTimeStampField;
    fqrMainDESPACHANTE: TFloatField;
    fqrMainDISTRIBUIDOR: TFloatField;
    fqrMainVALORCARTORIO: TFloatField;
    fqrMainDAJ: TFloatField;
    fqrMainVALORTOTALCUSTAS: TFloatField;
    fqrMainCONVENIO: TStringField;
    fqrMainCUSTASFECHADAS: TIntegerField;
    fqrMainVALORXIMENESGESTAO: TFloatField;
    fqrMainVALORXIMENESAUT: TFloatField;
    fqrMainVALORXIMENESREC: TFloatField;
    fqrMainVALORXIMENESOUTROS: TFloatField;
    fqrMainREPRESENTANTE: TStringField;
    fqrMainVALORXIMENES: TFloatField;
    fqrMainIMP_ID: TIntegerField;
    fqrMainCRE_CODIGO: TStringField;
    fqrMainNUMLINHA: TIntegerField;
    fqrMainCPG_CODIGO: TStringField;
    fqrMainIMP_DATA: TDateField;
    rdtProtocolo: TRLDBText;
    rlbProtocolo: TRLLabel;
    rlbDataImportacao: TRLLabel;
    rdtDataImport: TRLDBText;
    rdtCPG_Codigo: TRLDBText;
    rdtCRE_Codigo: TRLDBText;
    rdtConvenio: TRLDBText;
    rdtCustasFechadas: TRLDBText;
    rlbCPG: TRLLabel;
    rlbCRE: TRLLabel;
    rlbConvenio: TRLLabel;
    rlbCustasFechadas: TRLLabel;
    lblEmpresa: TRLLabel;
    RLDBText1: TRLDBText;
    rlbID: TRLLabel;
    rdtDataCadastro: TRLDBText;
    RLLabel1: TRLLabel;
    procedure rrpMainBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure fqrMainCUSTASFECHADASGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    function PossuiFiltros: Boolean;
    function MontarConsultaSQL: String;
  public
    { Public declarations }
    EMP_Codigo: String;
    IMP_ID: Integer;
  end;

var
  FrmRlImport: TFrmRlImport;

implementation

{$R *.dfm}

uses udmConnect, System.StrUtils;

procedure TFrmRlImport.fqrMainCUSTASFECHADASGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := IfThen(Text = '1', 'Sim', 'Não');
end;

function TFrmRlImport.PossuiFiltros: Boolean;
begin
  Result := (not EMP_Codigo.IsEmpty) or (IMP_ID > 0);
end;

function TFrmRlImport.MontarConsultaSQL: String;
begin
  Result := ' SELECT REG.*, IMP.DATA AS IMP_DATA FROM REG ' +
            '   LEFT JOIN IMP ON REG.EMP_CODIGO = IMP.EMP_CODIGO AND REG.IMP_ID = IMP.ID ';
  if PossuiFiltros then
  Result := Result + ' WHERE REG.EMP_CODIGO = ' + EMP_Codigo.QuotedString;
  if IMP_ID > 0 then
    Result := Result + ' AND REG.IMP_ID = ' + IMP_ID.ToString;
end;

procedure TFrmRlImport.rrpMainBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  fqrMain.SQL.Text := MontarConsultaSQL;
  fqrMain.Open;
end;

end.
