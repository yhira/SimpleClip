object MemoForm: TMemoForm
  Left = 445
  Top = 213
  Width = 296
  Height = 252
  BorderStyle = bsSizeToolWin
  Caption = #65393#65394#65411#65425#12398#20869#23481
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Memo1: TSonEdit
    Left = 0
    Top = 0
    Width = 288
    Height = 206
    Cursor = crIBeam
    IMEReconvMode = imrAuto
    UndoRec = True
    FreeCaretMode = False
    CaretScrollFix = False
    TopMargin = 14
    LeftMargin = 10
    ScrollStep = 2
    WheelStep = 2
    CurSetMode = True
    SelColor = clNavy
    CREOFcolor = clTeal
    ShowRuler = True
    ShowRulerCur = True
    RulerCurWidth = 5
    TabCount = 6
    ShowEOF = False
    ShowCR = False
    ShowDblSpace = False
    ShowSglSpace = False
    ShowTAB = False
    UndoBuf = 1015808
    LineSpace = 10
    LineSpaceUnit = uPercent
    ShowUnderLine = False
    AutoIndent = False
    BorderStyle = bsSingle
    Color = clWhite
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ReadOnly = False
    HorzScrollBar = True
    VertScrollBar = True
    VertScrollLimit = 20
    WordWrap = True
    AutoWrap = True
    TabOrder = 0
    TabStop = True
    WantTabs = True
    Column = 72
    QuotMarkStr = '>'
    ColorPrintF = True
    ShowHTMLTagColor = False
    URLColor = clBlue
    QuotMarkColor = clGray
    UlineColor = clBlack
    RulerColor = clBlack
    RulerCurColor = clBlack
    RulerHeight = 12
    Version = 'TSonEdit Ver1.37'
    ShowLineNumber = False
    LineNoColumn = 5
    SingleByteMode = False
    DragMode = dmManual
    DragCursor = 1
    BoxSelMode = False
    BoxColumFix = False
    Align = alClient
    Ctl3D = True
    PopupMenu = PopupMenu1
    ParentFont = False
    ShowHint = False
    OnKeyDown = Memo1KeyDown
    OnKeyUp = Memo1KeyUp
    OnDblClick = Memo1DblClick
  end
  object ScriptControl: TScriptControl
    Left = 64
    Top = 24
    Width = 32
    Height = 32
    ControlData = {
      2143341208000000ED030000ED030000D2F1594E010000002400000010270000
      0100080056004200530063007200690070007400}
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    Left = 24
    Top = 24
    object ScriptMenu: TMenuItem
      Caption = #65405#65400#65432#65420#65439#65412#32232#38598'(&S)'
      ShortCut = 16467
    end
    object N1: TMenuItem
      Caption = #20840#12390#65402#65419#65439#65392'(&A)'
      OnClick = N1Click
    end
    object WordWrapMenu: TMenuItem
      Action = WordWrapAction
      AutoCheck = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 112
    Top = 24
    object Undo1: TMenuItem
      Action = EditUndo1
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Cut1: TMenuItem
      Action = EditCut1
    end
    object Copy1: TMenuItem
      Action = EditCopy1
    end
    object Paste1: TMenuItem
      Action = EditPaste1
    end
    object D1: TMenuItem
      Action = EditDelete1
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object A1: TMenuItem
      Action = EditSelectAll1
    end
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    Left = 168
    Top = 24
    object EditUndo1: TEditUndo
      Category = #32232#38598
      Caption = #20803#12395#25147#12377'(&U)'
      Hint = #20803#12395#25147#12377'|'#30452#21069#12398#22793#26356#12434#20803#12395#25147#12377
      ImageIndex = 3
      ShortCut = 16474
      OnExecute = EditUndo1Execute
    end
    object EditCut1: TEditCut
      Category = #32232#38598
      Caption = #20999#12426#21462#12426'(&T)'
      Hint = #20999#12426#21462#12426'|'#36984#25246#37096#20998#12434#20999#12426#21462#12426#12289#12463#12522#12483#12503#12508#12540#12489#12395#36865#12427
      ImageIndex = 0
      ShortCut = 16472
      OnExecute = EditCut1Execute
    end
    object EditCopy1: TEditCopy
      Category = #32232#38598
      Caption = #12467#12500#12540'(&C)'
      Hint = #12467#12500#12540'|'#36984#25246#31684#22258#12434#12463#12522#12483#12503#12508#12540#12489#12395#12467#12500#12540
      ImageIndex = 1
      ShortCut = 16451
      OnExecute = EditCopy1Execute
    end
    object EditPaste1: TEditPaste
      Category = #32232#38598
      Caption = #36028#12426#20184#12369'(&P)'
      Hint = #36028#12426#20184#12369'|'#12463#12522#12483#12503#12508#12540#12489#12398#20869#23481#12434#36028#12426#20184#12369#12427
      ImageIndex = 2
      ShortCut = 16470
      OnExecute = EditPaste1Execute
    end
    object EditDelete1: TEditDelete
      Category = #32232#38598
      Caption = #21066#38500'(&D)'
      Hint = #21066#38500'|'#36984#25246#37096#20998#12434#21066#38500#12377#12427
      ImageIndex = 5
      ShortCut = 46
      OnExecute = EditDelete1Execute
    end
    object EditSelectAll1: TEditSelectAll
      Category = #32232#38598
      Caption = #12377#12409#12390#12434#36984#25246'(&A)'
      Hint = #12377#12409#12390#12434#36984#25246'|'#12489#12461#12517#12513#12531#12488#20840#20307#12434#36984#25246#12377#12427
      ShortCut = 16449
      OnExecute = EditSelectAll1Execute
    end
    object WordWrapAction: TAction
      AutoCheck = True
      Caption = #25240#12426#36820#12375'(&W)'
      OnExecute = WordWrapActionExecute
    end
  end
end
