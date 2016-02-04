inherited frmLog: TfrmLog
  Caption = 'Log'
  ClientHeight = 642
  ClientWidth = 1061
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 1067
  ExplicitHeight = 671
  PixelsPerInch = 96
  TextHeight = 13
  object mmoLog: TMemo
    Left = 0
    Top = 0
    Width = 1061
    Height = 611
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 611
    Width = 1061
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnOk: TButton
      Left = 484
      Top = 4
      Width = 80
      Height = 25
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
end
