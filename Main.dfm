object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 635
  ClientWidth = 1101
  Caption = 'MainForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object UniToolBar1: TUniToolBar
    Left = 0
    Top = 0
    Width = 1101
    Height = 29
    Hint = ''
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
    ExplicitLeft = 528
    ExplicitTop = 64
    ExplicitWidth = 150
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 29
    Width = 1101
    Height = 516
    Hint = ''
    Align = alTop
    TabOrder = 1
    Caption = ''
    object UniPanel2: TUniPanel
      Left = 252
      Top = 1
      Width = 848
      Height = 514
      Hint = ''
      Align = alRight
      TabOrder = 1
      Caption = ''
      ExplicitLeft = 192
      ExplicitHeight = 402
      object UniPageControl1: TUniPageControl
        Left = 1
        Top = 1
        Width = 846
        Height = 512
        Hint = ''
        ActivePage = UniTabSheet_main
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 56
        ExplicitTop = 144
        ExplicitWidth = 289
        ExplicitHeight = 193
        object UniTabSheet_main: TUniTabSheet
          Hint = ''
          Caption = 'Main'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 461
          ExplicitHeight = 400
          object UniStatusBar2: TUniStatusBar
            Left = 0
            Top = 462
            Width = 838
            Hint = ''
            Panels = <>
            SizeGrip = False
            Align = alBottom
            ParentColor = False
            ExplicitLeft = 312
            ExplicitTop = 328
            ExplicitWidth = 0
          end
          object UniToolBar2: TUniToolBar
            Left = 0
            Top = 0
            Width = 838
            Height = 29
            Hint = ''
            TabOrder = 1
            ParentColor = False
            Color = clBtnFace
            ExplicitLeft = 224
            ExplicitTop = 32
            ExplicitWidth = 150
          end
        end
      end
    end
    object UniSplitter2: TUniSplitter
      Left = 246
      Top = 1
      Width = 6
      Height = 514
      Hint = ''
      Align = alRight
      ParentColor = False
      Color = clBtnFace
      ExplicitLeft = 128
      ExplicitTop = 152
      ExplicitHeight = 32
    end
    object UniPanel3: TUniPanel
      Left = 1
      Top = 1
      Width = 245
      Height = 514
      Hint = ''
      Align = alClient
      TabOrder = 3
      Caption = ''
      ExplicitWidth = 344
      ExplicitHeight = 402
    end
  end
  object UniMemo1: TUniMemo
    Left = 0
    Top = 551
    Width = 1101
    Height = 62
    Hint = ''
    ScrollBars = ssBoth
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 296
    ExplicitTop = 368
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
  object UniSplitter1: TUniSplitter
    Left = 0
    Top = 545
    Width = 1101
    Height = 6
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
    ExplicitTop = 305
    ExplicitWidth = 136
  end
  object UniStatusBar1: TUniStatusBar
    Left = 0
    Top = 613
    Width = 1101
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    ParentColor = False
    ExplicitLeft = 1
    ExplicitTop = 379
    ExplicitWidth = 461
  end
  object FDConnection1: TFDConnection
    Left = 56
    Top = 80
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 168
  end
end
