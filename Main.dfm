object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 635
  ClientWidth = 1101
  Caption = 'MainForm'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
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
      object UniPageControl1: TUniPageControl
        Left = 1
        Top = 1
        Width = 846
        Height = 512
        Hint = ''
        ActivePage = UniTabSheet_graph
        Align = alClient
        TabOrder = 1
        object UniTabSheet_datatable: TUniTabSheet
          Hint = ''
          Caption = #12487#12540#12479#12486#12540#12502#12523
          object UniStatusBar2: TUniStatusBar
            Left = 0
            Top = 462
            Width = 838
            Hint = ''
            Panels = <>
            SizeGrip = False
            Align = alBottom
            ParentColor = False
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
          end
          object UniDBGrid1: TUniDBGrid
            Left = 0
            Top = 29
            Width = 838
            Height = 433
            Hint = ''
            DataSource = DataSource1
            WebOptions.Paged = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 2
            Columns = <
              item
                FieldName = 'id'
                Title.Caption = 'id'
                Width = 64
              end
              item
                FieldName = 'date'
                Title.Caption = 'date'
                Width = 64
              end
              item
                FieldName = 'value_1'
                Title.Caption = 'value_1'
                Width = 64
              end
              item
                FieldName = 'value_2'
                Title.Caption = 'value_2'
                Width = 64
              end
              item
                FieldName = 'value_3'
                Title.Caption = 'value_3'
                Width = 64
              end
              item
                FieldName = 'value_4'
                Title.Caption = 'value_4'
                Width = 64
              end
              item
                FieldName = 'value_5'
                Title.Caption = 'value_5'
                Width = 64
              end>
          end
        end
        object UniTabSheet_graph: TUniTabSheet
          Hint = ''
          Caption = #12464#12521#12501
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 846
          ExplicitHeight = 512
          object UniToolBar3: TUniToolBar
            Left = 0
            Top = 0
            Width = 838
            Height = 29
            Hint = ''
            TabOrder = 0
            ParentColor = False
            Color = clBtnFace
            ExplicitLeft = 232
            ExplicitTop = 64
            ExplicitWidth = 150
          end
          object UniStatusBar3: TUniStatusBar
            Left = 0
            Top = 462
            Width = 838
            Hint = ''
            Panels = <>
            SizeGrip = False
            Align = alBottom
            ParentColor = False
            ExplicitLeft = 304
            ExplicitTop = 424
            ExplicitWidth = 0
          end
          object UniChart1: TUniChart
            Left = 0
            Top = 29
            Width = 838
            Height = 433
            Hint = ''
            Title.Text.Strings = (
              #19981#20855#21512#20998#26512)
            LayoutConfig.BodyPadding = '10'
            Align = alClient
            TitleAlign = taCenter
            ExplicitLeft = 1
            ExplicitTop = 23
            object UniLineSeries1: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #30330#29983#20214#25968
              SeriesLabel.Enabled = True
              SeriesLabel.Display = 'under'
              DataSource = DataSource1
              YValues.ValueSource = 'value_1'
              XLabelsSource = 'date'
            end
            object UniLineSeries2: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #23436#20102#20214#25968
              DataSource = DataSource1
              YValues.ValueSource = 'value_2'
              XLabelsSource = 'date'
            end
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
      ExplicitTop = 2
      object UniButton_createTable4Graph: TUniButton
        Left = 1
        Top = 1
        Width = 243
        Height = 25
        Hint = ''
        Caption = #12464#12521#12501#29992#12486#12540#12502#12523#20316#25104
        Align = alTop
        TabOrder = 1
        ExplicitLeft = 16
        ExplicitTop = 40
        ExplicitWidth = 75
      end
      object UniButton_setStartDate_endDate: TUniButton
        Left = 1
        Top = 26
        Width = 243
        Height = 25
        Hint = ''
        Caption = #38283#22987#26085#12539#32066#20102#26085
        Align = alTop
        TabOrder = 2
        OnClick = UniButton_setStartDate_endDateClick
        ExplicitLeft = 72
        ExplicitTop = 80
        ExplicitWidth = 75
      end
      object UniDateTimePicker_endDate: TUniDateTimePicker
        Left = 1
        Top = 73
        Width = 243
        Hint = ''
        DateTime = 45327.000000000000000000
        DateFormat = 'yyyy/MM/dd'
        TimeFormat = 'HH:mm:ss'
        Align = alTop
        TabOrder = 3
        ExplicitLeft = 2
        ExplicitTop = 79
      end
      object UniDateTimePicker_startDate: TUniDateTimePicker
        Left = 1
        Top = 51
        Width = 243
        Hint = ''
        DateTime = 45327.000000000000000000
        DateFormat = 'yyyy/MM/dd'
        TimeFormat = 'HH:mm:ss'
        Align = alTop
        TabOrder = 4
        ExplicitLeft = 2
        ExplicitTop = 45
      end
      object UniButton_createdCount: TUniButton
        Left = 1
        Top = 95
        Width = 243
        Height = 25
        Hint = ''
        Caption = #30330#29983#20214#25968#35336#31639
        Align = alTop
        TabOrder = 5
        OnClick = UniButton_createdCountClick
        ExplicitLeft = 48
        ExplicitTop = 152
        ExplicitWidth = 75
      end
      object UniButton_completedCount: TUniButton
        Left = 1
        Top = 120
        Width = 243
        Height = 25
        Hint = ''
        Caption = #23436#20102#20214#25968#35336#31639
        Align = alTop
        TabOrder = 6
        OnClick = UniButton_completedCountClick
        ExplicitLeft = 2
      end
      object UniButton1: TUniButton
        Left = 1
        Top = 145
        Width = 243
        Height = 25
        Hint = ''
        Caption = #12464#12521#12501#34920#31034
        Align = alTop
        TabOrder = 7
        OnClick = UniButton1Click
        ExplicitLeft = 2
      end
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
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\TEMP\backlogbug.db'
      'OpenMode=ReadOnly'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 840
    Top = 80
  end
  object FDMemTable1: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 960
    Top = 168
    object FDMemTable1id: TIntegerField
      FieldName = 'id'
    end
    object FDMemTable1date: TDateField
      FieldName = 'date'
    end
    object FDMemTable1value_1: TIntegerField
      FieldName = 'value_1'
    end
    object FDMemTable1value_2: TIntegerField
      FieldName = 'value_2'
    end
    object FDMemTable1value_3: TIntegerField
      FieldName = 'value_3'
    end
    object FDMemTable1value_4: TIntegerField
      FieldName = 'value_4'
    end
    object FDMemTable1value_5: TIntegerField
      FieldName = 'value_5'
    end
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from issueTbl')
    Left = 937
    Top = 94
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 841
    Top = 167
  end
end
