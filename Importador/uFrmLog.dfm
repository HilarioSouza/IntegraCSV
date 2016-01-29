inherited frmLog: TfrmLog
  Caption = 'Log'
  ClientHeight = 446
  OnClose = FormClose
  ExplicitWidth = 462
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  object mmoLog: TMemo
    Left = 0
    Top = 0
    Width = 456
    Height = 415
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 0
    ExplicitWidth = 405
    ExplicitHeight = 456
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 415
    Width = 456
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 416
    object btnOk: TButton
      Left = 196
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
end
