object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'I2B - Invent'#225'rio'
  ClientHeight = 482
  ClientWidth = 840
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 463
    Width = 840
    Height = 19
    Panels = <>
  end
  object MainMenu: TMainMenu
    Left = 24
    Top = 8
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Empresa1: TMenuItem
        Action = actEmpresa
      end
    end
    object Movimentos1: TMenuItem
      Caption = 'Movimentos'
      object ImportarPlanilhaI2B1: TMenuItem
        Action = actImportarCsvI2B
      end
      object Exportao1: TMenuItem
        Action = acExportacao
      end
    end
    object Configuraes1: TMenuItem
      Caption = 'Configura'#231#245'es'
      object Bancodedados1: TMenuItem
        Action = actConfigBD
      end
    end
    object Sair1: TMenuItem
      Action = actSair
    end
  end
  object ActList: TActionList
    Left = 88
    Top = 8
    object actSair: TAction
      Category = 'Sair'
      Caption = 'Sair'
      OnExecute = actSairExecute
    end
    object actEmpresa: TAction
      Category = 'Cadastro'
      Caption = 'Empresa'
      OnExecute = actEmpresaExecute
    end
    object actImportarCsvI2B: TAction
      Category = 'Movimentos'
      Caption = 'Importar csv'
      OnExecute = actImportarCsvI2BExecute
    end
    object actConfigBD: TAction
      Category = 'Configuracoes'
      Caption = 'Banco de dados'
      OnExecute = actConfigBDExecute
    end
    object acExportacao: TAction
      Category = 'Movimentos'
      Caption = 'Exporta'#231#227'o'
      OnExecute = acExportacaoExecute
    end
  end
  object ErrorDialog: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 120
    Top = 64
  end
  object AppEvents: TApplicationEvents
    Left = 32
    Top = 64
  end
end
