object frmMain: TfrmMain
  Left = 192
  Top = 124
  Caption = 'Integra'#231#227'o AG'
  ClientHeight = 679
  ClientWidth = 1062
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 32
    Top = 8
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Empresa1: TMenuItem
        Caption = 'Empresa'
        OnClick = Empresa1Click
      end
    end
    object Movimentos1: TMenuItem
      Caption = 'Movimentos'
      object Importao1: TMenuItem
        Caption = 'Importa'#231#227'o'
        OnClick = Importao1Click
      end
    end
    object Relatrio1: TMenuItem
      Caption = 'Relat'#243'rio'
      object Importaes1: TMenuItem
        Caption = 'Importa'#231#245'es'
        OnClick = Importaes1Click
      end
    end
    object Configuraes1: TMenuItem
      Caption = 'Configura'#231#245'es'
      object Preferncias1: TMenuItem
        Caption = 'Prefer'#234'ncias'
        OnClick = Preferncias1Click
      end
      object Banco1: TMenuItem
        Caption = 'Banco'
        OnClick = Banco1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
