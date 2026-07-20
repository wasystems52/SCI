object DM: TDM
  OldCreateOrder = False
  Height = 427
  Width = 723
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'William:C:\SCIVol3\Database\DBSCI.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = Trans
    Left = 32
    Top = 16
  end
  object Trans: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Left = 88
    Top = 16
  end
end
