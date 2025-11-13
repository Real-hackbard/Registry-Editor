object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Backup Registry'
  ClientHeight = 225
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 15
  object Label4: TLabel
    Left = 30
    Top = 151
    Width = 51
    Height = 15
    Caption = 'Progress :'
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 455
    Height = 126
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label2: TLabel
      Left = 80
      Top = 48
      Width = 9
      Height = 15
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 40
      Top = 28
      Width = 174
      Height = 15
      Caption = 'write backup to file, please wait...'
    end
    object Label3: TLabel
      Left = 49
      Top = 72
      Width = 24
      Height = 15
      Caption = 'File :'
    end
    object Label5: TLabel
      Left = 48
      Top = 47
      Width = 25
      Height = 15
      Caption = 'Key :'
    end
    object Label6: TLabel
      Left = 81
      Top = 97
      Width = 23
      Height = 15
      Caption = '0 Kb'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 47
      Top = 97
      Width = 26
      Height = 15
      Caption = 'Size :'
    end
    object Edit1: TEdit
      Left = 80
      Top = 69
      Width = 366
      Height = 21
      TabOrder = 0
      Text = 'c:\RegistryBackup.ini'
    end
  end
  object Button1: TButton
    Left = 298
    Top = 190
    Width = 75
    Height = 25
    Caption = 'Abort'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 88
    Top = 150
    Width = 366
    Height = 21
    Style = pbstMarquee
    TabOrder = 2
  end
  object Button2: TButton
    Left = 379
    Top = 190
    Width = 75
    Height = 25
    Caption = 'Close'
    Enabled = False
    TabOrder = 3
    OnClick = Button2Click
  end
end
