object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 847
  ClientWidth = 1984
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
    Width = 1984
    Height = 29
    Hint = ''
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
    ExplicitWidth = 1853
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 29
    Width = 1984
    Height = 748
    Hint = ''
    Align = alTop
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 1853
    object UniPanel2: TUniPanel
      Left = 395
      Top = 1
      Width = 1588
      Height = 746
      Hint = ''
      Align = alRight
      TabOrder = 1
      Caption = ''
      ExplicitLeft = 264
      object UniPageControl1: TUniPageControl
        Left = 1
        Top = 1
        Width = 1586
        Height = 744
        Hint = ''
        ActivePage = UniTabSheet_graphofCount
        Align = alClient
        TabOrder = 1
        object UniTabSheet_datatable: TUniTabSheet
          Hint = ''
          Caption = #12487#12540#12479#12486#12540#12502#12523
          object UniStatusBar2: TUniStatusBar
            Left = 0
            Top = 694
            Width = 1578
            Hint = ''
            Panels = <>
            SizeGrip = False
            Align = alBottom
            ParentColor = False
          end
          object UniToolBar2: TUniToolBar
            Left = 0
            Top = 0
            Width = 1578
            Height = 29
            Hint = ''
            TabOrder = 1
            ParentColor = False
            Color = clBtnFace
            object UniSpeedButton_exportExcel_graphData: TUniSpeedButton
              Left = 0
              Top = 0
              Width = 65
              Height = 29
              Hint = ''
              Caption = 'Excel'#20986#21147
              Align = alLeft
              ParentColor = False
              TabOrder = 1
              OnClick = UniSpeedButton_exportExcel_graphDataClick
            end
          end
          object UniDBGrid1: TUniDBGrid
            Left = 0
            Top = 29
            Width = 1578
            Height = 665
            Hint = ''
            DataSource = DataSource1
            WebOptions.Paged = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 2
            Exporter.Enabled = True
            Exporter.FileName = 'graphMatrixData'
            Exporter.Exporter = UniGridExcelExporter_graphData
            Exporter.Title = #12464#12521#12501#29992#38598#35336#12487#12540#12479
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
                FieldName = 'weekday'
                Title.Alignment = taCenter
                Title.Caption = #26332#26085
                Width = 40
              end
              item
                FieldName = 'createdCountofTable'
                Title.Alignment = taCenter
                Title.Caption = #26085#12293#12539#20840#20214#30330#29983#25968
                Width = 100
              end
              item
                FieldName = 'completedCountofTable'
                Title.Alignment = taCenter
                Title.Caption = #26085#12293#12539#20840#20214#23436#20102#25968
                Width = 100
              end
              item
                FieldName = 'sumofcreatedCountOnDay'
                Title.Alignment = taCenter
                Title.Caption = #32047#31309#12539#20840#20214#30330#29983#25968
                Width = 100
              end
              item
                FieldName = 'sumofcompletedCountonDay'
                Title.Alignment = taCenter
                Title.Caption = #32047#31309#12539#20840#20214#23436#20102#25968
                Width = 100
              end
              item
                FieldName = 'sumUncompletedCountonTheDay'
                Title.Alignment = taCenter
                Title.Caption = #32047#31309#12539#20840#20214#26410#35299#27770#25968
                Width = 120
              end
              item
                FieldName = 'createdCountonCondition'
                Title.Alignment = taCenter
                Title.Caption = #26085#12293#12539#26465#20214#20184#12365#30330#29983#25968
                Width = 130
              end
              item
                FieldName = 'completedCountOnCondition'
                Title.Caption = #26085#12293#12539#26465#20214#20184#12365#23436#20102#25968
                Width = 130
              end
              item
                FieldName = 'sumOfCreated_ConditionByD'
                Title.Alignment = taCenter
                Title.Caption = #32047#31309#12539#26465#20214#20184#12365#30330#29983#25968
                Width = 134
              end
              item
                FieldName = 'sumOfCompleted_ConditionByD'
                Title.Alignment = taCenter
                Title.Caption = #32047#31309#12539#26465#20214#20184#12365#23436#20102#25968
                Width = 134
              end
              item
                FieldName = 'sumUncompletedOnConditionTheDay'
                Title.Alignment = taCenter
                Title.Caption = #32047#31309#12539#26465#20214#20184#12365#26410#35299#27770#25968
                Width = 150
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
                Title.Caption = #32047#31309#24179#22343#23436#20102#26085#25968
                Width = 120
              end
              item
                FieldName = 'value_1'
                Title.Caption = #26085#12293#12398#35506#38988#30330#29983#20214#25968#21512#35336
                Width = 145
                Visible = False
              end
              item
                FieldName = 'value_2'
                Title.Caption = #26085#12293#12398#35506#38988#23436#20102#20214#25968#21512#35336
                Width = 145
                Visible = False
              end
              item
                FieldName = 'value_3'
                Title.Caption = #24403#26085#23436#20102#12479#12473#12463#12398#26399#38291#21512#35336
                Width = 147
                Visible = False
              end
              item
                FieldName = 'value_4'
                Title.Caption = #24403#26085#23436#20102#12479#12473#12463#12398#20214#25968#21512#35336
                Width = 147
                Visible = False
              end
              item
                FieldName = 'value_5'
                Title.Caption = #24403#26085#12414#12391#23436#20102#12375#12383#12479#12473#12463#12398#26399#38291#33988#31309
                Width = 187
                Visible = False
              end
              item
                FieldName = 'value_6'
                Title.Caption = #24403#26085#12414#12391#23436#20102#12375#12383#12479#12473#12463#12398#20214#25968#33988#31309
                Width = 187
                Visible = False
              end>
          end
        end
        object UniTabSheet_graphofCount: TUniTabSheet
          Hint = ''
          Caption = #30330#29983#20214#25968#12464#12521#12501
          object UniToolBar3: TUniToolBar
            Left = 0
            Top = 0
            Width = 1578
            Height = 29
            Hint = ''
            TabOrder = 0
            ParentColor = False
            Color = clBtnFace
          end
          object UniStatusBar3: TUniStatusBar
            Left = 0
            Top = 694
            Width = 1578
            Hint = ''
            Panels = <>
            SizeGrip = False
            Align = alBottom
            ParentColor = False
          end
          object UniChart1: TUniChart
            Left = 0
            Top = 29
            Width = 1578
            Height = 665
            Hint = ''
            Title.Text.Strings = (
              #19981#20855#21512#30330#29983#29366#27841)
            LayoutConfig.BodyPadding = '10'
            Align = alClient
            TitleAlign = taCenter
            object Day_ALL_created: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #26085#12293#12539#20840#20214#30330#29983#25968
              SeriesLabel.Enabled = True
              DataSource = DataSource1
              YValues.ValueSource = 'createdCountofTable'
              XLabelsSource = 'date'
            end
            object Day_ALL_completed: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #26085#12293#12539#20840#20214#23436#20102#25968
              SeriesLabel.Enabled = True
              DataSource = DataSource1
              YValues.ValueSource = 'completedCountofTable'
              XLabelsSource = 'date'
            end
            object Sum_ALL_created: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #32047#31309#12539#20840#20214#30330#29983#25968
              SeriesLabel.Enabled = True
              DataSource = DataSource1
              YValues.ValueSource = 'sumofcreatedCountOnDay'
              XLabelsSource = 'date'
            end
            object Sum_ALL_completed: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #32047#31309#12539#20840#20214#23436#20102#25968
              SeriesLabel.Enabled = True
              DataSource = DataSource1
              YValues.ValueSource = 'sumofcompletedCountonDay'
              XLabelsSource = 'date'
            end
            object Sum_ALL_umcompleted: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #32047#31309#12539#20840#20214#26410#35299#27770#25968
              SeriesLabel.Enabled = True
              DataSource = DataSource1
              YValues.ValueSource = 'sumUncompletedCountonTheDay'
              XLabelsSource = 'date'
            end
            object Day_COND_created: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #26085#12293#12539#26465#20214#20184#12365#30330#29983#25968
              SeriesLabel.Enabled = True
              DataSource = DataSource1
              YValues.ValueSource = 'createdCountonCondition'
              XLabelsSource = 'date'
            end
            object Day_COND_completed: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #26085#12293#12539#26465#20214#20184#12365#23436#20102#25968
              SeriesLabel.Enabled = True
              DataSource = DataSource1
              YValues.ValueSource = 'completedCountOnCondition'
              XLabelsSource = 'date'
            end
            object Sum_COND_created: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #32047#31309#12539#26465#20214#20184#12365#30330#29983#25968
              SeriesLabel.Enabled = True
              DataSource = DataSource1
              YValues.ValueSource = 'sumOfCreated_ConditionByD'
              XLabelsSource = 'date'
            end
            object Sum_COND_completed: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #32047#31309#12539#26465#20214#20184#12365#23436#20102#25968
              SeriesLabel.Enabled = True
              DataSource = DataSource1
              YValues.ValueSource = 'sumOfCompleted_ConditionByD'
              XLabelsSource = 'date'
            end
            object Sum_COND_uncompleted: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #32047#31309#12539#26465#20214#20184#12365#26410#35299#27770#25968
              SeriesLabel.Enabled = True
              DataSource = DataSource1
              YValues.ValueSource = 'sumUncompletedOnConditionTheDay'
              XLabelsSource = 'date'
            end
          end
        end
        object UniTabSheet_completedPeriod: TUniTabSheet
          Hint = ''
          Caption = #23436#20102#26399#38291#26085#25968#12464#12521#12501
          object UniToolBar4: TUniToolBar
            Left = 0
            Top = 0
            Width = 1578
            Height = 29
            Hint = ''
            TabOrder = 0
            ParentColor = False
            Color = clBtnFace
            object UniToolBar6: TUniToolBar
              Left = 0
              Top = 0
              Width = 1578
              Height = 29
              Hint = ''
              TabOrder = 1
              ParentColor = False
              Color = clBtnFace
            end
          end
          object UniStatusBar4: TUniStatusBar
            Left = 0
            Top = 694
            Width = 1578
            Hint = ''
            Panels = <>
            SizeGrip = False
            Align = alBottom
            ParentColor = False
          end
          object UniChart2: TUniChart
            Left = 0
            Top = 29
            Width = 1578
            Height = 665
            Hint = ''
            Title.Text.Strings = (
              #25351#23450#26465#20214#12398#35506#38988#12364#23436#20102#12375#12383#35442#24403#26085#12398#24403#26085#24179#22343#23436#20102#26399#38291#12392#24403#26085#12414#12391#12398#32047#31309#24179#22343#23436#20102#26399#38291)
            LayoutConfig.BodyPadding = '10'
            Align = alClient
            TitleAlign = taCenter
            object Day_ave_completed: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #24403#26085#24179#22343#23436#20102#26085#25968
              DataSource = DataSource1
              YValues.ValueSource = 'completedPeriodonCondition'
              XLabelsSource = 'date'
            end
            object untilTheDay_ave_completed: TUniLineSeries
              Colors.Strings = (
                '#0000FF'
                '#00FF00'
                '#FF0000'
                '#00FFFF'
                '#FFFF00'
                '#FF00FF')
              Title = #32047#31309#24179#22343#23436#20102#26085#25968
              DataSource = DataSource1
              YValues.ValueSource = 'completedPeriodonUntilTheDay'
              XLabelsSource = 'date'
            end
          end
        end
        object UniTabSheet1: TUniTabSheet
          Hint = ''
          Caption = #38598#35336#20803#12487#12540#12479
          object UniToolBar5: TUniToolBar
            Left = 0
            Top = 0
            Width = 1578
            Height = 29
            Hint = ''
            TabOrder = 0
            ParentColor = False
            Color = clBtnFace
            object UniSpeedButton_excelExport_sourceData: TUniSpeedButton
              Left = 0
              Top = 0
              Width = 81
              Height = 29
              Hint = ''
              Caption = 'Excel'#20986#21147
              Align = alLeft
              ParentColor = False
              TabOrder = 1
              OnClick = UniSpeedButton_excelExport_sourceDataClick
            end
          end
          object UniStatusBar5: TUniStatusBar
            Left = 0
            Top = 694
            Width = 1578
            Hint = ''
            Panels = <>
            SizeGrip = False
            Align = alBottom
            ParentColor = False
          end
          object UniDBGrid_SourceData: TUniDBGrid
            Left = 0
            Top = 29
            Width = 1578
            Height = 665
            Hint = ''
            DataSource = DataSource_Source
            WebOptions.Paged = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 2
            Exporter.Enabled = True
            Exporter.FileName = 'backLogData'
            Exporter.Exporter = UniGridExcelExporter_sourceData
            Exporter.Title = #12464#12521#12501#20803'Backlog'#12487#12540#12479
            Columns = <
              item
                FieldName = 'status'
                Title.Alignment = taCenter
                Title.Caption = #12473#12486#12540#12479#12473
                Width = 55
                Alignment = taCenter
              end
              item
                FieldName = 'isOpen'
                Title.Alignment = taCenter
                Title.Caption = #20966#29702#20013
                Width = 40
                Visible = False
                Alignment = taCenter
              end
              item
                FieldName = 'taskKind'
                Title.Alignment = taCenter
                Title.Caption = #12479#12473#12463
                Width = 40
              end
              item
                FieldName = 'issueType'
                Title.Alignment = taCenter
                Title.Caption = #12479#12452#12503
                Width = 40
                Alignment = taCenter
              end
              item
                FieldName = 'prioS'
                Title.Alignment = taCenter
                Title.Caption = #20778#20808
                Width = 30
                Alignment = taCenter
              end
              item
                FieldName = 'priority'
                Title.Alignment = taCenter
                Title.Caption = 'PRIO'
                Width = 40
                Alignment = taCenter
              end
              item
                FieldName = 'created'
                Title.Alignment = taCenter
                Title.Caption = #30330#29983#26085
                Width = 115
              end
              item
                FieldName = 'completed'
                Title.Alignment = taCenter
                Title.Caption = #23436#20102#26085
                Width = 115
              end
              item
                FieldName = 'updated'
                Title.Alignment = taCenter
                Title.Caption = #26356#26032#26085
                Width = 115
              end
              item
                FieldName = 'dueDate'
                Title.Alignment = taCenter
                Title.Caption = #26399#38480#26085
                Width = 60
              end
              item
                FieldName = 'duedateOver'
                Title.Alignment = taCenter
                Title.Caption = #36229#36942
                Width = 30
              end
              item
                FieldName = 'untilToday'
                Title.Alignment = taCenter
                Title.Caption = #22793#26356#28961
                Width = 50
              end
              item
                FieldName = 'wholePeriod'
                Title.Alignment = taCenter
                Title.Caption = #20840#26399#38291
                Width = 50
              end
              item
                FieldName = 'summary'
                Title.Alignment = taCenter
                Title.Caption = #12469#12510#12522#12540
                Width = 300
              end
              item
                FieldName = 'MILESTONE'
                Title.Alignment = taCenter
                Title.Caption = #12510#12452#12523#12473#12488#12540#12531
                Width = 90
                Alignment = taCenter
              end
              item
                FieldName = 'CATEGORY'
                Title.Alignment = taCenter
                Title.Caption = #12459#12486#12468#12522#12540
                Width = 120
              end
              item
                FieldName = 'assignee'
                Title.Alignment = taCenter
                Title.Caption = #25285#24403#32773
                Width = 90
              end
              item
                FieldName = 'createdUser'
                Title.Alignment = taCenter
                Title.Caption = #22577#21578#32773
                Width = 90
              end
              item
                FieldName = 'updatedUser'
                Title.Alignment = taCenter
                Title.Caption = #26356#26032#32773
                Width = 90
              end
              item
                FieldName = 'ISSUEKEY'
                Title.Alignment = taCenter
                Title.Caption = 'backlog'#12461#12540
                Width = 175
                Alignment = taCenter
              end>
          end
        end
      end
    end
    object UniSplitter2: TUniSplitter
      Left = 389
      Top = 1
      Width = 6
      Height = 746
      Hint = ''
      Align = alRight
      ParentColor = False
      Color = clBtnFace
      ExplicitLeft = 258
    end
    object UniPanel3: TUniPanel
      Left = 1
      Top = 1
      Width = 388
      Height = 746
      Hint = ''
      Align = alClient
      TabOrder = 3
      Caption = ''
      ExplicitWidth = 257
      object UniPanel4: TUniPanel
        Left = 1
        Top = 704
        Width = 386
        Height = 41
        Hint = ''
        Visible = False
        Align = alBottom
        TabOrder = 1
        Caption = ''
        ExplicitWidth = 255
        object UniButton_createTable4Graph: TUniButton
          Left = 1
          Top = -121
          Width = 384
          Height = 26
          Hint = ''
          Visible = False
          Caption = #12464#12521#12501#29992#12486#12540#12502#12523#20316#25104
          Align = alBottom
          TabOrder = 1
          OnClick = UniButton_createTable4GraphClick
          ExplicitWidth = 253
        end
        object UniButton_setStartDate_endDate: TUniButton
          Left = 1
          Top = -95
          Width = 384
          Height = 25
          Hint = ''
          Visible = False
          Caption = #38283#22987#26085#12539#32066#20102#26085
          Align = alBottom
          TabOrder = 2
          OnClick = UniButton_setStartDate_endDateClick
          ExplicitWidth = 253
        end
        object UniButton_createdCount: TUniButton
          Left = 1
          Top = -70
          Width = 384
          Height = 25
          Hint = ''
          Visible = False
          Caption = #30330#29983#20214#25968#35336#31639
          Align = alBottom
          TabOrder = 3
          OnClick = UniButton_createdCountClick
          ExplicitWidth = 253
        end
        object UniButton_completedCount: TUniButton
          Left = 1
          Top = -45
          Width = 384
          Height = 25
          Hint = ''
          Visible = False
          Caption = #23436#20102#20214#25968#35336#31639
          Align = alBottom
          TabOrder = 4
          OnClick = UniButton_completedCountClick
          ExplicitWidth = 253
        end
        object UniButton1: TUniButton
          Left = 1
          Top = -20
          Width = 384
          Height = 25
          Hint = ''
          Visible = False
          Caption = #12464#12521#12501#34920#31034
          Align = alBottom
          TabOrder = 5
          OnClick = UniButton1Click
          ExplicitWidth = 253
        end
        object UniButton_initializeTable: TUniButton
          Left = 1
          Top = 5
          Width = 384
          Height = 35
          Hint = ''
          Caption = #12486#12540#12502#12523#21021#26399#35373#23450
          Align = alBottom
          TabOrder = 6
          OnClick = UniButton_initializeTableClick
          ExplicitWidth = 253
        end
      end
      object UniPanel5: TUniPanel
        Left = 1
        Top = 1
        Width = 386
        Height = 703
        Hint = ''
        Align = alClient
        ParentFont = False
        Font.Height = -19
        TabOrder = 2
        Caption = ''
        ExplicitWidth = 255
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
          OnClick = UniCheckBox_eGovClick
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
          OnClick = UniCheckBox_eGovClick
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
          OnClick = UniCheckBox_eGovClick
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
          OnClick = UniCheckBox_eGovClick
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
          OnClick = UniCheckBox_eGovClick
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
          OnClick = UniCheckBox_eGovClick
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
          OnClick = UniCheckBox_eGovClick
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
          OnClick = UniCheckBox_eGovClick
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
          OnClick = UniCheckBox_eGovClick
        end
        object UniCheckBox_PrioA: TUniCheckBox
          Left = 80
          Top = 240
          Width = 41
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'A'
          ParentFont = False
          TabOrder = 13
          OnClick = UniCheckBox_eGovClick
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
          OnClick = UniCheckBox_eGovClick
        end
        object UniCheckBox_prioB2B3C: TUniCheckBox
          Left = 31
          Top = 263
          Width = 72
          Height = 17
          Hint = ''
          Caption = 'B2,B3,C'
          ParentFont = False
          TabOrder = 15
          OnClick = UniCheckBox_eGovClick
        end
        object UniButton_createDataandGraph: TUniButton
          Left = 3
          Top = 320
          Width = 253
          Height = 56
          Hint = ''
          Enabled = False
          Caption = #26465#20214#21453#26144#12392#12464#12521#12501#34920#31034
          ParentFont = False
          Font.Height = -19
          Font.Style = [fsBold]
          TabOrder = 16
          OnClick = UniButton_createDataandGraphClick
        end
        object UniLabel1: TUniLabel
          Left = 1
          Top = 1
          Width = 384
          Height = 46
          Hint = ''
          Alignment = taCenter
          AutoSize = False
          Caption = #26465#20214#25351#23450
          Align = alTop
          ParentFont = False
          Font.Height = -16
          TabOrder = 17
          ExplicitWidth = 253
        end
        object UniPanel6: TUniPanel
          Left = 1
          Top = 472
          Width = 384
          Height = 230
          Hint = ''
          Align = alBottom
          TabOrder = 18
          Caption = ''
          ExplicitWidth = 253
          object UniLabel7: TUniLabel
            Left = 3
            Top = 6
            Width = 93
            Height = 13
            Hint = ''
            Caption = #12464#12521#12501#34920#31034#38283#22987#26085
            ParentFont = False
            TabOrder = 1
          end
          object UniDateTimePicker_startDate: TUniDateTimePicker
            Left = 3
            Top = 25
            Width = 99
            Height = 29
            Hint = ''
            DateTime = 45327.000000000000000000
            DateFormat = 'yyyy/MM/dd'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
            ParentFont = False
            Font.Height = -13
            OnChange = UniDateTimePicker_startDateChange
          end
          object UniLabel8: TUniLabel
            Left = 129
            Top = 6
            Width = 93
            Height = 13
            Hint = ''
            Caption = #12464#12521#12501#34920#31034#32066#20102#26085
            ParentFont = False
            TabOrder = 3
          end
          object UniDateTimePicker_endDate: TUniDateTimePicker
            Left = 129
            Top = 25
            Width = 97
            Height = 29
            Hint = ''
            DateTime = 45327.000000000000000000
            DateFormat = 'yyyy/MM/dd'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 4
            ParentFont = False
            Font.Height = -13
            OnChange = UniDateTimePicker_startDateChange
          end
          object UniRadioGroup1: TUniRadioGroup
            Left = 1
            Top = 136
            Width = 382
            Height = 93
            Hint = ''
            Items.Strings = (
              #26085#20184
              #36899#30058)
            ItemIndex = 0
            Align = alBottom
            Caption = #12464#12521#12501'X'#36600
            TabOrder = 5
            ParentFont = False
            OnClick = UniRadioGroup1ChangeValue
            ExplicitWidth = 251
          end
        end
      end
    end
  end
  object UniMemo1: TUniMemo
    Left = 0
    Top = 783
    Width = 1984
    Height = 42
    Hint = ''
    ScrollBars = ssBoth
    Align = alClient
    TabOrder = 2
    OnDblClick = UniMemo1DblClick
    ExplicitWidth = 1853
  end
  object UniSplitter1: TUniSplitter
    Left = 0
    Top = 777
    Width = 1984
    Height = 6
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
    ExplicitWidth = 1853
  end
  object UniStatusBar1: TUniStatusBar
    Left = 0
    Top = 825
    Width = 1984
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    ParentColor = False
    ExplicitWidth = 1853
  end
  object UniCheckBox_PrioB: TUniCheckBox
    Left = 129
    Top = 271
    Width = 42
    Height = 17
    Hint = ''
    Caption = 'B'
    TabOrder = 5
    OnClick = UniCheckBox_eGovClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\TEMP\backlogbug.db'
      'OpenMode=ReadOnly'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 352
    Top = 104
  end
  object FDMemTable1: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 336
    Top = 400
    object FDMemTable1id: TIntegerField
      FieldName = 'id'
    end
    object FDMemTable1noDisplayFlg: TBooleanField
      FieldName = 'noDisplayFlg'
    end
    object FDMemTable1date: TDateField
      FieldName = 'date'
    end
    object FDMemTable1weekday: TStringField
      FieldName = 'weekday'
      Size = 16
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
    object FDMemTable1value_6: TIntegerField
      FieldName = 'value_6'
    end
    object FDMemTable1createdCountofTable: TIntegerField
      FieldName = 'createdCountofTable'
    end
    object FDMemTable1completedCountofTable: TIntegerField
      FieldName = 'completedCountofTable'
    end
    object FDMemTable1sumofcreatedCountonDay: TIntegerField
      FieldName = 'sumofcreatedCountOnDay'
    end
    object FDMemTable1sumofcompletedCountonDay: TIntegerField
      FieldName = 'sumofcompletedCountonDay'
    end
    object FDMemTable1sumUncompletedCountonTheDay: TIntegerField
      FieldName = 'sumUncompletedCountonTheDay'
    end
    object FDMemTable1createdCountonCondition: TIntegerField
      FieldName = 'createdCountonCondition'
    end
    object FDMemTable1completedCountOnCondition: TIntegerField
      FieldName = 'completedCountOnCondition'
    end
    object FDMemTable1sumOfCreated_ConditionByD: TIntegerField
      FieldName = 'sumOfCreated_ConditionByD'
    end
    object FDMemTable1sumOfCompleted_ConditionByD: TIntegerField
      FieldName = 'sumOfCompleted_ConditionByD'
    end
    object FDMemTable1sumUncompletedOnConditionTheDay: TIntegerField
      FieldName = 'sumUncompletedOnConditionTheDay'
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
    Left = 441
    Top = 110
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 417
    Top = 399
  end
  object UniGridExcelExporter_graphData: TUniGridExcelExporter
    FileExtention = 'xlsx'
    MimeType = 
      'application/vnd.openxmlformats-officedocument.spreadsheetml.shee' +
      't'
    Author = 'conphic'
    CharSet = 'UTF-8'
    Left = 549
    Top = 231
  end
  object DataSource_Source: TDataSource
    DataSet = FDQuery_Source
    Left = 522
    Top = 159
  end
  object FDQuery_Source: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from issueTbl')
    Left = 410
    Top = 167
  end
  object UniGridExcelExporter_sourceData: TUniGridExcelExporter
    FileExtention = 'xlsx'
    MimeType = 
      'application/vnd.openxmlformats-officedocument.spreadsheetml.shee' +
      't'
    Author = 'conphic'
    CharSet = 'UTF-8'
    Left = 549
    Top = 295
  end
end
