object dmConnect: TdmConnect
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 234
  Width = 465
  object fdConn: TFDConnection
    Params.Strings = (
      'Database=..\Dados\IB2.GDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    FetchOptions.AssignedValues = [evDetailOptimize]
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 144
    Top = 16
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 360
    Top = 16
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 144
    Top = 72
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 272
    Top = 72
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 256
    Top = 8
  end
end
