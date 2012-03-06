object OptionDlg: TOptionDlg
  Left = 699
  Top = 126
  BorderStyle = bsToolWindow
  Caption = #65397#65420#65439#65404#65390#65437
  ClientHeight = 394
  ClientWidth = 312
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    312
    394)
  PixelsPerInch = 96
  TextHeight = 12
  object OKBtn: TButton
    Left = 150
    Top = 360
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    BiDiMode = bdLeftToRight
    Caption = 'OK'
    Default = True
    ModalResult = 1
    ParentBiDiMode = False
    TabOrder = 0
  end
  object CancelBtn: TButton
    Left = 230
    Top = 360
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 1
  end
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 312
    Height = 353
    ActivePage = BasicTabSheet
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object BasicTabSheet: TTabSheet
      Caption = #22522#26412
      ImageIndex = 3
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 36
        Height = 12
        Caption = #23653#27508#25968
      end
      object HistoryRangeLabel: TLabel
        Left = 120
        Top = 8
        Width = 52
        Height = 12
        Caption = '(10 - 100)'
      end
      object TLabel
        Left = 208
        Top = 8
        Width = 85
        Height = 12
        Caption = '*'#65435#65391#65400#65393#65394#65411#65425#25968#38500#12367
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
      end
      object HistoryCountSpinEdit: TSpinEdit
        Left = 56
        Top = 4
        Width = 58
        Height = 21
        Increment = 10
        MaxValue = 100
        MinValue = 10
        TabOrder = 0
        Value = 30
      end
      object NameModeRadioGroup: TRadioGroup
        Left = 8
        Top = 40
        Width = 289
        Height = 81
        Caption = #65394#65426#65392#65404#65438#12289#65420#65383#65394#65433#65393#65394#65411#65425#21517
        ItemIndex = 0
        Items.Strings = (
          #65408#65392#65401#65438#65391#65412#65395#65384#65437#65412#65438#65395#12398#65399#65388#65420#65439#65404#65390#65437
          #65408#65392#65401#65438#65391#65412#65395#65384#65437#65412#65438#65395#12398#65400#65431#65405#21517
          #26085#26178)
        TabOrder = 1
      end
      object IsDblClickExecCheckBox: TCheckBox
        Left = 8
        Top = 232
        Width = 273
        Height = 17
        Caption = #65393#65394#65411#65425#12434#65408#65438#65420#65438#65433#65400#65432#65391#65400#12391#23455#34892
        TabOrder = 4
      end
      object IsMinimizCheckBox: TCheckBox
        Left = 8
        Top = 208
        Width = 209
        Height = 17
        Caption = #38281#12376#12427#65422#65438#65408#65437#12391#65420#65387#65392#65425#12434#38560#12377
        TabOrder = 3
      end
      object SoundGroupBox: TGroupBox
        Left = 8
        Top = 128
        Width = 289
        Height = 73
        Caption = #21177#26524#38899
        TabOrder = 2
        object SpeedButton1: TSpeedButton
          Left = 257
          Top = 40
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object IsSoundCheckBox: TCheckBox
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Caption = #21177#26524#38899#12434#40180#12425#12377
          TabOrder = 0
        end
        object SoundFileEdit: TEdit
          Left = 8
          Top = 40
          Width = 249
          Height = 20
          TabOrder = 1
          Text = 'SoundFileEdit'
        end
      end
      object IsHideFormCheckBox: TCheckBox
        Left = 160
        Top = 208
        Width = 137
        Height = 17
        Caption = #36215#21205#26178#65420#65387#65392#65425#12434#38560#12377
        TabOrder = 5
      end
      object IsClearListCheckBox: TCheckBox
        Left = 160
        Top = 232
        Width = 137
        Height = 17
        Caption = #32066#20102#26178#12289#65432#65405#65412#12434#65400#65432#65393
        TabOrder = 6
        OnClick = IsClearListCheckBoxClick
      end
      object IsHideWhenExeCheckBox: TCheckBox
        Left = 8
        Top = 256
        Width = 153
        Height = 17
        Caption = #23455#34892#24460#12395#65420#65387#65392#65425#12434#38560#12377
        TabOrder = 7
      end
      object IsClearImageCheckBox: TCheckBox
        Left = 160
        Top = 256
        Width = 129
        Height = 17
        Caption = #32066#20102#26178#12289#65394#65426#65392#65404#65438#12434#65400#65432#65393
        TabOrder = 8
      end
      object IsIgnoreWhenHideCheckBox: TCheckBox
        Left = 8
        Top = 280
        Width = 217
        Height = 17
        Caption = #65420#65387#65392#65425#38750#34920#31034#26178#12399#23653#27508#12434#35352#37682#12375#12394#12356
        TabOrder = 9
      end
      object IsItemSortCheckBox: TCheckBox
        Left = 8
        Top = 304
        Width = 217
        Height = 17
        Caption = #65393#65394#65411#65425#20351#29992#26178#12289#20006#12403#26367#12360#12434#12377#12427
        TabOrder = 10
      end
    end
    object CallTabSheet: TTabSheet
      Caption = #21628#20986
      object CallKeyPressRadioGroup: TRadioGroup
        Left = 8
        Top = 0
        Width = 289
        Height = 113
        Caption = #65399#65392#21628#12403#20986#12375
        Items.Strings = (
          #20351#29992#12375#12394#12356#65288#65420#65391#65400#35299#38500#65289
          #65422#65391#65412#65399#65392
          'Shift '#215'2'#22238
          'Ctrl '#215'2'#22238
          'Alt '#215'2'#22238
          'Caps lock '#215'2'#22238)
        TabOrder = 0
        OnClick = CallKeyPressRadioGroupClick
      end
      object HotKeyEdit: THotKeyEdit
        Left = 100
        Top = 29
        Width = 105
        Height = 20
        ControlKey = False
        WindowsKey = False
        ShiftKey = False
        AltKey = False
        KeyText = #12394#12375
        EscapeClear = False
        TabOrder = 1
      end
      object HotkeyClearButton: TButton
        Left = 212
        Top = 29
        Width = 45
        Height = 18
        Caption = #35299#38500
        TabOrder = 2
        TabStop = False
        OnClick = HotkeyClearButtonClick
      end
      object CallMouseActionRadioGroup: TRadioGroup
        Left = 8
        Top = 120
        Width = 289
        Height = 121
        Caption = #65423#65395#65405#21628#12403#20986#12375
        Items.Strings = (
          #20351#29992#12375#12394#12356#65288#65420#65391#65400#35299#38500#65289
          #65411#65438#65405#65400#65412#65391#65420#65438#65408#65438#65420#65438#65433#65400#65432#65391#65400' ('#65434#65420#65412#65422#65438#65408#65437')'
          #65411#65438#65405#65400#65412#65391#65420#65438#65408#65438#65420#65438#65433#65400#65432#65391#65400' ('#65431#65394#65412#65422#65438#65408#65437')'
          #65411#65438#65405#65400#65412#65391#65420#65438#65408#65438#65420#65438#65433#65400#65432#65391#65400' ('#65424#65412#65438#65433#65422#65438#65408#65437')'
          #65408#65405#65400#65412#65434#65394#65408#65438#65420#65438#65433#65400#65432#65391#65400' ('#65434#65420#65412#65422#65438#65408#65437')'
          #65408#65405#65400#65412#65434#65394#65438#65408#65438#65420#65438#65433#65400#65432#65391#65400' ('#65431#65394#65412#65422#65438#65408#65437')'
          #65408#65405#65400#65412#65434#65394#65408#65438#65420#65438#65433#65400#65432#65391#65400' ('#65424#65412#65438#65433#65422#65438#65408#65437')')
        TabOrder = 3
      end
      object IsCallMousePosCheckBox: TCheckBox
        Left = 8
        Top = 242
        Width = 265
        Height = 17
        Caption = #65423#65395#65405#65398#65392#65407#65433#20301#32622#12395#21628#12403#20986#12377
        TabOrder = 4
      end
      object Panel1: TPanel
        Left = 144
        Top = 72
        Width = 137
        Height = 17
        BevelOuter = bvNone
        Caption = '*'#21628#20986#12399#65422#65391#65412#65399#65392#20351#29992#25512#22888
        Enabled = False
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
    object TextTabSheet: TTabSheet
      Caption = #65411#65399#65405#65412
      ImageIndex = 1
      object TextEexeActionRadioGroup: TRadioGroup
        Left = 8
        Top = 32
        Width = 281
        Height = 89
        Caption = #65393#65394#65411#65425#23455#34892#26178#12398#65393#65400#65404#65390#65437
        Items.Strings = (
          #65408#65392#65401#65438#65391#65412#12395#65421#65439#65392#65405#65412
          #65402#65419#65439#65392
          #65408#65438#65394#65393#65435#65400#65438#12434#38283#12356#12390#65420#65383#65394#65433#12395#20445#23384)
        TabOrder = 1
      end
      object IsTextExclusionCheckBox: TCheckBox
        Left = 8
        Top = 8
        Width = 273
        Height = 17
        Caption = #65411#65399#65405#65412#12399#23653#27508#12395#36861#21152#12375#12394#12356
        TabOrder = 0
      end
    end
    object ImageTabSheet: TTabSheet
      Caption = #65394#65426#65392#65404#65438
      ImageIndex = 2
      object DropImgFormatRadioGroup: TRadioGroup
        Left = 8
        Top = 136
        Width = 145
        Height = 89
        Caption = #65412#65438#65435#65391#65420#65439#26178#12398#30011#20687#24418#24335
        Items.Strings = (
          'BITMAP'
          'PNG'
          'JPEG')
        TabOrder = 2
      end
      object ImageEexeActionRadioGroup: TRadioGroup
        Left = 8
        Top = 32
        Width = 281
        Height = 89
        Caption = #65393#65394#65411#65425#23455#34892#26178#12398#65393#65400#65404#65390#65437
        Items.Strings = (
          #65408#65392#65401#65438#65391#65412#12395#65421#65439#65392#65405#65412
          #65402#65419#65439#65392
          #65408#65438#65394#65393#65435#65400#65438#12434#38283#12356#12390#65420#65383#65394#65433#12395#20445#23384)
        TabOrder = 1
      end
      object IsImageExclusionCheckBox: TCheckBox
        Left = 8
        Top = 8
        Width = 265
        Height = 17
        Caption = #65394#65426#65392#65404#65438#12399#23653#27508#12395#36861#21152#12375#12394#12356
        TabOrder = 0
      end
      object IsDelAfterSavedImgCheckBox: TCheckBox
        Left = 8
        Top = 232
        Width = 217
        Height = 17
        Caption = #65394#65426#65392#65404#65438#12434#20445#23384#20966#29702#24460#21066#38500
        TabOrder = 3
      end
    end
    object FileTabSheet: TTabSheet
      Caption = #65420#65383#65394#65433
      ImageIndex = 4
      object DropEexeActionRadioGroup: TRadioGroup
        Left = 8
        Top = 32
        Width = 281
        Height = 89
        Caption = #65393#65394#65411#65425#23455#34892#26178#12398#65393#65400#65404#65390#65437
        Items.Strings = (
          #65408#65392#65401#65438#65391#65412#12395#65421#65439#65392#65405#65412
          #65402#65419#65439#65392
          #65408#65438#65394#65393#65435#65400#65438#12434#38283#12356#12390#65420#65383#65394#65433#12395#20445#23384)
        TabOrder = 1
      end
      object IsDropExclusionCheckBox: TCheckBox
        Left = 8
        Top = 8
        Width = 273
        Height = 17
        Caption = #65420#65383#65394#65433#65432#65405#65412#12399#23653#27508#12395#36861#21152#12375#12394#12356
        TabOrder = 0
      end
    end
    object DesignTabSheet: TTabSheet
      Caption = #65411#65438#65403#65438#65394#65437
      ImageIndex = 5
      object TLabel
        Left = 16
        Top = 56
        Width = 56
        Height = 12
        Caption = #65432#65405#65412#32972#26223#33394
      end
      object TreeFontButton: TButton
        Left = 16
        Top = 16
        Width = 145
        Height = 25
        Caption = #65432#65405#65412#65420#65387#65437#65412
        TabOrder = 0
        OnClick = TreeFontButtonClick
      end
      object TreeColorColorBox: TColorBox
        Left = 16
        Top = 72
        Width = 145
        Height = 22
        DefaultColorColor = clWindow
        NoneColorColor = clWindow
        Selected = clWindow
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
      end
      object IsHotTrackCheckBox: TCheckBox
        Left = 16
        Top = 112
        Width = 233
        Height = 17
        Caption = #65423#65395#65405#36890#36942#12391#38917#30446#12434#24375#35519#34920#31034
        TabOrder = 2
      end
      object TreeIconGroupBox: TGroupBox
        Left = 8
        Top = 144
        Width = 281
        Height = 105
        Caption = #65432#65405#65412#65393#65394#65402#65437
        TabOrder = 3
        object SpeedButton2: TSpeedButton
          Left = 248
          Top = 40
          Width = 23
          Height = 22
          OnClick = SpeedButton2Click
        end
        object IsShowIconCheckBox: TCheckBox
          Left = 8
          Top = 16
          Width = 241
          Height = 17
          Caption = #65393#65394#65402#65437#12398#34920#31034
          TabOrder = 0
        end
        object IconBmpFileEdit: TEdit
          Left = 8
          Top = 40
          Width = 241
          Height = 20
          TabOrder = 1
          Text = 'IconBmpFileEdit'
        end
      end
    end
    object HintTabSheet: TTabSheet
      Caption = #65419#65437#65412
      ImageIndex = 6
      object TLabel
        Left = 8
        Top = 80
        Width = 55
        Height = 12
        Caption = #65419#65437#65412#32972#26223#33394
      end
      object TLabel
        Left = 8
        Top = 128
        Width = 31
        Height = 12
        Caption = #65419#65437#65412#24133
      end
      object TLabel
        Left = 8
        Top = 32
        Width = 55
        Height = 12
        Caption = #65419#65437#65412#25991#23383#33394
      end
      object TLabel
        Left = 64
        Top = 152
        Width = 88
        Height = 12
        Caption = '(200px - 4000px)'
      end
      object HintFontButton: TButton
        Left = 8
        Top = 224
        Width = 145
        Height = 25
        Caption = #65419#65437#65412#65420#65387#65437#65412
        TabOrder = 5
        Visible = False
        OnClick = HintFontButtonClick
      end
      object HintColorColorBox: TColorBox
        Left = 8
        Top = 96
        Width = 145
        Height = 22
        DefaultColorColor = clCream
        NoneColorColor = clCream
        Selected = clCream
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
      end
      object HintWidthSpinEdit: TSpinEdit
        Left = 8
        Top = 144
        Width = 49
        Height = 21
        Increment = 10
        MaxValue = 4000
        MinValue = 200
        TabOrder = 3
        Value = 300
      end
      object HintFontColorColorBox: TColorBox
        Left = 8
        Top = 48
        Width = 145
        Height = 22
        DefaultColorColor = clWindowText
        NoneColorColor = clWindowText
        Selected = clWindowText
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 2
      end
      object IsShowHintCheckBox: TCheckBox
        Left = 8
        Top = 8
        Width = 209
        Height = 17
        Caption = #65419#65437#65412#12398#34920#31034
        TabOrder = 0
      end
      object IsZoomImageCheckBox: TCheckBox
        Left = 8
        Top = 176
        Width = 225
        Height = 17
        Caption = #23567#12373#12356#30011#20687#12399#65419#65437#65412#24133#12414#12391#25313#22823
        TabOrder = 4
      end
      object IsKeepImgSizeHintCheckBox: TCheckBox
        Left = 8
        Top = 200
        Width = 177
        Height = 17
        Caption = #30011#20687#12498#12531#12488#12434#21407#23544#34920#31034
        TabOrder = 6
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'wav'
    Filter = #65403#65395#65437#65412#65438#65420#65383#65394#65433'(*.wav)|*.wav|'#12377#12409#12390#12398#65420#65383#65394#65433'|*.*'
    Left = 260
    Top = 159
  end
  object TreeFontDialog: TFontDialog
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    MinFontSize = 8
    MaxFontSize = 20
    Options = [fdEffects, fdLimitSize]
    Left = 260
    Top = 127
  end
  object HintFontDialog: TFontDialog
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    MinFontSize = 8
    MaxFontSize = 20
    Options = [fdEffects, fdLimitSize]
    Left = 260
    Top = 95
  end
  object OpenDialog2: TOpenPictureDialog
    DefaultExt = 'bmp'
    Filter = #65419#65438#65391#65412#65423#65391#65420#65439#65420#65383#65394#65433'(*.bmp)|*.bmp|'#12377#12409#12390#12398#65420#65383#65394#65433'|*.*'
    Left = 228
    Top = 159
  end
end
