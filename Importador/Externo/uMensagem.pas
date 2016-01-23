unit uMensagem;

interface

uses
  System.UITypes, Vcl.Dialogs;

type

  TMensagem = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    class procedure Informar(aMsg: String);
    class function Confirmar(aMsg: String; Default: TMsgDlgBtn = mbYes): Boolean;
  end;

implementation

{ TMensagem }

class function TMensagem.Confirmar(aMsg: String; Default: TMsgDlgBtn = mbYes): Boolean;
begin
  Result := False;
  if MessageDlg(aMsg, mtConfirmation, [mbYes, mbNo],0 ) = mrYes then
    Result := True;
end;

class procedure TMensagem.Informar(aMsg: String);
begin
  MessageDlg(aMsg, mtInformation, [mbOK], 0);
end;

end.
