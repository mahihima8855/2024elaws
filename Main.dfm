object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 701
  ClientWidth = 1302
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
    Width = 1302
    Height = 29
    Hint = ''
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
    ExplicitWidth = 1101
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 29
    Width = 1302
    Height = 580
    Hint = ''
    Align = alTop
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 1094
    object UniPanel2: TUniPanel
      Left = 245
      Top = 1
      Width = 1056
      Height = 578
      Hint = ''
      Align = alRight
      TabOrder = 1
      Caption = ''
      object UniPageControl1: TUniPageControl
        Left = 1
        Top = 1
        Width = 1054
        Height = 576
        Hint = ''
        ActivePage = UniTabSheet_datatable
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 846
        ExplicitHeight = 512
        object UniTabSheet_datatable: TUniTabSheet
          Hint = ''
          Caption = #12487#12540#12479#12486#12540#12502#12523
          ExplicitWidth = 838
          ExplicitHeight = 484
          object UniStatusBar2: TUniStatusBar
            Left = 0
            Top = 526
            Width = 1046
            Hint = ''
            Panels = <>
            SizeGrip = False
            Align = alBottom
            ParentColor = False
            ExplicitTop = 462
            ExplicitWidth = 838
          end
          object UniToolBar2: TUniToolBar
            Left = 0
            Top = 0
            Width = 1046
            Height = 29
            Hint = ''
            TabOrder = 1
            ParentColor = False
            Color = clBtnFace
            ExplicitLeft = 45
            ExplicitTop = 3
            ExplicitWidth = 995
            object UniSpeedButton_exportExcel: TUniSpeedButton
              Left = 0
              Top = 0
              Width = 65
              Height = 29
              Hint = ''
              Caption = 'Excel'#20986#21147
              Align = alLeft
              ParentColor = False
              TabOrder = 1
            end
          end
          object UniDBGrid1: TUniDBGrid
            Left = 0
            Top = 29
            Width = 1046
            Height = 497
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
                Title.Alignment = taCenter
                Title.Caption = #36899#30058
                Width = 40
              end
              item
                FieldName = 'date'
                Title.Alignment = taCenter
                Title.Caption = #26085#20184
                Width = 70
                Alignment = taCenter
              end
              item
                FieldName = 'createdCountofTable'
                Title.Alignment = taCenter
                Title.Caption = #24403#26085#30330#29983#20214#25968
                Width = 82
              end
              item
                FieldName = 'completedCountofTable'
                Title.Alignment = taCenter
                Title.Caption = #24403#26085#23436#20102#20214#25968
                Width = 82
              end
              item
                FieldName = 'sumofcreatedCountonDay'
                Title.Alignment = taCenter
                Title.Caption = #32047#31309#30330#29983#20214#25968
                Width = 82
              end
              item
                FieldName = 'sumofcompletedCountonDay'
                Title.Alignment = taCenter
                Title.Caption = #32047#31309#23436#20102#20214#25968
                Width = 82
              end
              item
                FieldName = 'sumUncompletedCountonTheDay'
                Title.Alignment = taCenter
                Title.Caption = #32047#31309#26410#23436#20102#25968
                Width = 82
              end
              item
                FieldName = 'createdCountonCondition'
                Title.Alignment = taCenter
                Title.Caption = #25351#23450#26465#20214#24403#26085#30330#29983#20214#25968
                Width = 134
              end
              item
                FieldName = 'completedCoumtonCondition'
                Title.Caption = #25351#23450#26465#20214#24403#26085#23436#20102#20214#25968
                Width = 134
              end
              item
                FieldName = 'completedPeriodonCondition'
                Title.Alignment = taCenter
                Title.Caption = #24403#26085#24179#22343#23436#20102#26085#25968
                Width = 108
              end
              item
                FieldName = 'completedPeriodonUntilTheDay'
                Title.Alignment = taCenter
                Title.Caption = #20840#20307#24179#22343#23436#20102#26085#25968
                Width = 108
              end>
          end
        end
        object UniTabSheet_graphofCount: TUniTabSheet
          Hint = ''
          Caption = #30330#29983#20214#25968#12464#12521#12501
          ExplicitWidth = 838
          ExplicitHeight = 484
          object UniToolBar3: TUniToolBar
            Left = 0
            Top = 0
            Width = 1046
            Height = 29
            Hint = ''
            TabOrder = 0
            ParentColor = False
            Color = clBtnFace
            ExplicitWidth = 838
            object UniLabel7: TUniLabel
              Left = 0
              Top = 0
              Width = 39
              Height = 13
              Hint = ''
              Caption = #38283#22987#26085
              Align = alLeft
              TabOrder = 1
              ExplicitTop = -6
            end
            object UniDateTimePicker_startDate: TUniDateTimePicker
              Left = 39
              Top = 0
              Width = 81
              Height = 29
              Hint = ''
              DateTime = 45327.000000000000000000
              DateFormat = 'yyyy/MM/dd'
              TimeFormat = 'HH:mm:ss'
              Align = alLeft
              TabOrder = 2
              ExplicitTop = -6
            end
            object UniLabel8: TUniLabel
              Left = 120
              Top = 0
              Width = 39
              Height = 13
              Hint = ''
              Caption = #32066#20102#26085
              Align = alLeft
              TabOrder = 3
              ExplicitTop = -6
            end
            object UniDateTimePicker_endDate: TUniDateTimePicker
              Left = 159
              Top = 0
              Width = 81
              Height = 29
              Hint = ''
              DateTime = 45327.000000000000000000
              DateFormat = 'yyyy/MM/dd'
              TimeFormat = 'HH:mm:ss'
              Align = alLeft
              TabOrder = 4
              ExplicitTop = -6
            end
          end
          object UniStatusBar3: TUniStatusBar
            Left = 0
            Top = 526
            Width = 1046
            Hint = ''
            Panels = <>
            SizeGrip = False
            Align = alBottom
            ParentColor = False
            ExplicitTop = 462
            ExplicitWidth = 838
          end
          object UniChart1: TUniChart
            Left = 0
            Top = 29
            Width = 1046
            Height = 497
            Hint = ''
            Title.Text.Strings = (
              #19981#20855#21512#20998#26512)
            LayoutConfig.BodyPadding = '10'
            Align = alClient
            TitleAlign = taCenter
            ExplicitWidth = 838
            ExplicitHeight = 433
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
        object UniTabSheet_completedPeriod: TUniTabSheet
          Hint = ''
          Caption = #23436#20102#26085#25968#12464#12521#12501
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 1003
          ExplicitHeight = 576
          object UniToolBar4: TUniToolBar
            Left = 0
            Top = 0
            Width = 1046
            Height = 29
            Hint = ''
            TabOrder = 0
            ParentColor = False
            Color = clBtnFace
            ExplicitLeft = 240
            ExplicitTop = 32
            ExplicitWidth = 150
            object UniDateTimePicker_endDateOfcompletedPeriod: TUniDateTimePicker
              Left = 159
              Top = 0
              Width = 81
              Height = 29
              Hint = ''
              DateTime = 45327.000000000000000000
              DateFormat = 'yyyy/MM/dd'
              TimeFormat = 'HH:mm:ss'
              Align = alLeft
              TabOrder = 1
              ExplicitLeft = 165
              ExplicitTop = -6
            end
            object UniLabel9: TUniLabel
              Left = 120
              Top = 0
              Width = 39
              Height = 13
              Hint = ''
              Caption = #32066#20102#26085
              Align = alLeft
              TabOrder = 2
              ExplicitTop = -3
            end
            object UniLabel10: TUniLabel
              Left = 0
              Top = 0
              Width = 39
              Height = 13
              Hint = ''
              Caption = #38283#22987#26085
              Align = alLeft
              TabOrder = 3
            end
            object UniDateTimePicker_startDateOfcompletedPeriod: TUniDateTimePicker
              Left = 39
              Top = 0
              Width = 81
              Height = 29
              Hint = ''
              DateTime = 45327.000000000000000000
              DateFormat = 'yyyy/MM/dd'
              TimeFormat = 'HH:mm:ss'
              Align = alLeft
              TabOrder = 4
              ExplicitLeft = 47
            end
          end
          object UniStatusBar4: TUniStatusBar
            Left = 0
            Top = 526
            Width = 1046
            Hint = ''
            Panels = <>
            SizeGrip = False
            Align = alBottom
            ParentColor = False
            ExplicitLeft = 400
            ExplicitTop = 496
            ExplicitWidth = 0
          end
        end
      end
    end
    object UniSplitter2: TUniSplitter
      Left = 239
      Top = 1
      Width = 6
      Height = 578
      Hint = ''
      Align = alRight
      ParentColor = False
      Color = clBtnFace
      ExplicitLeft = 246
      ExplicitHeight = 514
    end
    object UniPanel3: TUniPanel
      Left = 1
      Top = 1
      Width = 238
      Height = 578
      Hint = ''
      Align = alClient
      TabOrder = 3
      Caption = ''
      ExplicitHeight = 514
      object UniPanel4: TUniPanel
        Left = 1
        Top = 384
        Width = 236
        Height = 193
        Hint = ''
        Align = alBottom
        TabOrder = 1
        Caption = ''
        ExplicitWidth = 287
        object UniButton_createTable4Graph: TUniButton
          Left = 1
          Top = 66
          Width = 234
          Height = 26
          Hint = ''
          Caption = #12464#12521#12501#29992#12486#12540#12502#12523#20316#25104
          Align = alBottom
          TabOrder = 1
          ExplicitLeft = 3
          ExplicitTop = 16
        end
        object UniButton_setStartDate_endDate: TUniButton
          Left = 1
          Top = 92
          Width = 234
          Height = 25
          Hint = ''
          Caption = #38283#22987#26085#12539#32066#20102#26085
          Align = alBottom
          TabOrder = 2
          OnClick = UniButton_setStartDate_endDateClick
          ExplicitLeft = 8
          ExplicitTop = 56
        end
        object UniButton_createdCount: TUniButton
          Left = 1
          Top = 117
          Width = 234
          Height = 25
          Hint = ''
          Caption = #30330#29983#20214#25968#35336#31639
          Align = alBottom
          TabOrder = 3
          OnClick = UniButton_createdCountClick
          ExplicitLeft = 8
          ExplicitTop = 81
        end
        object UniButton_completedCount: TUniButton
          Left = 1
          Top = 142
          Width = 234
          Height = 25
          Hint = ''
          Caption = #23436#20102#20214#25968#35336#31639
          Align = alBottom
          TabOrder = 4
          OnClick = UniButton_completedCountClick
          ExplicitLeft = 3
          ExplicitTop = 105
        end
        object UniButton1: TUniButton
          Left = 1
          Top = 167
          Width = 234
          Height = 25
          Hint = ''
          Caption = #12464#12521#12501#34920#31034
          Align = alBottom
          TabOrder = 5
          OnClick = UniButton1Click
          ExplicitTop = 145
          ExplicitWidth = 243
        end
      end
      object UniPanel5: TUniPanel
        Left = 1
        Top = 1
        Width = 236
        Height = 383
        Hint = ''
        Align = alClient
        ParentFont = False
        Font.Height = -19
        TabOrder = 2
        Caption = ''
        ExplicitLeft = 73
        ExplicitTop = 160
        ExplicitWidth = 287
        ExplicitHeight = 413
        object UniLabel4: TUniLabel
          Left = 16
          Top = 53
          Width = 105
          Height = 21
          Hint = ''
          Caption = #20998#26512#23550#35937#12479#12473#12463
          ParentFont = False
          Font.Height = -16
          TabOrder = 1
        end
        object UniCheckBox_eGov: TUniCheckBox
          Left = 31
          Top = 80
          Width = 72
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'e_Gov'
          ParentFont = False
          TabOrder = 2
        end
        object UniCheckBox_eLaws: TUniCheckBox
          Left = 97
          Top = 80
          Width = 72
          Height = 17
          Hint = ''
          Caption = 'e_LAWS'
          ParentFont = False
          TabOrder = 3
        end
        object UniCheckBox_performance: TUniCheckBox
          Left = 165
          Top = 80
          Width = 72
          Height = 17
          Hint = ''
          Caption = #24615#33021
          ParentFont = False
          TabOrder = 4
        end
        object UniCheckBox_ReasonOthers: TUniCheckBox
          Left = 31
          Top = 103
          Width = 165
          Height = 17
          Hint = ''
          Caption = #29702#30001#12539#38307#35696#12539#29872#22659#12539#12381#12398#20182
          ParentFont = False
          TabOrder = 5
        end
        object UniLabel5: TUniLabel
          Left = 16
          Top = 133
          Width = 102
          Height = 21
          Hint = ''
          Caption = #20998#26512#23550#35937#31278#39006
          ParentFont = False
          Font.Height = -16
          TabOrder = 6
        end
        object UniCheckBox_bug: TUniCheckBox
          Left = 31
          Top = 160
          Width = 72
          Height = 17
          Hint = ''
          Checked = True
          Caption = #12496#12464
          ParentFont = False
          TabOrder = 7
        end
        object UniCheckBox_kadai: TUniCheckBox
          Left = 97
          Top = 160
          Width = 72
          Height = 17
          Hint = ''
          Caption = #35506#38988
          ParentFont = False
          TabOrder = 8
        end
        object UniCheckBox_QA: TUniCheckBox
          Left = 31
          Top = 183
          Width = 72
          Height = 17
          Hint = ''
          Caption = #36074#21839
          ParentFont = False
          TabOrder = 9
        end
        object UniCheckBox_moushiokuriOthers: TUniCheckBox
          Left = 97
          Top = 183
          Width = 130
          Height = 17
          Hint = ''
          Caption = #30003#12375#36865#12426#12539#12513#12514
          ParentFont = False
          TabOrder = 10
        end
        object UniLabel6: TUniLabel
          Left = 16
          Top = 213
          Width = 119
          Height = 21
          Hint = ''
          Caption = #20998#26512#23550#35937#20778#20808#24230
          ParentFont = False
          Font.Height = -16
          TabOrder = 11
        end
        object UniCheckBox_PrioSS: TUniCheckBox
          Left = 31
          Top = 240
          Width = 50
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'SS'
          ParentFont = False
          TabOrder = 12
        end
        object UniCheckBox_PrioA: TUniCheckBox
          Left = 80
          Top = 240
          Width = 41
          Height = 17
          Hint = ''
          Caption = 'A'
          ParentFont = False
          TabOrder = 13
        end
        object UniCheckBox_prioB1: TUniCheckBox
          Left = 175
          Top = 240
          Width = 50
          Height = 17
          Hint = ''
          Caption = 'B1'
          ParentFont = False
          TabOrder = 14
        end
        object UniCheckBox1: TUniCheckBox
          Left = 31
          Top = 263
          Width = 72
          Height = 17
          Hint = ''
          Caption = 'B2,B3,C'
          ParentFont = False
          TabOrder = 15
        end
        object UniButton_createDataandGraph: TUniButton
          Left = 1
          Top = 298
          Width = 234
          Height = 84
          Hint = ''
          Caption = #12464#12521#12501#34920#31034
          Align = alBottom
          ParentFont = False
          Font.Height = -19
          Font.Style = [fsBold]
          TabOrder = 16
          ExplicitTop = 328
          ExplicitWidth = 285
        end
        object UniLabel1: TUniLabel
          Left = 1
          Top = 1
          Width = 234
          Height = 36
          Hint = ''
          Alignment = taCenter
          AutoSize = False
          Caption = #26465#20214#25351#23450
          Align = alTop
          ParentFont = False
          Font.Height = -16
          TabOrder = 17
          ExplicitWidth = 285
        end
      end
    end
  end
  object UniMemo1: TUniMemo
    Left = 0
    Top = 615
    Width = 1302
    Height = 64
    Hint = ''
    ScrollBars = ssBoth
    Align = alClient
    TabOrder = 2
    ExplicitTop = 551
    ExplicitWidth = 1101
    ExplicitHeight = 62
  end
  object UniSplitter1: TUniSplitter
    Left = 0
    Top = 609
    Width = 1302
    Height = 6
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
    ExplicitTop = 545
    ExplicitWidth = 1101
  end
  object UniStatusBar1: TUniStatusBar
    Left = 0
    Top = 679
    Width = 1302
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    ParentColor = False
    ExplicitTop = 613
    ExplicitWidth = 1101
  end
  object UniCheckBox_PrioB: TUniCheckBox
    Left = 129
    Top = 271
    Width = 42
    Height = 17
    Hint = ''
    Caption = 'B'
    TabOrder = 5
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\TEMP\backlogbug.db'
      'OpenMode=ReadOnly'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 1056
    Top = 416
  end
  object FDMemTable1: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'date'
        DataType = ftDate
      end
      item
        Name = 'value_1'
        DataType = ftInteger
      end
      item
        Name = 'value_2'
        DataType = ftInteger
      end
      item
        Name = 'value_3'
        DataType = ftInteger
      end
      item
        Name = 'value_4'
        DataType = ftInteger
      end
      item
        Name = 'value_5'
        DataType = ftInteger
      end
      item
        Name = 'createdCountofTable'
        DataType = ftInteger
      end
      item
        Name = 'completedCountofTable'
        DataType = ftInteger
      end
      item
        Name = 'createdCountonCondition'
        DataType = ftInteger
      end
      item
        Name = 'sumofcreatedCountonDay'
        DataType = ftInteger
      end
      item
        Name = 'sumofcompletedCountonDay'
        DataType = ftInteger
      end
      item
        Name = 'sumUncompletedCountonTheDay'
        DataType = ftInteger
      end
      item
        Name = 'completedCoumtonCondition'
        DataType = ftInteger
      end
      item
        Name = 'completedPeriodonCondition'
        DataType = ftInteger
      end
      item
        Name = 'completedPeriodonUntilTheDay'
        DataType = ftInteger
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 1056
    Top = 496
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
    object FDMemTable1createdCountofTable: TIntegerField
      FieldName = 'createdCountofTable'
    end
    object FDMemTable1completedCountofTable: TIntegerField
      FieldName = 'completedCountofTable'
    end
    object FDMemTable1createdCountonCondition: TIntegerField
      FieldName = 'createdCountonCondition'
    end
    object FDMemTable1sumofcreatedCountonDay: TIntegerField
      FieldName = 'sumofcreatedCountonDay'
    end
    object FDMemTable1sumofcompletedCountonDay: TIntegerField
      FieldName = 'sumofcompletedCountonDay'
    end
    object FDMemTable1sumUncompletedCountonTheDay: TIntegerField
      FieldName = 'sumUncompletedCountonTheDay'
    end
    object FDMemTable1completedCoumtonCondition: TIntegerField
      FieldName = 'completedCoumtonCondition'
    end
    object FDMemTable1completedPeriodonCondition: TIntegerField
      FieldName = 'completedPeriodonCondition'
    end
    object FDMemTable1completedPeriodonUntilTheDay: TIntegerField
      FieldName = 'completedPeriodonUntilTheDay'
    end
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from issueTbl')
    Left = 1201
    Top = 414
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 1209
    Top = 503
  end
  object UniGridExcelExporter1: TUniGridExcelExporter
    FileExtention = 'xlsx'
    MimeType = 
      'application/vnd.openxmlformats-officedocument.spreadsheetml.shee' +
      't'
    CharSet = 'UTF-8'
    Left = 1189
    Top = 343
  end
end
