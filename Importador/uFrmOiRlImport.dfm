inherited frmOiRlImport: TfrmOiRlImport
  Caption = 'Relat'#243'rio'
  ClientHeight = 99
  ClientWidth = 386
  OnCreate = FormCreate
  ExplicitWidth = 392
  ExplicitHeight = 128
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 104
    Top = 58
    Width = 75
    Height = 25
    Caption = 'Visualizar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 185
    Top = 58
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 1
  end
  inline frEmpresa1: TfrEmpresa
    Left = 8
    Top = 8
    Width = 369
    Height = 36
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 369
    inherited dcbEMP: TDBLookupComboBox
      Width = 305
      ExplicitWidth = 305
    end
  end
end
