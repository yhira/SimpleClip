unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Clipbrd, Menus, Dbg, ImgList, Jpeg, pngimage, 
  CommModules, ExtIniFile, OptionObject, ShlObj, ActnList, THTskTry,
  SQLiteTable3, DropTarget, DragDropFile, DragDrop, DropSource, Helper,
  StdCtrls, ExtDlgs, Option, AppEvnts, Registry, About, HintWnd,
  CommCtrl, XPMan, TreeViewV, CBWatch, DragDropText, ActiveX,
  NkTextDropTarget, Memo, OleCtrls, MSScriptControl_TLB, yhFiles,
  DropFilesUnit, RichEdit, NkDropTarget, FolderDialog, TextDlgs, SkRegExpW;

type
  TSimpleClipForm = class(TForm)
    Panel1: TPanel;
    TreePopupMenu: TPopupMenu;
    TreeImageList: TImageList;
    TheActionList: TActionList;
    SaveTimer: TTimer;
    TaskTrayIcon: TTHTaskTrayIcon;
    TaskPopupMenu: TPopupMenu;
    CloseAction: TAction;
    C1: TMenuItem;
    DispAction: TAction;
    N1: TMenuItem;
    D1: TMenuItem;
    LockAction: TAction;
    L1: TMenuItem;
    ClearAllItemsAction: TAction;
    DeleteItemAction: TAction;
    D2: TMenuItem;
    N2: TMenuItem;
    TopMostAction: TAction;
    OptionAction: TAction;
    O1: TMenuItem;
    DropFileSource1: TDropFileSource;
    SaveImageAction: TAction;
    SaveTextAction: TAction;
    SaveTextDialog: TSaveDialog;
    SaveImageDialog: TSavePictureDialog;
    EditTextLine: TMenuItem;
    SaveListAction: TAction;
    SaveLineMenu: TMenuItem;
    i1: TMenuItem;
    i2: TMenuItem;
    C3: TMenuItem;
    C2: TMenuItem;
    ClearTextItemsAction: TAction;
    ClearImageItemsAction: TAction;
    ClearDropItemsAction: TAction;
    N5: TMenuItem;
    T1: TMenuItem;
    I3: TMenuItem;
    F1: TMenuItem;
    VersionAction: TAction;
    V1: TMenuItem;
    N6: TMenuItem;
    WindowHandleTimer: TTimer;
    T2: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    ProcExecutiveAction: TAction;
    XPManifest1: TXPManifest;
    ProcPasteAction: TAction;
    ProcCopyAction: TAction;
    PasteAction: TAction;
    CopyAction: TAction;
    ExecutiveAction: TAction;
    N4: TMenuItem;
    N7: TMenuItem;
    TheTreeView: TTreeView;
    ClipboardWatcher: TClipboardWatcher;
    DropTextSource1: TDropTextSource;
    NkTextDropTarget1: TNkTextDropTarget;
    TheIniFile: TExtIniFile;
    ReTaskIconAction: TAction;
    CancelTimer: TTimer;
    N8: TMenuItem;
    DispTextAction: TAction;
    DispTextMenu: TMenuItem;
    ScriptControl: TScriptControl;
    EditTextMenu: TMenuItem;
    N10: TMenuItem;
    ProcEditAndPasteAction: TAction;
    DropFiles1: TDropFiles;
    ExportAction: TAction;
    FolderDialog1: TFolderDialog;
    SimpleEditorAction: TAction;
    N3: TMenuItem;
    N9: TMenuItem;
    ExtChangeOpenDialog1: TExtChangeOpenDialog;
    HiddenLockAction: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    WebSearchIniFile: TExtIniFile;
    WebSearchMenu: TMenuItem;
    NewDbAction: TAction;
    ReadDbAction: TAction;
    SaveDbAction: TAction;
    DbOpenDialog: TOpenDialog;
    DbSaveDialog: TSaveDialog;
    N13: TMenuItem;
    N14: TMenuItem;
    O2: TMenuItem;
    A1: TMenuItem;
    WebSearchInitMemo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure TheTreeViewDeletion(Sender: TObject; Node: TTreeNode);
    procedure TheTreeViewAddition(Sender: TObject; Node: TTreeNode);
    procedure SaveTimerTimer(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure DispActionExecute(Sender: TObject);
    procedure TaskTrayIconClick(Sender: TObject);
    procedure TheActionListUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure LockActionExecute(Sender: TObject);
    procedure TheTreeViewAdvancedCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage;
      var PaintImages, DefaultDraw: Boolean);
    procedure ClearAllItemsActionExecute(Sender: TObject);
    procedure TheTreeViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DeleteItemActionExecute(Sender: TObject);
    procedure TopMostActionExecute(Sender: TObject);
    procedure TheTreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TheTreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TheTreeViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DropFileSource1GetDragImage(Sender: TObject;
      const DragSourceHelper: IDragSourceHelper; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure SaveImageDialogTypeChange(Sender: TObject);
    procedure ClearTextItemsActionExecute(Sender: TObject);
    procedure ClearImageItemsActionExecute(Sender: TObject);
    procedure ClearDropItemsActionExecute(Sender: TObject);
    procedure OptionActionExecute(Sender: TObject);
    procedure SaveTextActionExecute(Sender: TObject);
    procedure SaveListActionExecute(Sender: TObject);
    procedure SaveImageActionExecute(Sender: TObject);
    procedure TheTreeViewKeyPress(Sender: TObject; var Key: Char);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure WindowHandleTimerTimer(Sender: TObject);
    procedure VersionActionExecute(Sender: TObject);
    procedure TheTreeViewMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TheTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure ProcExecutiveActionExecute(Sender: TObject);
    procedure TheTreeViewDblClick(Sender: TObject);
    procedure ProcPasteActionExecute(Sender: TObject); 
    procedure ProcEditAndPasteActionExecute(Sender: TObject);
    procedure ProcCopyActionExecute(Sender: TObject);
    procedure ExecutiveActionExecute(Sender: TObject);
    procedure PasteActionExecute(Sender: TObject);
    procedure CopyActionExecute(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure ClipboardWatcherChange(Sender: TObject);
    procedure TheTreeViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DropTextSource1GetDragImage(Sender: TObject;
      const DragSourceHelper: IDragSourceHelper; var Handled: Boolean);
    procedure NkTextDropTarget1TextDrop(Text: String);
    procedure ReTaskIconActionExecute(Sender: TObject);
    procedure CancelTimerTimer(Sender: TObject);
    procedure DispTextActionExecute(Sender: TObject);
    procedure DropFileSource1AfterDrop(Sender: TObject;
      DragResult: TDragResult; Optimized: Boolean);
    procedure EditTextMenuClick(Sender: TObject);
    procedure TheTreeViewClick(Sender: TObject);
    procedure DropFiles1Drop(Sender: TObject; Files: TStrings);
    procedure TreePopupMenuPopup(Sender: TObject);
    procedure ExportActionExecute(Sender: TObject);
    procedure SimpleEditorActionExecute(Sender: TObject);
    procedure HiddenLockActionExecute(Sender: TObject);
    procedure WebSearchMenuClick(Sender: TObject);
    procedure NewDbActionExecute(Sender: TObject);
    procedure ReadDbActionExecute(Sender: TObject);
    procedure SaveDbActionExecute(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);  
  private
    { Private 宣言 }
//    __NextHandle: HWND;
    hSysmenu :hMenu;
    WatchingClip: Boolean;
    hOldClkWid: HWND;
    IsAlreadyClk, IsAlreadyMouseUp: Boolean;
    ClkStart, KeyDownStart, FirstKeyPushTime: Cardinal;
    KeyCount: Cardinal;
    OldClkPos: TPoint;
//    OldCallKey: TCallKeyPress;
    hDskTop, hTaskTray: HWND;
    HintNode: TTreeNode;
    Terminated: Boolean;
    DragPos: TPoint;
    DragStart: Boolean;
//    hFileMap: Integer;
//    mappedCommon: PMappedCommon;
    FIsTopMost: Boolean;       
    DefFormWndProc: TWndMethod;
    DefTheTreeWndProc: TWndMethod;
    FLastOptTabIndex: Integer;
    FImageDialogInitialDir: string;
    FTextDialogInitialDir: string;
    FImageDialogFilterIndex: Integer;
    FTextDialogFilterIndex: Integer;
    TaskIconHotkeyId: ATOM;
    LastPushedKey: Cardinal;
    FScriptsDirPath: string;
    FTextScriptsDirPath: string;
    FHiddenLock: Boolean;
    procedure FormWndProc(var Message: TMessage);
    procedure TheTreeWndProc(var Message: TMessage);
    procedure Commit;
    procedure Rollback;
    procedure BeginTransaction;
    procedure GetCopyFiles(sl: TStringList);
    function Quo(s: string): string;
    procedure MoveLocedItemToTopOfTheTree(n: TTreeNode);
    procedure SetIsTopMost(const Value: Boolean);
    procedure MakeSystemMenu;
    function GetTempFile(n: TTreeNode): string;
    procedure ClearItems(Mode: TClipMode);
    procedure SetImageDialogInitialDir(const Value: string);
    procedure SetTextDialogInitialDir(const Value: string);
    procedure SetImageDialogFilterIndex(const Value: Integer);
    procedure SetTextDialogFilterIndex(const Value: Integer);
    procedure ExecuteSaveTextDlg;
    procedure DeleteExtraNodeFromTheTree;
    procedure ShowTreeHint(n: TTreeNode);
    function AddTheTreeView(ci: TClipItem): TTreeNode;
    function FindUnlockingFirstNode: TTreeNode;
    function GetAvailable(text: string): string;
    function GetItemName(ci: TClipItem): string;
    function TheTreeItemIndex(ci: TClipItem): Integer;
    procedure ExcuteItem(Action: TAction);
    procedure DropFileSource;
    procedure DropTextSource;
    procedure AddTextToList(AText: string);
    procedure CreateEditTextMenu;
    function GetScriptsDirPath: string;
    function GetTextScriptsDirPath: string;
    procedure SetRESelColor(Memo: TMemo; TextColor, BackColor: TColor);
    function GetExtention(ClipMode: TClipMode): string;
    procedure ActionListUpdate;
    procedure SetHiddenLock(const Value: Boolean);
    function GetAvailableLine(AText: string): string;
    procedure SetFormsCaption(s: string);
  protected
//    procedure WMDrawClipboard(var Message: TWMDrawClipboard);
//      message WM_DRAWCLIPBOARD;
    procedure WMSysCommand(var Message: TWMSysCommand);
      message WM_SYSCOMMAND;
    //ホットキーが押されたときのメッセージを捕捉
    procedure WMHotKey(var Message: TWMHotKey); message WM_HOTKEY;
    procedure WMEnable(var Message: TWMEnable); message WM_ENABLE;
    procedure WMQueryEndSession(var Msg: TWMQueryEndSession);
        message WM_QUERYENDSESSION;
//    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
//    procedure WMNotifyHook(var Msg: TMessage); message WM_NOTIFY_HOOK;
  public
    { Public 宣言 }
    Option: TOption;
    DoubleClickWidth: Integer;
    DoubleClickHeight: Integer;
    TreeHintWindow: THintWindowEx;
    ClipFinishTime: Cardinal;
    TempList: TList;
    procedure LoadDB;
    procedure SaveDB;
    procedure LoadFromIni;
    procedure SaveToIni;  
    procedure LoadFromSearchIni;
    property IsTopMost: Boolean read FIsTopMost write SetIsTopMost;
    property LastOptTabIndex: Integer read FLastOptTabIndex write FLastOptTabIndex;
    property TextDialogInitialDir: string
      read FTextDialogInitialDir write SetTextDialogInitialDir;
    property ImageDialogInitialDir: string
      read FImageDialogInitialDir write SetImageDialogInitialDir;
    property TextDialogFilterIndex: Integer
      read FTextDialogFilterIndex write SetTextDialogFilterIndex;
    property ImageDialogFilterIndex: Integer
      read FImageDialogFilterIndex write SetImageDialogFilterIndex;
    property ScriptsDirPath: string read GetScriptsDirPath;
    property TextScriptsDirPath: string read GetTextScriptsDirPath;
    property HiddenLock: Boolean read FHiddenLock write SetHiddenLock;
  end;

//  procedure InstallHook(hWin: HWND); external 'getmsg.dll';
//  procedure UninstallHook; external 'getmsg.dll';

//function InstallMouseHook(Wnd: HWND): Boolean; stdcall; external 'mh.dll';
//procedure UnInstallMouseHook; stdcall; external 'mh.dll';
//function  GetMouseUniqueMessage: Cardinal;stdcall; external 'mh.dll';
//function InstallKeyHook(Wnd: HWND): Boolean; stdcall; external 'kh.dll';
//procedure UnInstallKeyHook; stdcall; external 'kh.dll';
//function  GetKeyUniqueMessage: Cardinal;stdcall; external 'kh.dll';

var
  SimpleClipForm: TSimpleClipForm; 
var sCaption, sClassName: array[0..255] of Char;

implementation

uses Types;

{$R *.dfm}

{ TForm1 }

  function TSimpleClipForm.GetItemName(ci: TClipItem): string;
  var sl: TStringList;
  begin
    Result := '';
    case Option.NameMode of
      nmDate: Result := DateTimeToStr(Now);
      nmWndCaption: begin
        Result := sCaption;
        if (sClassName = 'Progman') or (sClassName = 'WorkerW') then
          Result := 'デスクトップ';
      end;
      nmWndClass: Result := sClassName;
    end;    
    if ci.ClipMode = cmText then begin
      Result := Result + ' (' + IntToStr(Length(ci.Text)) + 'bytes)';
    end;
    if ci.ClipMode = cmImage then begin
      Result := Result + ' (' + IntToStr(ci.PngImage.Width) +
        'x' + IntToStr(ci.PngImage.Height) + ')';
    end;
    if ci.ClipMode = cmDrop then begin
      sl := TStringList.Create;
      sl.Text := ci.Text;
      Result := Result + ' (' + IntToStr(sl.Count) + 'files)';
      sl.Free;
    end;
//    Result := Result + '  ' +
//      FormatDateTime('yyyymmdd-hhnnsszzz', ci.CreatedDate) + '';

  end;
  function TSimpleClipForm.GetAvailable(text: string): string;
  var i: Integer; sl: TStringList; s: string;
  begin
    Result := '';
    sl := TStringList.Create;
    try
      sl.Text := text;
      for i := 0 to sl.Count-1 do begin
        s := sl[i];
        if Trim(StringReplace(s, '　', ' ', [rfReplaceAll])) <> '' then begin
          Result := Trim(s);
          Exit;
        end;
      end;
    finally
      sl.Free;
    end;
  end;
  function TSimpleClipForm.TheTreeItemIndex(ci: TClipItem): Integer;
  var ms1, ms2: TMemoryStream; i: Integer;
    tmpci: TClipItem;
  begin
    Result := -1;
    for i := 0 to TheTreeView.Items.Count-1 do begin
      tmpci := TClipItem(TheTreeView.Items[i].Data);
      if (ci.Hash = tmpci.Hash) and
        (ci.ClipMode = tmpci.ClipMode) then begin
        case ci.ClipMode of
          cmImage:begin
            ms1 := TMemoryStream.Create;
            ms2 := TMemoryStream.Create;
            ci.PngImage.SaveToStream(ms1);
            tmpci.PngImage.SaveToStream(ms2);
            ms1.Position := 0;
            ms2.Position := 0;
            try
              if ms1.Size = ms2.Size then begin
                Result := i;
                Exit;
              end;
            finally
              ms1.Free;
              ms2.Free;
            end;
          end;
          else
            if ci.Text = tmpci.Text then begin
              Result := i;
              Exit;
            end;
        end;
      end;
    end;

  end;
  function TSimpleClipForm.FindUnlockingFirstNode: TTreeNode;
  var i: Integer;
  begin
    Result := nil;
    for i := 0 to TheTreeView.Items.Count-1 do begin
      if not TClipItem(TheTreeView.Items[i].Data).Lock then begin
        Result := TheTreeView.Items[i];
        Exit;
      end;
    end;
  end;
  function TSimpleClipForm.AddTheTreeView(ci: TClipItem): TTreeNode;
  var t: TTreeView; i, idx: Integer; n, tn, mn: TTreeNode; tmpci: TClipItem;
  begin
    Result := nil;
    t := TheTreeView;
    if t.Items.Count = 0 then begin
      Result := t.Items.AddObjectFirst(nil, ci.Name, ci);
    end else begin
      idx := TheTreeItemIndex(ci);
      if idx = -1 then begin
        for i := 0 to t.Items.Count-1 do begin
          n := t.Items[i];
          tmpci := TClipItem(n.Data);
          if i = (t.Items.Count-1) then begin
            if not tmpci.Lock then begin
              Result := t.Items.InsertObject(n, ci.Name, ci);
            end else begin
              Result := t.Items.AddObject(nil, ci.Name, ci);
            end;     
            Exit;
          end else begin
            if not tmpci.Lock then begin
              Result := t.Items.InsertObject(n, ci.Name, ci);
              Exit;
            end;
          end;
        end;
      end else begin
        
        try
          if not Option.IsItemSort then Exit;
          mn := t.Items[idx];
          tn := FindUnlockingFirstNode;
          tmpci := TClipItem(mn.Data);
          if (tn <> nil) and (not tmpci.Lock) then begin

            if (mn.AbsoluteIndex <> tn.AbsoluteIndex) then
              mn.MoveTo(tn, naInsert);
          end;
        finally
          ci.Free;
        end;

      end;
    end;
  end;
  procedure TSimpleClipForm.AddTextToList(AText: string);
  var ci: TClipItem;
  begin       
    ci := TClipItem.Create;
    ci.ClipMode := cmText;
    ci.Name := GetAvailable(AText);
    ci.Text := AText;
    ci.Hash := ci.ClacHash;
    if ci.Name = '' then ci.Name := GetItemName(ci);
    AddTheTreeView(ci);
  end;

procedure TSimpleClipForm.ClipboardWatcherChange(Sender: TObject);
procedure AddClipText;
var s: String;
begin
//  if Clipboard.HasFormat(CF_TEXT) then begin
    if Option.IsTextExclusion then Exit;
    //テキスト
    try
      try
        s := Clipboard.AsText;
      except

      end;
    finally
      AddTextToList(s);
    end;

//  end;
end;
procedure AddHDrop;
var sl: TStringList;  ci: TClipItem; s: string;
begin
  if Clipboard.HasFormat(CF_HDROP) then begin
    if Option.IsDropExclusion then Exit;

    //ファイル
    sl := TStringList.Create;
    try
      GetCopyFiles(sl);
      ci := TClipItem.Create;
      ci.ClipMode := cmDrop;
      s := Trim(sl.Text);
//      if Trim(s) = '' then Exit;
      ci.Text := s;
      ci.Hash := ci.ClacHash;
      ci.Name := GetItemName(ci);
      AddTheTreeView(ci);
    finally
      sl.Free;
    end;
  end;
end;
var
  hFG: HWND;  len: Integer; 
  bmp: TBitmap; ci: TClipItem; s: string; 
begin
  if not WatchingClip then Exit;
  if Option.IsIgnoreWhenHide and (not Visible) then Exit;
  if ((GetTickCount - ClipFinishTime) < 200) then begin
    ClipFinishTime := GetTickCount;
    ClipboardWatcher.Enabled := False;
    Application.ProcessMessages;
    ClipboardWatcher.Enabled := True;
    Exit;
  end;
  Application.ProcessMessages;

  hFG := GetForegroundWindow;
  //キャプションの長さ取得
  len := GetWindowTextLength(hFG) + 1;
//  SetLength(sCaption, len);
  //キャプションの取得
//  GetWindowText(hFG, PChar(sCaption), len);
  GetWindowText(hFG, sCaption, len);
//  sCaption := Trim(sCaption);
  //クラス名の取得
//  SetLength(sClassName, 256);
//  GetClassName(hFG, PChar(sClassName), 256);
  GetClassName(hFG, sClassName, 256);
//  sClassName := Trim(sClassName);
                            
//  if Clipboard.HasFormat(CF_TEXT) then begin
//    DOut('CF_TEXT');
//  end;
//  if Clipboard.HasFormat(CF_HDROP) then begin
//    DOut('CF_HDROP');
//  end;
//  DOut('1');
//  beep;
  if Clipboard.HasFormat(CF_TEXT) then begin
    if Option.IsTextExclusion then Exit;
    //テキスト
    AddClipText;

  end;
  if Clipboard.HasFormat(CF_BITMAP) then  begin
    if Option.IsImageExclusion then Exit;
    //画像
    ci := TClipItem.Create;
    ci.ClipMode := cmImage;
    bmp := TBitmap.Create;
//    ms := TMemoryStream.Create;
    try
      bmp.Assign(Clipboard);
      ci.PngImage.Assign(bmp);
//      ci.PngImage.SaveToStream(ms);
//      ms.Position := 0;
      ci.Hash := ci.ClacHash;
      ci.Name := GetItemName(ci);
      AddTheTreeView(ci);
    finally
      bmp.Free;
//      ms.Free;
    end;
  end;
  if Clipboard.HasFormat(CF_HDROP) then begin
    if Option.IsDropExclusion then Exit;
//
    //テキスト
    AddClipText;       //DOut('d');
    //ファイル
    AddHDrop;
//    sl := TStringList.Create;
//    GetCopyFiles(sl);
//    ci := TClipItem.Create;
//    ci.ClipMode := cmDrop;
//    s := Trim(sl.Text);
//    ci.Text := s;
//    ci.Hash := ci.ClacHash;
//    ci.Name := GetItemName(ci);
//    AddTheTreeView(ci);
//
//    sl.Free;
  end;
  DeleteExtraNodeFromTheTree;
  ClipFinishTime := GetTickCount;
end;


//procedure TSimpleClipForm.WMDrawClipboard(var Message: TWMDrawClipboard);
//var
//  hFG: HWND;  s: string; len: Integer; sl: TStringList;
//  bmp: TBitmap;  ci: TClipItem;
//begin
//  if not WatchingClip then Exit;
//  Application.ProcessMessages;
//
//  hFG := GetForegroundWindow;
//  //キャプションの長さ取得
//  len := GetWindowTextLength(hFG) + 1;
////  SetLength(sCaption, len);
//  //キャプションの取得
////  GetWindowText(hFG, PChar(sCaption), len);
//  GetWindowText(hFG, sCaption, len);
////  sCaption := Trim(sCaption);
//  //クラス名の取得
////  SetLength(sClassName, 256);
////  GetClassName(hFG, PChar(sClassName), 256);
//  GetClassName(hFG, sClassName, 256);
////  sClassName := Trim(sClassName);
//
//  if Clipboard.HasFormat(CF_TEXT) then begin
//    if not Option.IsTextExclusion then Exit;
//    //テキスト
//    ci := TClipItem.Create;
//    ci.ClipMode := cmText;
//    s := Clipboard.AsText;
//    ci.Name := GetAvailable(s);
//    ci.Text := s;
//    ci.Hash := ci.ClacHash;
//    if ci.Name = '' then ci.Name := GetItemName(ci);
//    AddTheTreeView(ci);
////    TheTreeView.Items.AddObjectFirst(nil, ci.Name, ci);
//  end else if Clipboard.HasFormat(CF_BITMAP) then  begin
//    if not Option.IsImageExclusion then Exit;
//    //画像
//    ci := TClipItem.Create;
//    ci.ClipMode := cmImage;
//    bmp := TBitmap.Create;
////    ms := TMemoryStream.Create;
//    try
//      bmp.Assign(Clipboard);
//      ci.PngImage.Assign(bmp);
////      ci.PngImage.SaveToStream(ms);
////      ms.Position := 0;
//      ci.Hash := ci.ClacHash;
//      ci.Name := GetItemName(ci);
//      AddTheTreeView(ci);
////      TheTreeView.Items.AddObjectFirst(nil, ci.Name, ci);
//    finally
//      bmp.Free;
////      ms.Free;
//    end;
//  end else if Clipboard.HasFormat(CF_HDROP) then begin
//    if not Option.IsDropExclusion then Exit;
//    //ファイル
//    ci := TClipItem.Create;
//    ci.ClipMode := cmDrop;
//    sl := TStringList.Create;
//    GetCopyFiles(sl);
//    s := Trim(sl.Text);
//    ci.Text := s;
//    ci.Hash := ci.ClacHash;
//    ci.Name := GetItemName(ci);
//    sl.Free;
//    AddTheTreeView(ci);
////    ci.Free;
////    TheTreeView.Items.AddObjectFirst(nil, ci.Name, ci);
//  end;
//  DeleteExtraNodeFromTheTree;
//end;

procedure TSimpleClipForm.FormCreate(Sender: TObject);
  function GetDoubleClickWidth: Integer;
  var reg: TRegistry; //Registry追加
  begin
    Result := 4; //デフォルトの4を指定
    reg := TRegistry.Create(KEY_READ);
    try
      reg.RootKey := HKEY_CURRENT_USER;
      if not reg.OpenKey('Control Panel\Mouse', False) then Exit;
      Result := StrToIntDef(reg.ReadString('DoubleClickWidth'), 4);
    finally
      reg.Free;
    end;                               
  end;

  function GetDoubleClickHeight: Integer;
  var reg: TRegistry; //Registry追加
  begin
    Result := 4; //デフォルトの4を指定
    reg := TRegistry.Create(KEY_READ);
    try
      reg.RootKey := HKEY_CURRENT_USER;
      if not reg.OpenKey('Control Panel\Mouse', False) then Exit;
      Result := StrToIntDef(reg.ReadString('DoubleClickHeight'), 4);
    finally
      reg.Free;
    end;
  end;
var s: string;
const ABOVE_NORMAL_PRIORITY_CLASS = $00008000;
begin
  TheIniFile.FileName := ExtractFilePath(Application.ExeName) + 'SimpleClip.ini';
  s := TheIniFile.ReadStr('Initialization', 'DataFile', '');
  if s <> '' then begin
    db_file := s;
    TheDB.Free;
    TheDB := TSQLiteDatabase.Create(db_file);
  end;

  if not FileExists(WebSearchIniFile.FileName) then begin
    WebSearchInitMemo.Lines.SaveToFile(WebSearchIniFile.FileName);
  end;

//  TaskTrayIcon.Enabled := True;
//  TaskTrayIcon.Icon := Application.Icon;
//  ClipboardWatcher.Chain := True;
  {Create}
  TreeHintWindow := THintWindowEx.Create(Self);
  TempList := TList.Create;
  {/////////////////init//////////////}
  WatchingClip := False;
  TreeView_SetToolTips(TheTreeView.Handle, 0);
//  __NextHandle := SetClipboardViewer(Handle);
  MakeSystemMenu;
  DoubleClickWidth := GetDoubleClickWidth;
  DoubleClickHeight := GetDoubleClickHeight;
  hTaskTray := FindWindow('Shell_TrayWnd', nil);
  hDskTop := FindWindow('Progman', 'Program Manager');

  ClipFinishTime := GetTickCount;

  //ウィンドウプロシージャの入れ替え   
  DefFormWndProc := WindowProc;
  WindowProc := FormWndProc;
  DefTheTreeWndProc := TheTreeView.WindowProc;
  TheTreeView.WindowProc := TheTreeWndProc;

  //タスクトレイの表示ホットキーの追加
  //文字列を識別する一意の値をもらいそれをホットキーIDとする
  TaskIconHotkeyId := GlobalAddAtom('TaskIconHotkeyId');
  //ホットキーの登録               //Ctrl + Alt + Shift + F1
  RegisterHotKey(Handle, TaskIconHotkeyId, MOD_ALT or MOD_CONTROL or MOD_SHIFT, VK_F1);


  //プロセスの優先順位を変更
  SetPriorityClass(GetCurrentProcess, ABOVE_NORMAL_PRIORITY_CLASS);
  //スレッドの優先順位を変更
  SetThreadPriority(GetCurrentThread, THREAD_PRIORITY_ABOVE_NORMAL);

  //Option
  Option := TOption.Create;
  Option.LoadFromIni;
  //data
  LoadDB;     
  //Window
  Self.LoadFromIni;

  LoadFromSearchIni;

  CreateEditTextMenu;

  WatchingClip := True;
end;

procedure TSimpleClipForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Option.IsMinimiz and
     (not Terminated) then begin
    Hide;
//    Application.Minimize;
    CanClose := False;
    Exit;
  end;
  
  Terminated := True;
  if Option.IsClearList then ClearAllItemsAction.Execute;   
  if Option.IsClearImage then ClearImageItemsAction.Execute;

  SaveDB;
//  Option.SaveToIni;
  Self.SaveToIni;
  TheIniFile.WriteStr('Initialization', 'DataFile', db_file);
end;

procedure TSimpleClipForm.FormDestroy(Sender: TObject);
var i: Integer;
begin
//  for i := TheTreeView.Items.Count-1 downto 0 do
//    TheTreeView.Items[i].Delete;;

//  //unhook
//  UnhookWindowsHookEx(JournalHook);

//  UnInstallMouseHook;
//  UnInstallKeyHook;

  //  //filemap
//   UnInstallHook;
//   UnmapViewOfFile(mappedCommon);
//   CloseHandle(hFileMap);
  for i := WebSearchMenu.Count-1 downto 0 do begin
    TWebSearchItem(WebSearchMenu.Items[i].Tag).Free;
  end;

  //ホットキーの登録解除
  UnregisterHotKey(Handle, TaskIconHotkeyId);
  //アトムに関連付けられている文字列を、アトムテーブルから削除
  DeleteAtom(TaskIconHotkeyId);

  WindowProc := DefFormWndProc;
  TheTreeView.WindowProc := DefTheTreeWndProc;

  TheTreeView.Items.Clear;
  TreeHintWindow.Free;
  TempList.Free;
  Option.Free;
end;

procedure TSimpleClipForm.Commit;
begin
  TheDB.Commit;
end;

procedure TSimpleClipForm.Rollback;
begin
  TheDB.Rollback;
end;

procedure TSimpleClipForm.BeginTransaction;
begin
  TheDB.BeginTransaction;
end;

procedure TSimpleClipForm.LoadDB;
var tb: TSQLIteTable; sql: string; ci: TClipItem;
  ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  sql := 'SELECT * FROM ' + TABLE_NAME;
  tb := TheDB.GetTable(sql);
//  Douti(tb.RowCount);
  with tb do begin
    MoveFirst;
    while not EOF do begin
      ci := TClipItem.Create;

      ci.ID :=          FieldAsInteger(FieldIndex[CLM_ID]);
      ci.Name :=        FieldByName[CLM_NAME];
      ci.ClipMode :=    TClipMode(FieldAsInteger(FieldIndex[CLM_CLIPMODE]));
      ci.UsedCount :=   FieldAsInteger(FieldIndex[CLM_USEDCOUNT]);
      ci.CreatedDate := FieldAsDouble(FieldIndex[CLM_CREATEDDATE]);
      ci.UpdatedDate := FieldAsDouble(FieldIndex[CLM_UPDATEDDATE]);
      ci.UsedDate :=    FieldAsDouble(FieldIndex[CLM_USEDDATE]);
      ci.Lock :=        Boolean(FieldAsInteger(FieldIndex[CLM_LOCK]));
      ci.Text :=        FieldByName[CLM_TEXT];  
      ci.Hash :=        FieldByName[CLM_HASH];
      if ci.ClipMode = cmImage then begin
        ms.LoadFromStream(FieldAsBlob(FieldIndex[CLM_IMAGE]));
        ms.Position := 0;
        ci.PngImage.LoadFromStream(ms);
      end;

      TheTreeView.Items.AddObject(nil, ci.Name, ci);
      
      Next;
    end;
  end;
  tb.Free;
  ms.Free;
end;

procedure TSimpleClipForm.SaveDB;
var i: Integer; ci: TClipItem; ms: TMemoryStream; sql: string; tmpBool: Boolean;
begin          
  TheTreeView.Items.BeginUpdate;
  tmpBool := HiddenLock;
  HiddenLock := False; //保存する前に必ず隠したロックアイテムを表示させておく
  ms := TMemoryStream.Create;
  BeginTransaction;
  try
    TheDB.ExecSQL('DELETE FROM '+TABLE_NAME+';');
    for i := 0 to TheTreeView.Items.Count-1 do begin
      ci := TClipItem(TheTreeView.Items[i].Data);
      sql := 'INSERT INTO '+TABLE_NAME+' ' + '('+
        //カラム
        CLM_NAME + ', ' +
        CLM_CLIPMODE + ', ' +
        CLM_USEDCOUNT + ', ' +
        CLM_CREATEDDATE + ', ' +
        CLM_UPDATEDDATE + ', ' +
        CLM_USEDDATE + ', ' +
        CLM_LOCK + ', ' +
        CLM_TEXT + ', ' +
        CLM_HASH + ')'  +
        'VALUES (' +
        //値
        Quo(ci.Name) + ', ' +
        Quo(IntToStr(Ord(ci.ClipMode))) + ', ' +
        Quo(IntToStr(ci.UsedCount)) + ', ' +
        Quo(FloatToStr(ci.CreatedDate)) + ', ' +
        Quo(FloatToStr(ci.UpdatedDate)) + ', ' +
        Quo(FloatToStr(ci.UsedDate)) + ', ' +
        Quo(IntToStr(Integer(ci.Lock))) + ', ' +
        Quo(ci.Text) + ', ' +
        Quo(ci.Hash) +
         ')';
      TheDB.ExecSQL(sql);
  //    ShowMessage(sql);
        if ci.ClipMode = cmImage then begin
          ms.Clear;
          ci.PngImage.SaveToStream(ms);
          TheDB.UpdateBlob('UPDATE ' + TABLE_NAME +
            ' SET ' + CLM_IMAGE + ' = ?' +
            ' WHERE ' + CLM_ID + ' = ' + Quo(IntToStr(TheDB.GetLastInsertRowID)),
            ms);
        end;
    end;
    Commit;
  except
    Rollback;
    raise Exception.Create('DBの保存に失敗したのでﾛｰﾙﾊﾞｯｸしました。。');
  end;
  ms.Free;
  HiddenLock := tmpBool;
  TheTreeView.Items.EndUpdate;
end;

procedure TSimpleClipForm.LoadFromIni;
begin
  with TheIniFile do begin
    ReadFormEx2('Window', Self);
    IsTopMost := ReadBool('WndOption', 'IsTopMost', True);  
    HiddenLock := ReadBool('WndOption', 'HiddenLock', False);
    LastOptTabIndex := ReadInt('WndOption', 'LastOptTabIndex', 0);
    TextDialogInitialDir := ReadStr('WndOption',
      'TextDialogInitialDir', SaveTextDialog.InitialDir);
    ImageDialogInitialDir := ReadStr('WndOption',
      'ImageDialogInitialDir', SaveImageDialog.InitialDir);   
    TextDialogFilterIndex := ReadInt('WndOption',
      'TextDialogFilterIndex', SaveTextDialog.FilterIndex);
    ImageDialogFilterIndex := ReadInt('WndOption',
      'ImageDialogFilterIndex', SaveImageDialog.FilterIndex);
  end;
end;

procedure TSimpleClipForm.SaveToIni;
begin
  with TheIniFile do begin
    WriteForm2('Window', Self);
    WriteBool('WndOption', 'IsTopMost', IsTopMost);   
    WriteBool('WndOption', 'HiddenLock', HiddenLock);
    WriteInt('WndOption', 'LastOptTabIndex', LastOptTabIndex);
    WriteStr('WndOption', 'TextDialogInitialDir', TextDialogInitialDir);  
    WriteStr('WndOption', 'ImageDialogInitialDir', ImageDialogInitialDir);
    WriteInt('WndOption', 'TextDialogFilterIndex', TextDialogFilterIndex);
    WriteInt('WndOption', 'ImageDialogFilterIndex', ImageDialogFilterIndex);

    Update;
  end;
end;

procedure TSimpleClipForm.TheTreeViewDeletion(Sender: TObject;
  Node: TTreeNode);
var obj: TObject;
begin
  obj := TObject(Node.Data);
  if Assigned(obj) then FreeAndNil(obj);
  ShowScrollBar(TheTreeView.Handle, SB_HORZ , False);
end;

procedure TSimpleClipForm.GetCopyFiles(sl: TStringList);
  function WideStrLen(WideStr:PWideChar):Cardinal;
  begin
    result := lstrlenW(WideStr);
  end;
  procedure GetFilesW(MS:TMemoryStream; offset:Cardinal; Files:TStrings);
  var
    ws:WideString;
    p:pointer;
    pEnd:Cardinal;
  begin
    pEnd := Cardinal(MS.Memory)+Cardinal(MS.Size);
    p := pointer(Cardinal(MS.Memory)+offset);
    repeat
      SetString(ws,PWideChar(p),WideStrLen(p));
      Files.Add(ws);
      p := pointer(integer(p)+Length(ws)*2+2);
    until (Cardinal(p) >= pEnd) or (PWord(p)^ = 0);
  end;
  procedure GetFilesA(MS:TMemoryStream; offset:Cardinal; Files:TStrings);
  var
    s:string;
    p:pointer;
    pEnd:Cardinal;
  begin
    pEnd := Cardinal(MS.Memory)+Cardinal(MS.Size);
    p := pointer(Cardinal(MS.Memory)+offset);
    repeat
      SetString(s,PChar(p),StrLen(PChar(p)));
      Files.Add(s);
      p := pointer(integer(p)+Length(s)+1);
    until (Cardinal(p) >= pEnd) or (PByte(p)^ = 0);
  end;
var
  MS:TMemoryStream;
  hBuf:THandle;
  DF: ShlObj.TDropFiles;
  p:pointer;
begin
  MS := TMemoryStream.Create;
  try
    if Clipboard.HasFormat(CF_HDROP) then begin
      ClipBoard.Open;
      hBuf := Clipboard.GetAsHandle(CF_HDROP);
      p := GlobalLock(hBuf);
      MS.WriteBuffer(p^,GlobalSize(hBuf));
      GlobalUnlock(hBuf);
      Clipboard.Close;

      MS.Position := 0;
      MS.Read(DF,SizeOf(TDropFiles));
      if DF.fWide then begin
        GetFilesW(MS,DF.pFiles,sl);
      end else begin
        GetFilesA(MS,DF.pFiles,sl);
      end;
      sl.Sort;
    end;
  finally
    MS.Free;
  end;
end;

procedure TSimpleClipForm.DeleteExtraNodeFromTheTree;
  function GetItemCount: Integer;
  var i: Integer; ci: TClipItem;
  begin
    Result := 0;
    for i := 0 to TheTreeView.Items.Count-1 do begin
      ci := TClipItem(TheTreeView.Items[i].Data);
      if not ci.Lock then Inc(Result);
    end;
  end;
var i: Integer;
begin
  while GetItemCount > Option.HistoryCount do begin
    i := TheTreeView.Items.Count-1;
    TheTreeView.Items[i].Delete;
  end;
end;

procedure TSimpleClipForm.TheTreeViewAddition(Sender: TObject;
  Node: TTreeNode);
var ci: TClipItem; i: Integer;
begin
  ci := TClipItem(Node.Data);
  i :=  Ord(ci.ClipMode);
  if ci.Lock then i := i + 3;
  Node.ImageIndex := i;
  Node.SelectedIndex := i;

  ShowScrollBar(TheTreeView.Handle, SB_HORZ , False);
//  count := GetItemCount;
//  if count > Option.HistoryCount then begin
//    n := count - Option.HistoryCount;
//    for i := TheTreeView.Items.Count-1 downto
//             TheTreeView.Items.Count-1-n do begin
//      TheTreeView.Items[i].Delete;
//    end;
//  end;
end;

procedure TSimpleClipForm.SaveTimerTimer(Sender: TObject);
begin
  SaveDB; 
end;

function TSimpleClipForm.Quo(s: string): string;
begin
  Result := AnsiQuotedStr(s, '''');
end;

procedure TSimpleClipForm.CloseActionExecute(Sender: TObject);
begin        
  Terminated := True;
  Close;
end;

procedure TSimpleClipForm.DispActionExecute(Sender: TObject);
var p: TPoint;  
  h: HWND;
  ThreadID1, ThreadID2 : Cardinal;
  Buf: ^DWORD;
begin
  if Option.IsCallMousePos then begin
    GetCursorPos(p);
    Left := p.X - (Width div 2);
    Top := p.Y - (Height div 2);
    OnWorkArea(Self);
  end;
//  if IsIconic(Application.Handle) then
//    Application.Restore;
//  SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOSIZE or SWP_NOMOVE);
//  if not IsTopMost then
//    SetWindowPos(Handle,HWND_NOTOPMOST,0,0,0,0,SWP_NOSIZE or SWP_NOMOVE);
//  SetForegroundWindow(Handle);
//  SetFocusedControl(TheTreeView);
//  Show;

  Application.ProcessMessages;

  Buf := GetMemory(SizeOf(DWORD));
  //現在ユーザーが作業しているウィンドウを取得
  h := GetForegroundWindow;
  //フォアグラウンドウィンドウを作成したスレッドのIDを取得
  ThreadID1 := GetWindowThreadProcessId(h);
  //目的のウィンドウを作成したスレッドのIDを取得
  ThreadID2 := GetCurrentThreadId;
  //現在の入力状態を目的のスレッドにアタッチ
  AttachThreadInput(ThreadID1, ThreadID2, True);
  //現在の[フォアグラウンド ロック タイムアウト]の設定を取得
  SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, Buf, 0);
  //設定を 0ms に変更
  SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, nil, 0);

//  hide;
  if IsIconic(Application.Handle) then
    Application.Restore;
//  SetWindowPos(Handle,HWND_TOPMOST,0,0,0,0,SWP_NOSIZE or SWP_NOMOVE);
//  if not IsTopMost then
//    SetWindowPos(Handle,HWND_NOTOPMOST,0,0,0,0,SWP_NOSIZE or SWP_NOMOVE);
  SetForegroundWindow(Handle);
  SetFocusedControl(TheTreeView);
  Show;

  //設定を元に戻して…
  SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, Buf, 0);
  //デタッチしておしまい
  AttachThreadInput(ThreadID2, ThreadID1, False);
  FreeMemory(Buf);
end;

procedure TSimpleClipForm.TaskTrayIconClick(Sender: TObject);
begin
  DispAction.Execute;
end;

procedure TSimpleClipForm.ActionListUpdate;
var IsTheTreeEmpty , IsItemSelected, IsTextEdit: Boolean;
  selNode: TTreeNode; ci: TClipItem;
  sc: TShortCut;    
begin 
  ci := nil;
  IsTheTreeEmpty := TheTreeView.Items.Count = 0;
  IsItemSelected := TheTreeView.Selected <> nil;
  selNode := TheTreeView.Selected;
  if IsItemSelected then
    ci := TClipItem(selNode.Data);
  //enabled
  ClearAllItemsAction.Enabled := not IsTheTreeEmpty;
  ClearTextItemsAction.Enabled := not IsTheTreeEmpty;
  ClearImageItemsAction.Enabled := not IsTheTreeEmpty;
  ClearDropItemsAction.Enabled := not IsTheTreeEmpty;
  LockAction.Enabled := IsItemSelected;
  DeleteItemAction.Enabled := IsItemSelected and (not ci.Lock);
  if TheTreeView.Selected <> nil then begin
    if ci.ClipMode = cmImage then begin
      DispTextMenu.Caption := 'ﾀｲﾄﾙ変更(&T)';
    end else begin
      DispTextMenu.Caption := 'ﾃｷｽﾄ表示(&T)';
    end;
  end else begin
    DispTextAction.Caption := '簡易ｴﾃﾞｨﾀ(&T)'
  end;

  //check
  LockAction.Checked := IsItemSelected and ci.Lock;
  //visible
  SaveTextAction.Visible := IsItemSelected and (ci.ClipMode = cmText);
  SaveImageAction.Visible := IsItemSelected and (ci.ClipMode = cmImage);
  SaveListAction.Visible := IsItemSelected and (ci.ClipMode = cmDrop);
  sc := TextToShortCut('Ctrl+S');
  if SaveTextAction.Visible then begin
    SaveTextAction.ShortCut := sc;
  end else begin
    SaveTextAction.ShortCut := 0;
  end;
  if SaveImageAction.Visible then begin
    SaveImageAction.ShortCut := sc;
  end else begin
    SaveImageAction.ShortCut := 0;
  end;
  if SaveListAction.Visible then begin
    SaveListAction.ShortCut := sc;
  end else begin
    SaveListAction.ShortCut := 0;
  end;
  SaveLineMenu.Visible := IsItemSelected; 
  WebSearchMenu.Visible := IsItemSelected and FileExists(WebSearchIniFile.FileName) and
    (WebSearchMenu.Count <> 0);
  IsTextEdit := DirectoryExists(TextScriptsDirPath)
    and IsItemSelected and ((ci.ClipMode = cmText) or (ci.ClipMode = cmDrop));
  EditTextMenu.Visible := IsTextEdit;
  EditTextLine.Visible := IsTextEdit;
end;

procedure TSimpleClipForm.TheActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  ActionListUpdate;
end;

procedure TSimpleClipForm.MoveLocedItemToTopOfTheTree(n: TTreeNode);
var ci, tci: TClipItem; nn: TTreeNode; i: Integer;
begin
  ci := TClipItem(n.Data);
  if ci.Lock then begin
    n.MoveTo(TheTreeView.Items[0], naAddFirst);
  end else begin
    for i := TheTreeView.Items.Count-1 downto 0 do begin
      nn := TheTreeView.Items[i];
      tci := TClipItem(nn.Data);
      if tci.Lock then begin
        if n.AbsoluteIndex = TheTreeView.Items.Count-1 then Exit;
        if nn.AbsoluteIndex = TheTreeView.Items.Count-1 then begin
          n.MoveTo(nil, naAdd);
          Exit;
        end;
        n.MoveTo(TheTreeView.Items[i+1], naInsert);
        Exit;
      end;
    end;
  end;
end;

procedure TSimpleClipForm.LockActionExecute(Sender: TObject);
var ci: TClipItem; n: TTreeNode;
begin
  n := TheTreeView.Selected; 
  ci := TClipItem(n.Data);
  ci.Lock := not ci.Lock;
  //change icon
  TheTreeViewAddition(TheTreeView, TheTreeView.Selected);

  MoveLocedItemToTopOfTheTree(n);
  TheTreeView.Invalidate;
end;

procedure TSimpleClipForm.TheTreeViewAdvancedCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
//var r: TRect; ci: TClipItem; rgn: HRGN;
begin
//  with TCustomTreeView(Sender).Canvas do begin
////  if (cdPostPaint <> Stage) then Exit;
//  if cdsSelected in State then Exit;
//  if not TClipItem(Node.Data).Lock then Exit;
//    r := Node.DisplayRect(False);
//    Brush.Color := RGB(0,255,255);
////    rgn := CreateRectRgn(r.Left,r.Top,r.Left+11,r.Bottom);
////    SelectClipRgn(Handle, rgn);
////
////    Pen.Color := $0032BAE7;
////    Pen.Width := 1;
////    Ellipse(Rect(r.Left+3, r.Bottom-12, r.Left+11,r.Bottom-4));
////    Pen.Width := 6;
//////    Brush.Color := $0032BAE7;
////    Rectangle(Rect(r.Left+6, r.Bottom-4, r.Left+8,r.Bottom-6));
////    SelectClipRgn(Handle, 0);
////    pen.Color := $002486B0;
////    Pen.Width := 1;
////    MoveTo(r.Left+12, r.Bottom-10);
////    LineTo(r.Left+12, r.Bottom);
////    Brush.Color := clwindow;//TTreeView(Sender).Color;
////    DefaultDraw := True;
//  end;
end;

procedure TSimpleClipForm.ClearAllItemsActionExecute(Sender: TObject);
var i: Integer; n: TTreeNode;
begin
  if Terminated or
    (MessageDlg('ﾛｯｸｱｲﾃﾑ以外の全てのｱｲﾃﾑを削除します。'#13#10 +
    'よろしいですか？',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    for i := TheTreeView.Items.Count-1 downto 0 do begin
      n := TheTreeView.Items[i];
      if not TClipItem(n.Data).Lock then
        n.Delete;
    end;
end;

procedure TSimpleClipForm.TheTreeViewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var n: TTreeNode;
begin
  n := TheTreeView.GetNodeAt(X, Y);
  if Button = mbLeft then begin
    if n = nil then begin
      TheTreeView.Selected := nil;
      Exit;
    end;
    if (not Option.IsDblClickExec) and (n <> nil) then begin
      GetCursorPos(DragPos);
      DragStart := True;
    end;
  end;
  if Button = mbRight then begin
    if n <> nil then begin
      TheTreeView.Selected := n;
    end else begin
      TheTreeView.Selected := nil;

    end;
  end;
//  TheTreeView.BeginDrag(False);
end;

procedure TSimpleClipForm.DeleteItemActionExecute(Sender: TObject);
begin
  if TheTreeView.Selected <> nil then
    TheTreeView.Selected.Delete;
end;

procedure TSimpleClipForm.SetIsTopMost(const Value: Boolean);
begin
  FIsTopMost := Value;
  TopMostAction.Checked := Value;
  if Value then begin
    SetWindowPos(Handle, HWND_TOPMOST,0,0,0,0,SWP_NOSIZE or SWP_NOMOVE);
    CheckMenuItem(hSysmenu, MENU_MOPMOST, MF_CHECKED);
  end else begin
    SetWindowPos(Handle, HWND_NOTOPMOST,0,0,0,0,SWP_NOSIZE or SWP_NOMOVE);
    CheckMenuItem(hSysmenu, MENU_MOPMOST, MF_UNCHECKED);
  end;
end;

procedure TSimpleClipForm.WMSysCommand(var Message: TWMSysCommand);
begin
  //メッセージの内容で処理をわける
  case Message.CmdType of
    MENU_MOPMOST: TopMostAction.Execute;
    MENU_OPTION:  OptionAction.Execute;
    MENU_VERSION: VersionAction.Execute;
    MENU_EXPORT:  ExportAction.Execute;
    MENU_EDITOR:  begin
      TheTreeView.Selected := nil;
      DispTextAction.Execute;
    end;
    MENU_HIDDENLOCK: HiddenLockAction.Execute;
    MENU_NEWDB:  NewDbAction.Execute;
    MENU_READDB: ReadDbAction.Execute;
    MENU_SAVEDB: SaveDbAction.Execute;
  end;
  if Message.CmdType = $F012 then begin
    TreeHintWindow.ReleaseHandle;
    HintNode := nil; 
  end;
//   DOut(IntToHex(Message.CmdType, 8));
  inherited;//継承元の処理をおこなう
end;

procedure TSimpleClipForm.MakeSystemMenu;
begin
  //フォームのシステムメニューのハンドルを取得
   hSysmenu :=GetSystemMenu(Handle, False);

  //セパレーター(区切り線)を今追加したメニューの上に追加
   InsertMenu(hSysmenu, SC_CLOSE, MF_SEPARATOR or MF_BYPOSITION, 0, nil);

  //現在のメニューの１番下に追加
   AppendMenu(hSysmenu, MF_STRING, MENU_MOPMOST, PChar(TopMostAction.Caption + #9 + ShortCutToText(TopMostAction.ShortCut)));
   AppendMenu(hSysmenu, MF_STRING, MENU_EDITOR , PChar(SimpleEditorAction.Caption + #9 + ShortCutToText(SimpleEditorAction.ShortCut)));
   AppendMenu(hSysmenu, MF_STRING, MENU_EXPORT , PChar(ExportAction.Caption + #9 + ShortCutToText(ExportAction.ShortCut)));
   AppendMenu(hSysmenu, MF_SEPARATOR, 0,  '-');     
   AppendMenu(hSysmenu, MF_STRING, MENU_HIDDENLOCK , PChar(HiddenLockAction.Caption + #9 + ShortCutToText(HiddenLockAction.ShortCut)));
   AppendMenu(hSysmenu, MF_SEPARATOR, 0,  '-');
   AppendMenu(hSysmenu, MF_STRING, MENU_NEWDB , PChar(NewDbAction.Caption + #9 + ShortCutToText(NewDbAction.ShortCut)));
   AppendMenu(hSysmenu, MF_STRING, MENU_READDB , PChar(ReadDbAction.Caption + #9 + ShortCutToText(ReadDbAction.ShortCut)));
   AppendMenu(hSysmenu, MF_STRING, MENU_SAVEDB , PChar(SaveDbAction.Caption));
   AppendMenu(hSysmenu, MF_SEPARATOR, 0,  '-');
   AppendMenu(hSysmenu, MF_STRING, MENU_OPTION,  PChar(OptionAction.Caption + #9 + ShortCutToText(OptionAction.ShortCut)));
   AppendMenu(hSysmenu, MF_STRING, MENU_VERSION, PChar(VersionAction.Caption));
end;

procedure TSimpleClipForm.TopMostActionExecute(Sender: TObject);
begin
  IsTopMost := not IsTopMost;
end;

procedure TSimpleClipForm.TheTreeViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var nDrg, nDrp: TTreeNode; ciDrg, ciDrp: TClipItem;
  Tree:  TTreeView;
  p: TPoint;
  cr: TRect;
  si: TScrollInfo;
  h: HWND;
begin 
  if not Option.IsDblClickExec then Exit;
  Tree := TTreeView(Sender);
  //drag
  nDrg := Tree.Selected;
  nDrp := Tree.GetNodeAt(X, Y);
  if Assigned(nDrg) and Assigned(nDrp) then begin
    ciDrg := TClipItem(nDrg.Data);
    ciDrp := TClipItem(nDrp.Data);
    Accept := ciDrg.Lock = ciDrp.Lock;
  end;

  //scroll    
  h := Tree.Handle;
  p := Point(X, Y);
  cr := Tree.ClientRect;
  si.cbSize := SizeOf(TScrollInfo);
  si.fMask := SIF_ALL;
  if PtInRect(Rect(cr.Left, cr.Top, cr.Right, cr.Top+10), p) then begin
    GetScrollInfo(h, SB_VERT, si);
    if si.nPos = si.nMin then Exit;
    SendMessage(h, WM_VSCROLL, SB_LINEUP, 0);
  end else if PtInRect(Rect(cr.Left, cr.Bottom-10, cr.Right, cr.Bottom), p) then begin
    GetScrollInfo(h, SB_VERT, si);
    if (Int64(si.nPos)+si.nPage) > si.nMax then Exit;
    SendMessage(h, WM_VSCROLL, SB_LINEDOWN, 0);
  end else if PtInRect(Rect(cr.Left, cr.Top, cr.Left+10, cr.Bottom), p) then begin
//    GetScrollInfo(h, SB_HORZ, si);
//    if si.nPos = si.nMin then Exit;
//    SendMessage(h, WM_HSCROLL, SB_LINELEFT, 0);
  end else if PtInRect(Rect(cr.Right-10, cr.Top, cr.Right, cr.Bottom), p) then begin
//    GetScrollInfo(h, SB_HORZ, si);
//    if (Int64(si.nPos)+si.nPage) > si.nMax then Exit;
//    SendMessage(h, WM_HSCROLL, SB_LINERIGHT, 0);
  end else Exit;
  Tree.Invalidate;
  Sleep(30);
end;

procedure TSimpleClipForm.TheTreeViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var nDrg, nDrp: TTreeNode;
begin
  nDrg := TheTreeView.Selected;
  nDrp := TheTreeView.GetNodeAt(X, Y);
  if Assigned(nDrg) and Assigned(nDrp) then begin
    nDrg.MoveTo(nDrp, naInsert);
  end;
end;

procedure TSimpleClipForm.DropFileSource;
begin
  if Assigned(TheTreeView.Selected) then begin
    DropFileSource1.Files.Clear;
    DropFileSource1.Files.Add(GetTempFile(TheTreeView.Selected));
    DropFileSource1.ImageIndex := TheTreeView.Selected.ImageIndex;
    DropFileSource1.Execute;
    DropFileSource1.Files.Clear;
  end;
end;

procedure TSimpleClipForm.DropTextSource;
var ci: TClipItem;
begin
  if Assigned(TheTreeView.Selected) then begin
    ci := TClipItem(TheTreeView.Selected.Data); 
    if ci.ClipMode = cmImage then Exit;
    DropTextSource1.Text := ci.Text + #0#0;
    DropTextSource1.ImageIndex := TheTreeView.Selected.ImageIndex;
    DropTextSource1.Execute;
  end;
end;

procedure TSimpleClipForm.TheTreeWndProc(var Message: TMessage);
var ci: TClipItem;
begin     
  if Message.Msg = CM_MOUSELEAVE then begin
    TreeHintWindow.ReleaseHandle;
    HintNode := nil;
  end;
//  if Message.Msg = cm_ then begin
//    beep;
//  end;
  if Option.IsDblClickExec and TheTreeView.Dragging then begin
    case Message.Msg of
      CM_MOUSEENTER: begin

      end;//
      CM_MOUSELEAVE: begin
        TheTreeView.EndDrag(True);
        ci := TClipItem(TheTreeView.Selected.Data);
        if (ci.ClipMode = cmImage) or
           ((GetKeyState(VK_CONTROL) and (1 shl 15))<>0) then begin
          DropFileSource;
        end else begin
          DropTextSource;
        end;

//        TreeHintWindow.ReleaseHandle;
      end;
  //    CM_DRAG: ;
  //    CM_DRAG: ;
      //他のメッセージは元のウィンドウプロシージャに渡す
      else DefTheTreeWndProc(Message);
    end;
  end else
    DefTheTreeWndProc(Message);
end;

procedure TSimpleClipForm.TheTreeViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  if Key = VK_DELETE then begin
//    DeleteItemAction.Execute;
//  end;
//  if Key = VK_RETURN then begin
//    beep;
//  end;
   
  if Key = VK_ESCAPE then begin
    Close;
//    if Option.IsMinimiz then begin
//      Hide;
//    end else begin
//      DispAction.Execute;
//    end;
  end;
end;

procedure TSimpleClipForm.DropFileSource1GetDragImage(Sender: TObject;
  const DragSourceHelper: IDragSourceHelper; var Handled: Boolean);
var sl: TStringList; ci: TClipItem; n: TTreeNode; fn: string;
//  bmp: TBitmap; jpg: TJPEGImage;
  Pt: TPoint; //SaveSuccess: Boolean;
begin
  GetCursorPos(Pt);
  Handled := Succeeded(DragSourceHelper.InitializeFromWindow(TheTreeView.Handle, Pt,
    TCustomDropSource(Sender) as IDataObject));

  n := TheTreeView.Selected;
  if not Assigned(n) then Exit;
  ci := TClipItem(n.Data);
  fn := GetTempFile(n);
  case ci.ClipMode of
    //image
    cmImage: begin
      (ci.SaveToImage(fn, Option.DropImgFormat));
//      if Option.IsDelAfterSavedImg then
//        DeleteItemAction.Execute;
    end;
//    begin
//      case Option.DropImgFormat of
//        difBmp: begin
//          bmp := TBitmap.Create;
//          try
//            bmp.Assign(ci.PngImage);
//            bmp.SaveToFile(fn);
//          finally
//            bmp.Free;
//          end;
//        end;
//        difPng: ci.PngImage.SaveToFile(fn);
//        difJpg: begin
//          bmp := TBitmap.Create;
//          jpg := TJPEGImage.Create;
//          try
//            bmp.Assign(ci.PngImage);
//            jpg.Assign(bmp);
//            jpg.SaveToFile(fn);
//          finally
//            jpg.Free;
//            bmp.Free;
//          end;
//        end;
//      end; //end case
//    end;
    else begin
      //text
      sl := TStringList.Create;
      sl.Text := ci.Text;
      sl.SaveToFile(GetTempFile(n));
      sl.Free;
    end;
  end;
end;

function TSimpleClipForm.GetTempFile(n: TTreeNode): string;

  function GetFixedWordLength(const Text: string; Byte: Cardinal; Dot: Boolean): string;
  var
    s: string;
    i: Cardinal;
  begin
    s := Text;
    Result := s;
    i := Length(s);
    if i > Byte then begin
      s := copy(s, 1, Byte);
      if ByteType(s, Byte) = mbLeadByte then
        Delete(s, Byte, 1);
      if Dot then s := s + #13#10 + '...';
      Result := s;
    end;
  end;

var ci: TClipItem; title: string;
begin
  Result := '';
  if not Assigned(n) then Exit;
  ci := TClipItem(n.Data);

  title := FormatDateTime('yyyy.mm.dd hh.nn.ss', ci.CreatedDate);
  if (Option.NameMode <> nmDate) or (ci.ClipMode = cmText ) then begin
    title := NotErrorFileName(ci.Name);
    title := '[' + FormatDateTime('yyyy.mm.dd hh.nn.ss', ci.CreatedDate) + ']' +
      title;
  end;
  Result := temp_dir_path + title;   
  Result := GetFixedWordLength(Result, 240, False);

  Result := Result + GetExtention(ci.ClipMode);
//  case ci.ClipMode of
//    cmImage: begin
//      case Option.DropImgFormat of
//        difBmp: Result := Result + '.bmp';
//        difJpg: Result := Result + '.jpg';
//        else Result := Result + '.png';
//      end;
//    end;
//    else Result := Result + '.txt';
//  end;
end;

function TSimpleClipForm.GetExtention(ClipMode: TClipMode): string;
begin
  Result := '.txt';
  case ClipMode of
    cmImage: begin
      case Option.DropImgFormat of
        difBmp: Result := '.bmp';
        difJpg: Result := '.jpg';
        else Result := '.png';
      end;
    end;
    else 
  end;
end;

procedure TSimpleClipForm.FormResize(Sender: TObject);
begin
  //check to system menu
  SetIsTopMost(IsTopMost);
  ShowScrollBar(TheTreeView.Handle, SB_HORZ , False);
  TreeHintWindow.ReleaseHandle;
  HintNode := nil;  
end;

procedure TSimpleClipForm.SaveImageDialogTypeChange(Sender: TObject);
begin
  with SaveImageDialog do begin
    case FilterIndex of
      1: DefaultExt := 'bmp';
      2: DefaultExt := 'png';
      3: DefaultExt := 'jpg';
    end;
  end;
end;

procedure TSimpleClipForm.ClearItems(Mode: TClipMode);
var i: Integer; n: TTreeNode; ci: TClipItem;                                            
begin
  for i := TheTreeView.Items.Count-1 downto 0 do begin
    n := TheTreeView.Items[i];
    ci := TClipItem(n.Data);
    if (ci.ClipMode = Mode) and (not ci.Lock) then begin
      n.Delete;
    end;
  end;
end;

procedure TSimpleClipForm.ClearTextItemsActionExecute(Sender: TObject);
begin
  if Terminated or(MessageDlg('全てのﾃｷｽﾄｱｲﾃﾑを削除します。'#13#10 +
    'よろしいですか？',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    ClearItems(cmText);
end;

procedure TSimpleClipForm.ClearImageItemsActionExecute(Sender: TObject);
begin     
  if Terminated or(MessageDlg('全てのｲﾒｰｼﾞｱｲﾃﾑを削除します。'#13#10 +
    'よろしいですか？',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    ClearItems(cmImage);
end;

procedure TSimpleClipForm.ClearDropItemsActionExecute(Sender: TObject);
begin
  if Terminated or(MessageDlg('全てのﾌｧｲﾙﾘｽﾄｱｲﾃﾑを削除します。'#13#10 +
    'よろしいですか？',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    ClearItems(cmDrop);
end;

procedure TSimpleClipForm.OptionActionExecute(Sender: TObject);
begin
  OptionDlg := TOptionDlg.Create(Self);
  try
    Option.SetToDlg;
    OptionDlg.PageControl.ActivePageIndex := LastOptTabIndex;
    if OptionDlg.ShowModal = mrOk then begin
      Option.GetFromDlg;
      Option.SaveToIni;
    end;
    LastOptTabIndex := OptionDlg.PageControl.ActivePageIndex;
  finally
    OptionDlg.Release;
  end;
end;

procedure TSimpleClipForm.SetImageDialogInitialDir(const Value: string);
begin
  FImageDialogInitialDir := Value;
  SaveImageDialog.InitialDir := Value;
end;

procedure TSimpleClipForm.SetTextDialogInitialDir(const Value: string);
begin
  FTextDialogInitialDir := Value;
  SaveTextDialog.InitialDir := Value;
end;

procedure TSimpleClipForm.SetImageDialogFilterIndex(const Value: Integer);
begin
  FImageDialogFilterIndex := Value;
  SaveImageDialog.FilterIndex := Value;
end;

procedure TSimpleClipForm.SetTextDialogFilterIndex(const Value: Integer);
begin
  FTextDialogFilterIndex := Value;
  SaveTextDialog.FilterIndex := Value;
end;

procedure TSimpleClipForm.ExecuteSaveTextDlg;
var ci: TClipItem;
begin
  if TheTreeView.Selected = nil then Exit;
  ci := TClipItem(TheTreeView.Selected.Data);
  SaveTextDialog.FileName := NotErrorFileName(ci.Name);
  if SaveTextDialog.Execute then begin
    ci.SaveToText(SaveTextDialog.FileName);
    TextDialogInitialDir := SaveTextDialog.InitialDir;
  end;
end;

procedure TSimpleClipForm.SaveTextActionExecute(Sender: TObject);
begin
  ExecuteSaveTextDlg;
end;

procedure TSimpleClipForm.SaveListActionExecute(Sender: TObject);
begin
  ExecuteSaveTextDlg;
end;

procedure TSimpleClipForm.SaveImageActionExecute(Sender: TObject);
var ci: TClipItem;
begin
  if TheTreeView.Selected = nil then Exit;
  ci := TClipItem(TheTreeView.Selected.Data);
  SaveImageDialog.FileName := NotErrorFileName(ci.Name);
  if SaveImageDialog.Execute then begin
    ci.SaveToImage(SaveImageDialog.FileName,
      TDropImgFormat(SaveImageDialog.FilterIndex - 1));
    ImageDialogInitialDir := SaveImageDialog.InitialDir;

    if Option.IsDelAfterSavedImg then
      DeleteItemAction.Execute;
  end;
end;

procedure TSimpleClipForm.WMHotKey(var Message: TWMHotKey);
begin     
  if Message.HotKey = Option.HotkeyId then begin
    if (Handle = GetForegroundWindow) and Visible then begin
      Hide;          
    end else begin 
      DispAction.Execute;     //beep;
    end;
  end;

  if Message.HotKey = TaskIconHotkeyId then begin
    ReTaskIconAction.Execute;
  end;
end;

//function JournalRecordProc(nCode:Integer;wParam:WPARAM;
//                            lParam:LPARAM):LRESULT;stdcall;
//var
//  pevent: pEVENTMSG;
//  h, hDskTop, hTaskBar: HWND;
//begin
//    Result := 0;
//    if nCode < 0 then begin
//      Result := CallNextHookEx(JournalHook, nCode, wParam, lParam)
//    end else begin
//      if nCode = HC_ACTION then begin
//        pEvent := pEVENTMSG(lParam);
//        hDskTop := FindWindow('Progman', 'Program Manager')
//         or FindWindow('WorkerW', nil);
//        hTaskBar := FindWindow('Shell_TrayWnd', nil);
//        h      := GetForegroundWindow;
//        //get desktop handle
//        if h = hDskTop then begin
//          case pEvent.Message of
////            WM_ACTIVATE:    MsgStr:='Open';
////            WM_SYSKEYDOWN:  MsgStr:='SysKeyDown';
////            WM_SYSKEYUP:    MsgStr:='SysKeyUp';
//            WM_KEYDOWN:     ;
//            WM_KEYUP:       ;
////            WM_MOUSEMOVE:   MsgStr:='MouseMove';
//            WM_LBUTTONDOWN: beep;
////            WM_LBUTTONUP:   MsgStr:='LButtonUp';
//            WM_RBUTTONDOWN: beep;
////            WM_RBUTTONUP:   MsgStr:='RButtonUp';
//          end;
//          //ウィンドウのタイトルとハンドル番号，操作内容をListViewに表示
////          Form1.DisplayKeyCodeMousePos(h,MsgStr,pEvent.paramL,pEvent.paramH);
//        end;
//      end;
//      Result := CallNextHookEx(JournalHook, nCode, wParam, lParam)
//    end;
//end;

//procedure TSimpleClipForm.WMNotifyHook(var Msg: TMessage);
//var
//  h, hDskTop, hTaskBar: HWND;
//begin
//  if Msg.Msg = WM_NOTIFY_HOOK then begin
//    hDskTop := FindWindow('Progman', 'Program Manager')
//         or FindWindow('WorkerW', nil);
//    hTaskBar := FindWindow('Shell_TrayWnd', nil);
//    h      := GetForegroundWindow;
//    case Msg.WParam of
//      WM_MOVE:    Memo1.Lines.Add('WM_MOVE');
//      WM_KEYDOWN: Memo1.Lines.Add('WM_KEYDOWN');
//    end;
//  end;
//end;

procedure TSimpleClipForm.TheTreeViewKeyPress(Sender: TObject;
  var Key: Char);
begin  
  key := #0;
end;

procedure TSimpleClipForm.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var mMsg, mKey: Cardinal;
  IsExec, IsLeft, IsRight, IsMiddle, IsCorrectPos,
  IsCorrectClk, IsVirtualDblClk, IsAlt, IsLast, IsPushing, IsPushed: Boolean;
  h: HWND; sClass: array[0..255] of Char;
  trapVKey: Cardinal;
  HProgman, HDefView, HSysListView: HWND;
  r: TRect;
begin
  //マウスフック
  if (Msg.message = Option.MouseUniqueMessage) then begin
    mMsg := Msg.wParam;
    if (mMsg = WM_MOUSEMOVE){ and (HintNode <> nil)} then begin
//      r := TreeHintWindow.c
//      DOutI(TreeHintWindow.ScreenToClient(msg.pt).X);
//      Application.ProcessMessages;
//      if PtInRect(TreeHintWindow.ClientRect, TreeHintWindow.ScreenToClient(msg.pt)) then begin beep;
//        TreeHintWindow.ReleaseHandle;
//        HintNode := nil;
//      end;
    end;
    if (mMsg = WM_LBUTTONUP) or (mMsg = WM_RBUTTONUP) or
       (mMsg = WM_MBUTTONUP) then Exit;
    if (mMsg = WM_MOUSEMOVE) or (mMsg = WM_NCMOUSEMOVE) then Exit;
    IsExec := False;           
    h := GetAncestor(WindowFromPoint(Msg.pt), GA_ROOT);
//    h := GetForegroundWindow;
    IsLeft := ((Option.CallMouseAction = cmaLDblClkDsk) or
              (Option.CallMouseAction = cmaLDblClkTsk)) and
              ((mMsg = WM_LBUTTONDOWN) or (mMsg = WM_LBUTTONDBLCLK));
    IsRight := ((Option.CallMouseAction = cmaRDblClkDsk) or
              (Option.CallMouseAction = cmaRDblClkTsk)) and
              ((mMsg = WM_RBUTTONDOWN) or (mMsg = WM_RBUTTONDBLCLK));
    IsMiddle := ((Option.CallMouseAction = cmaMDblClkDsk) or
              (Option.CallMouseAction = cmaMDblClkTsk)) and
              ((mMsg = WM_MBUTTONDOWN) or (mMsg = WM_MBUTTONDBLCLK));
    GetClassName(h, sClass, 255);

    //デスクトップのアイコンは無視する
    HProgman := FindWindow(PChar('Progman'),PChar('Program Manager'));
    HDefView := FindWindowEx(HProgman,0,PChar('SHELLDLL_DefView'),nil);
    HSysListView := FindWindowEx(HDefView,0,PChar('SysListView32'),nil);
    if ListView_GetHotItem(HSysListView) <> -1 then Exit;
    
//    DOut(sCaption);
    case Option.CallMouseAction of
      cmaLDblClkDsk, cmaRDblClkDsk, cmaMDblClkDsk:
           IsCorrectPos := (h = hDskTop) or (sClass = 'WorkerW');
      else IsCorrectPos := (h = hTaskTray);
    end;
    case Option.CallMouseAction of
      cmaLDblClkDsk, cmaLDblClkTsk: IsCorrectClk := IsLeft;
      cmaRDblClkDsk, cmaRDblClkTsk: IsCorrectClk := IsRight;
      else IsCorrectClk := IsMiddle;
    end;          
//    DOutB(IsLeft);
//    DOutB(IsRight);
//    DOutB(IsMiddle);
//    DOutB(IsCorrectClk);
//    DOut('---------');
//    DOutB(IsCorrectPos);
//    DOut(sCaption);
//    doutb((h = FindWindow('WorkerW', nil)));
    if (mMsg = WM_LBUTTONDOWN) or (mMsg = WM_RBUTTONDOWN) or
       (mMsg = WM_MBUTTONDOWN) then begin
      //フォーカスウィンドウ移動時のダブルクリック処理
//      DOutB(IsCorrectPos);
//      DOutB(GetForegroundWindow <> hOldClkWid);
      IsVirtualDblClk := IsAlreadyClk and  IsCorrectClk and
              ((GetTickCount-ClkStart) < GetDoubleClickTime) and
              (Abs(OldClkPos.X-Msg.pt.X) < DoubleClickWidth) and
              (Abs(OldClkPos.Y-Msg.pt.Y) < DoubleClickHeight);
      if h <> hOldClkWid then begin
//        DOut(sCaption);
//        DOutB((sCaption = '#32768'));
//        DOutB(IsAlreadyClk);
        //右ﾀﾞﾌﾞﾙｸﾘｯｸするけどﾎﾟｯﾌﾟｱｯﾌﾟが出たとき
        if IsVirtualDblClk and (sClass = '#32768') then begin
          IsExec := true;
        end;
        hOldClkWid := h;
        IsAlreadyClk := True;
        ClkStart := GetTickCount;
        OldClkPos := Msg.pt;
      end else begin
        //実際のﾀﾞﾌﾞﾙｸﾘｯｸﾒｯｾｰｼﾞではないが
        //ﾀﾞﾌﾞﾙｸﾘｯｸ相当のﾏｳｽ動作をしたとき
        if IsVirtualDblClk then begin
          IsExec := IsCorrectPos;
        end;
        hOldClkWid := h;
        IsAlreadyClk := False;
        OldClkPos := Msg.pt;
      end;
    end else if IsCorrectClk then begin
      //ﾀﾞﾌﾞﾙｸﾘｯｸ時
      IsExec := IsCorrectPos;
    end;
    if IsExec  then DispAction.Execute;
//    DOutB(IsExec);
  end;

  //キーフック
  if (Msg.message = Option.KeyUniqueMessage) then begin          
    mKey := Msg.wParam;
    {キー動作確認用}
    IsAlt := ((Msg.lParam and (1 shl 29))<>0);
    IsLast := ((Msg.lParam and (1 shl 30))<>0);
    IsPushing := ((Msg.lParam and (1 shl 31))=0);
    IsPushed := IsLast and (not IsPushing);
//    DOut('Key = ' + IntToStr(mKey));
////    DOut('LastKey = ' + IntToStr(LastPushedKey));
//    DOut('IsAlt = ' + BoolToStr(IsAlt, True));
//    DOut('IsLast = ' + BoolToStr(IsLast, True));
//    DOut('IsPushing = ' + BoolToStr(IsPushing, True));
//    DOut('------------------------');

    case Option.CallKeyPress of
      ckpShift: trapVKey := VK_SHIFT;
      ckpCtrl: trapVKey := VK_CONTROL;
      ckpAlt: trapVKey := VK_MENU;
      ckpCaps: trapVKey := $F0;
    end;
    if trapVKey <> mKey then Exit;

//        DOutI(LOWORD(Msg.lParam));

    //シフトとコントロールを2回押した時の勝利
    if ((mKey = VK_SHIFT) or (mKey = VK_CONTROL)) and (not IsPushing) then begin
      try
        Inc(KeyCount);
        if (KeyCount >= 2) then begin
          if ((GetTickCount - FirstKeyPushTime) < 1000) and IsPushed then begin
            CancelTimer.Enabled := False;
            if ((GetForegroundWindow <> Handle) or (not Visible)) then begin
              DispAction.Execute;
            end else begin
              Hide;
            end;
          end;
          KeyCount := 0;
        end else begin
          CancelTimer.Enabled := False;
          FirstKeyPushTime := GetTickCount;
          CancelTimer.Enabled := True;
        end;
      finally

      end;
    end;

    //アルトとキャップスを2回押した時の勝利
    if IsAlt and IsLast and IsPushing then Exit;
    if (mKey = $F0) and ((GetTickCount - FirstKeyPushTime) < 200) then Exit;
    if ((mKey = VK_MENU) or (mKey = $F0)) and IsPushing then begin
      try
        Inc(KeyCount);
        if (KeyCount = 2) then begin
          if ((GetTickCount - FirstKeyPushTime) < 1000) then begin
            CancelTimer.Enabled := False;
            if ((GetForegroundWindow <> Handle) or (not Visible)) then begin
              DispAction.Execute;
            end else begin
              Hide;
            end;
          end;
          CancelTimer.Enabled := True;
//          KeyCount := 0;
        end else begin
          CancelTimer.Enabled := False;
          FirstKeyPushTime := GetTickCount;
          CancelTimer.Enabled := True;
        end;
      finally

      end;
    end;











//      if (mKey = 66) and (not IsPushing) then begin
//        Inc(KeyCount);
//      end;
//      if ((mKey = VK_SHIFT) or (mKey = VK_SHIFT)) and IsPushing then begin
//        Inc(KeyCount);
//      end;
//      if ((mKey = $F0) or (mKey = VK_MENU)) and (not IsPushing) then begin
//        Inc(KeyCount);
//      end;


//    if trapVKey <> mKey then Exit;




//    //http://msdn.microsoft.com/ja-jp/library/cc430012.aspx
//    if (mKey <> $F0) and (mKey <> VK_MENU) then
////      if ((Msg.lParam and (1 shl 31)) = 0) then Exit;
//      if IsPushing then Exit;
//
//    if ((not IsPushing) or (mKey = $F0) or (mKey = VK_MENU)) and (KeyCount = 1) then begin
//      IsAlreadyMouseUp := True;
//    end;
//
////    DOutI(trapVKey);
//    if mKey = trapVKey then begin
////      DOutB(IsAlreadyMouseUp);
//
//
//      Inc(KeyCount);
//      if (KeyCount >= 2) then begin     //beep;/////////////////////////////////
//        if ((GetTickCount - KeyDownStart) < 1000) then begin
//          if ((GetForegroundWindow <> Handle) or (not Visible))
//             and IsAlreadyMouseUp then begin
//            DispAction.Execute;
//          end else begin
//            Hide;
//          end;
//          KeyCount := 0;
//          IsAlreadyMouseUp := False;
////            LastPushedKey := mKey;
////          CancelTimer.Enabled := True;
//        end;
////          dout('2');
//        KeyCount := 0;
//        IsAlreadyMouseUp := False;
////        LastPushedKey := mKey;
//      end else begin
//        KeyDownStart := GetTickCount;
////        if ((GetTickCount - KeyDownStart) >= 1000) then begin
////          KeyCount := 0;
////          IsAlreadyMouseUp := False;
////        end;
////        DOut('1');
//      end;
//    end else begin
//      KeyCount := 0;
//      IsAlreadyMouseUp := False;
////      LastPushedKey := 0;
//    end;
  end;


//  //キーフック
//  if (Msg.message = Option.KeyUniqueMessage) then begin
//    mKey := Msg.wParam;
//
//    {キー動作確認用}
//    IsAlt := ((Msg.lParam and (1 shl 29))<>0);
//    IsLast := ((Msg.lParam and (1 shl 30))<>0);
//    IsPushing := ((Msg.lParam and (1 shl 31))=0);
////    DOut('Key = ' + IntToStr(mKey));
////    DOut('LastKey = ' + IntToStr(LastPushedKey));
////    DOut('IsAlt = ' + BoolToStr(IsAlt, True));
////    DOut('IsLast = ' + BoolToStr(IsLast, True));
////    DOut('IsPushing = ' + BoolToStr(IsPushing, True));
//
////    LastPushedKey := mKey;
//
////    IsAltOk := (mKey = VK_MENU) and IsLast and (not IsPushing);
////    if IsAltOk then begin
////      LastPushedKey := 0;
////      beep
////    end;
//
////    DOutI(mKey);//////////////////////////////////////////////////////
//
//    if ((GetTickCount - KeyDownStart) < 200) then exit;
////    DOutI(LOWORD(Msg.lParam));
////    DOutB(((Msg.lParam and (1 shl 31))<>0));//////////////////////////
////    if (((Msg.lParam and (1 shl 31)) <> 0) or (mKey = $F0) or (mKey = VK_MENU)) and (KeyCount = 1) then
//
//    case Option.CallKeyPress of
//      ckpShift: trapVKey := VK_SHIFT;
//      ckpCtrl: trapVKey := VK_CONTROL;
//      ckpAlt: trapVKey := VK_MENU;
//      ckpCaps: trapVKey := $F0;
//      else Exit;
//    end;
//
//    //http://msdn.microsoft.com/ja-jp/library/cc430012.aspx
//    if (mKey <> $F0) and (mKey <> VK_MENU) then
////      if ((Msg.lParam and (1 shl 31)) = 0) then Exit;
//      if IsPushing then Exit;
//
//    if ((not IsPushing) or (mKey = $F0) or (mKey = VK_MENU)) and (KeyCount = 1) then begin
//      IsAlreadyMouseUp := True;
//    end;
//
////    DOutI(trapVKey);
//    if mKey = trapVKey then begin
////      DOutB(IsAlreadyMouseUp);
//
//
//      Inc(KeyCount);
//      if (KeyCount >= 2) then begin     //beep;/////////////////////////////////
//        if ((GetTickCount - KeyDownStart) < 1000) then begin
//          if ((GetForegroundWindow <> Handle) or (not Visible))
//             and IsAlreadyMouseUp then begin
//            DispAction.Execute;
//          end else begin
//            Hide;
//          end;
//          KeyCount := 0;
//          IsAlreadyMouseUp := False;
////            LastPushedKey := mKey;
////          CancelTimer.Enabled := True;
//        end;
////          dout('2');
//        KeyCount := 0;
//        IsAlreadyMouseUp := False;
////        LastPushedKey := mKey;
//      end else begin
//        KeyDownStart := GetTickCount;
////        if ((GetTickCount - KeyDownStart) >= 1000) then begin
////          KeyCount := 0;
////          IsAlreadyMouseUp := False;
////        end;
////        DOut('1');
//      end;
//    end else begin
//      KeyCount := 0;
//      IsAlreadyMouseUp := False;
////      LastPushedKey := 0;
//    end;
//
////    DOutI(Msg.wParam);
////    DOutI(Msg.lParam);
//  end;
end;

procedure TSimpleClipForm.WindowHandleTimerTimer(Sender: TObject);
var h, ah, th: THandle; GTI:TGUIThreadInfo; //o:TStnListView
  c: array[0..255] of Char;
  ct: array[0..255] of Char;
begin                //exit;
  h := GetForegroundWindow;
  ah := GetAncestor(h, GA_ROOT);
  h_form_wnd := Handle;

//  DOut(IntToStr(h) + #9 + IntToStr(Handle));

  GetClassName(h, c, 255);
  th := FindWindow('tooltips_class32', nil);
  if th <> 0 then begin
    GetWindowText(th, ct, 255);
//    if ct <> '' then
//    DOut(ct);
  end;

  if (h <> Handle) and //(ah <> Application.Handle) and
    (h <> hTaskTray) and (h <> hDskTop) and (c <> 'WorkerW') then begin
//  DOut(c);
//  DOutB(h = hDskTop);
    GTI.cbSize := sizeof(TGUIThreadInfo);
    GTI.flags := 0;
    GetGUIThreadInfo(Integer(nil), GTI);
    if (h = h_foreground_wnd){and (GTI.hwndFocus = h_fourcus_ctrl)} then Exit;
    h_foreground_wnd := h;
    h_fourcus_ctrl := GTI.hwndFocus;
//    SendMessage(h_fourcus_ctrl, EM_GETSEL,
//      Integer(@fourcus_ctrl_selstart),Integer(@fourcus_ctrl_selend));
  end;
  if not TaskTrayIcon.Enabled then
    ReTaskIconAction.Execute;
end;

procedure TSimpleClipForm.VersionActionExecute(Sender: TObject);
begin
  AboutForm := TAboutForm.Create(Self);
  try
    AboutForm.ShowModal;
  finally
    AboutForm.Release;
  end;
end;

procedure TSimpleClipForm.ShowTreeHint(n: TTreeNode);
  function HintPos(AWidth: Integer): TPoint;
  var sr: TRect; lw, rw: Integer; mo: TMonitor;
  begin
    mo := Screen.MonitorFromWindow(Handle); //ShowMessage(IntToStr(mo.MonitorNum));
    sr := mo.WorkareaRect;
    lw := Left - sr.Left;
    rw := sr.Right - Left - Width;
    if lw > rw then begin
      Result.X := Left - AWidth;
    end else begin
      Result.X := Left + Width;
    end;
    Result.Y := Top;
  end;
var ci: TClipItem; hp, p, mp: TPoint; r, dr: TRect;
  bw, bh, hintw: Integer; //bmp: TBitmap;
begin
  if not Visible then Exit;
  if HintNode = n then Exit;
  if not Option.IsShowHint then Exit;
  HintNode := n;
//  DOutI(Integer(Pointer(n)));
  if n = nil then begin
    TreeHintWindow.ReleaseHandle;
    Exit;
  end;
  hintw := Option.HintWidth;
  hp := HintPos(hintw);
  ci := TClipItem(n.Data);
//  DOut(ci.Name);
//  TreeHintWindow.Font := TreeHintWindow.Font;
  TreeHintWindow.Color := Option.HintColor;
  Screen.HintFont.Color := Option.HintFontColor;
//  TreeHintWindow.Font := Option.HintFont;
  r := Rect(hp.X, hp.Y, hp.X + hintw, hp.Y + Height);

  once_hittest := False;
//  GetCursorPos(p);
//  if PtInRect(r, p) then begin
//    Exit;
////      DOutI(TheTreeView.Selected.Index);
//      dr := TheTreeView.Selected.DisplayRect(False);
//      mp := TheTreeView.ClientToScreen(Point((dr.Right-dr.Left) div 2, dr.Bottom-(dr.Bottom-dr.Top) div 2));
//      SetCursorPos(mp.X, mp.Y);
//      Sleep(10);
//      SetCursorPos(p.X, p.Y);
//  end;

  if ci.ClipMode <> cmImage then begin
    TreeHintWindow.Clear;
    if (r.Bottom - r.Top) < 200 then
      r.Bottom := r.Top + 200;
//    SendMessage(TreeHintWindow.Handle, TTM_SETTIPTEXTCOLOR,
//      clBlue, 0);
//    ShowCursor(False);



    TreeHintWindow.ActivateHint(r, ci.Text);

//    ShowCursor(True);

  end else begin
    TreeHintWindow.Clear;
//    bmp := TBitmap.Create;
//    bmp.Assign(ci.PngImage);
//    TreeHintWindow.Bitmap.Assign(bmp);
    TreeHintWindow.Png.Assign(ci.PngImage);
    bw := TreeHintWindow.Png.Width;
    bh := TreeHintWindow.Png.Height;
    //bw:bh 300:x = x=bh*300/bw
    if Option.IsKeepImgSizeHint then begin
//      r.Bottom := r.Top + Trunc(bh*hintw/bw);
      if (bw >= Screen.Width) or (bh >= Screen.Height) then begin
        bw := Trunc(Screen.Width*0.9);
        bh := Trunc(Screen.Height*0.9);
      end;
      r := Rect(hp.X, hp.Y, hp.X + bw, hp.Y + bh);
    end else begin
      r.Bottom := r.Top + Trunc(bh*hintw/bw);
      if (not Option.IsZoomImage) and (bw <= Option.HintWidth) then begin
        r := Rect(hp.X, hp.Y, hp.X + bw, hp.Y + bh);
      end;
    end;

//    if HintNode <> n then
//    if OldHintNode <> n then
//    SetWindowPos(Handle, HWND_TOPMOST,0,0,0,0,SWP_NOSIZE or SWP_NOMOVE);
//    DOutB(TreeHintWindow.Visible);
    TreeHintWindow.ShowImage(r);

//    LockWindowUpdate(Handle);
//    try
//      TreeHintWindow.ShowImage(r);
//    finally
////      LockWindowUpdate(0);
////      TheTreeView.invalidate;
//    end;
  end;
end;

procedure TSimpleClipForm.TheTreeViewMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var p: TPoint; n: TTreeNode; ci: TClipItem;
begin
  GetCursorPos(p);
  p := TheTreeView.ScreenToClient(p);
  n := TheTreeView.GetNodeAt(p.X, p.Y);
//  DOut(n.Text);
  ShowTreeHint(n);  

  if DragStart then begin
    GetCursorPos(p);
    if (Abs(DragPos.X - p.X) > 5) or (Abs(DragPos.Y - p.Y) > 5) then begin 
      DragStart := True;
      ci := TClipItem(n.Data);
      if (ci.ClipMode = cmImage) or (ssCtrl in Shift)then begin
        DropFileSource;
      end else begin
        DropTextSource;
      end;
      DragStart := False;
    end;
  end;
end;

procedure TSimpleClipForm.TheTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  if Node <> nil then ShowTreeHint(Node);
  ActionListUpdate;
end;

procedure TSimpleClipForm.ApplicationEvents1Activate(Sender: TObject);
begin
  if (TheTreeView.Selected <> nil) and Visible then
    ShowTreeHint(TheTreeView.Selected);
  SetIsTopMost(IsTopMost);
//  TheTreeView.SetFocus;
end;

procedure TSimpleClipForm.ApplicationEvents1Deactivate(Sender: TObject);
begin
  TreeHintWindow.ReleaseHandle;
  HintNode := nil;
end;

procedure TSimpleClipForm.FormHide(Sender: TObject);
begin
  TreeHintWindow.ReleaseHandle;
  HintNode := nil;
end;

procedure TSimpleClipForm.TheTreeViewDblClick(Sender: TObject);
begin
  ExecutiveAction.Execute;
end;

procedure TSimpleClipForm.ExcuteItem(Action: TAction);
var n: TTreeNode; ci: TClipItem;
begin
  n := TheTreeView.Selected;
  if n = nil then Exit;
  WatchingClip := False;
  ci := TClipItem(n.Data);
  ci.UsedCount := ci.UsedCount + 1;
  ci.UsedDate := Now;

  Action.Execute;

  WatchingClip := True;
end;

procedure TSimpleClipForm.ProcExecutiveActionExecute(Sender: TObject);
var ci: TClipItem;
//var n: TTreeNode; ci, tci: TClipItem;
begin
//  Enabled := false;
//  if Handle <> GetForegroundWindow then Exit;
  ci := TClipItem(TheTreeView.Selected.Data);
//  n := TheTreeView.Selected;
//  if n = nil then Exit;
//  WatchingClip := False;
//  ci := TClipItem(n.Data);
//  ci.UsedCount := ci.UsedCount + 1;
//  ci.UsedDate := Now;
  case ci.ClipMode of
    cmText:begin
      case Option.TextEexeAction of
        eaDialog: SaveTextAction.Execute;
        eaCopy: ProcCopyAction.Execute;
        eaPaste: ProcPasteAction.Execute;
      end;
    end;
    cmImage:begin
      case Option.ImageEexeAction of
        eaDialog: SaveImageAction.Execute;
        eaCopy: ProcCopyAction.Execute;
        eaPaste: ProcPasteAction.Execute;
      end;
    end;
    cmDrop:begin
      case Option.DropEexeAction of
        eaDialog: SaveTextAction.Execute;
        eaCopy: ProcCopyAction.Execute;
        eaPaste: ProcPasteAction.Execute;
      end;
    end;
  end;
  if Option.IsHideWhenExe then Hide;

//  tci := TClipItem.Create;
//  tci.Assign(ci);
//  AddTheTreeView(tci);
//  WatchingClip := True;
end;

procedure TSimpleClipForm.ProcPasteActionExecute(Sender: TObject);
var ci, tci: TClipItem;
begin
  ci := TClipItem(TheTreeView.Selected.Data);    
//  Option.PlaySound;
  ci.Paste;     
  tci := TClipItem.Create;
  tci.Assign(ci);
  AddTheTreeView(tci);
end;

procedure TSimpleClipForm.ProcEditAndPasteActionExecute(Sender: TObject);
var ci, tci: TClipItem;
  Params : PSafeArray;
  v : Variant;
  ReturnValue: Variant;
  s, fn: string;
  sl: TStringList;
begin
  sl := TStringList.Create;
  ci := TClipItem(TheTreeView.Selected.Data);
  try
    v := VarArrayCreate([0, 0], varVariant);
    v[0] := ci.Text;

    Params := PSafeArray(TVarData(v).VArray);

    s := TAction(Sender).Caption;
    fn := TextScriptsDirPath + s;
    sl.LoadFromFile(fn);
    if ExtractFileExt(fn) = '.vbs' then begin
      ScriptControl.Language := 'VBScript';
    end else begin
      ScriptControl.Language := 'JavaScript';
    end;
    ScriptControl.AddCode(sl.Text);
    ReturnValue := ScriptControl.Run('EditText', Params);
    if String(ReturnValue) <> '' then begin
      ci.Paste(ReturnValue);
      tci := TClipItem.Create;
      tci.Assign(ci);
      AddTheTreeView(tci);
    end else Option.PlaySound;;

  finally
    sl.Free;
  end;
end;

procedure TSimpleClipForm.ProcCopyActionExecute(Sender: TObject);
var ci, tci: TClipItem;
begin
  ci := TClipItem(TheTreeView.Selected.Data);
//  Option.PlaySound;
  ci.ToClipBoard;
  tci := TClipItem.Create;
  tci.Assign(ci);
  AddTheTreeView(tci);
end;

procedure TSimpleClipForm.ExecutiveActionExecute(Sender: TObject);
begin
  ExcuteItem(ProcExecutiveAction);
end;

procedure TSimpleClipForm.PasteActionExecute(Sender: TObject);
begin
  ExcuteItem(ProcPasteAction);
end;

procedure TSimpleClipForm.CopyActionExecute(Sender: TObject);
begin
  ExcuteItem(ProcCopyAction);
end;

procedure TSimpleClipForm.ApplicationEvents1Minimize(Sender: TObject);
begin
  Hide;
end;

procedure TSimpleClipForm.WMEnable(var Message: TWMEnable);
begin
  if Message.Enabled then begin
    WindowHandleTimer.Enabled := True;
  end else begin
    WindowHandleTimer.Enabled := False;
  end;
end;

procedure TSimpleClipForm.TheTreeViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  ReleaseCapture;
  DragStart := False;
  TheTreeView.Selected := TheTreeView.GetNodeAt(X, Y);
end;

procedure TSimpleClipForm.WMQueryEndSession(var Msg: TWMQueryEndSession);
begin
  Terminated := True;
  inherited;
end;

procedure TSimpleClipForm.Panel2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DropTextSource1.Execute()
end;

procedure TSimpleClipForm.DropTextSource1GetDragImage(Sender: TObject;
  const DragSourceHelper: IDragSourceHelper; var Handled: Boolean);
var
  Pt: TPoint;
begin
  GetCursorPos(Pt);
  Handled := Succeeded(DragSourceHelper.InitializeFromWindow(TheTreeView.Handle, Pt,
    TCustomDropSource(Sender) as IDataObject));
end;

procedure TSimpleClipForm.NkTextDropTarget1TextDrop(Text: String);
begin
  AddTextToList(Text);
end;

procedure TSimpleClipForm.FormWndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_ENTERSIZEMOVE: begin
      TreeHintWindow.ReleaseHandle;
      HintNode := nil;
    end;
    //他のメッセージは元のウィンドウプロシージャに渡す
    else DefFormWndProc(Message);
  end;
end;

procedure TSimpleClipForm.ReTaskIconActionExecute(Sender: TObject);
begin
//  ShowMessage('TaskTrayIcon.Enabled = ' + BoolToStr(TaskTrayIcon.Enabled, True));
  WatchingClip := False;
  TaskTrayIcon.Enabled := False;
  Application.ProcessMessages;
  TaskTrayIcon.Enabled := True;
  WatchingClip := True;
end;

procedure TSimpleClipForm.CancelTimerTimer(Sender: TObject);
begin
  KeyCount := 0;
  LastPushedKey := 0;
  CancelTimer.Enabled := False;
end;

procedure TSimpleClipForm.SetRESelColor(Memo: TMemo; TextColor, BackColor: TColor);
var
  Format: CHARFORMAT2;
begin
  FillChar(Format, SizeOf(Format), 0);
  with Format do
  begin
    cbSize := SizeOf(Format);
    dwMask := CFM_ALL;
    crTextColor := TextColor;
    crBackColor := BackColor;
    Memo.Perform(EM_SETCHARFORMAT, SCF_SELECTION, Longint(@Format));
  end;
end;

procedure TSimpleClipForm.DispTextActionExecute(Sender: TObject);
var i: Integer; mi: TMenuItem; n: TTreeNode; ci: TClipItem; s: string;
  tc, bkc: TColor; f: TFont;
begin
  n := TheTreeView.Selected;
  ci := nil;
  if n <> nil then
    ci := TClipItem(n.Data);
  if (ci <> nil) and (ci.ClipMode = cmImage) then begin
    s := ci.Name;
    if InputQuery('画像タイトルの変更', '新しいタイトルを入力してください。', s) then begin
      if Trim(s) = '' then begin
        Beep;
        Exit;
      end;
      ci.Name := s;
      n.Text := s;
    end;
  end else begin
    if MemoForm = nil then begin
      MemoForm := TMemoForm.Create(Self);

      TheIniFile.ReadForm2('MemoForm', MemoForm);
      MemoForm.WordWrapAction.Checked := TheIniFile.ReadBool('MemoForm', 'WordWrap', False);
      MemoForm.Memo1.AutoWrap := TheIniFile.ReadBool('MemoForm', 'AutoWrap', True);
      MemoForm.Memo1.Column := TheIniFile.ReadInt('MemoForm', 'Column', MemoForm.Memo1.MaxCurposX);

      for i := 0 to EditTextMenu.Count-1 do begin
        mi := TMenuItem.Create(Self);
        mi.Caption := EditTextMenu.Items[i].Caption;
        mi.OnClick := MemoForm.ScriptMenuClick;
        MemoForm.ScriptMenu.Add(mi);
      end;
//      f := TFont.Create;
      TheIniFile.ReadFont('MemoForm', 'Font', MemoForm.Memo1.Font);
//      DOut(MemoForm.Memo1.Font.Name);
      MemoForm.Memo1.ReDesign;
//      MemoForm.Memo1.Font.Assign(f);
//      f.Free;

      MemoForm.Memo1.Color := TheIniFile.ReadColor('MemoForm', 'BkColor', MemoForm.Memo1.Color);
    end;

    try

//      TheIniFile.ReadFont('MemoForm', 'Font', MemoForm.Memo1.Font);
//      MemoForm.Memo1.Font := MemoForm.Memo1.Font;
//      ShowMessage(MemoForm.Memo1.Font.Name);
//      tc := TheIniFile.ReadColor('MemoForm', 'SelTextColor', clWhite);
//      bkc := TheIniFile.ReadColor('MemoForm', 'SelBkColor', clBlue);
//      SetRESelColor(MemoForm.Memo1, tc, bkc);
//      MemoForm.ScriptMenu.Visible := EditTextMenu.Visible;
  //    b := IsTopMost;
  //    IsTopMost := False;

      if TheTreeView.Selected <> nil then begin
        MemoForm.Caption := 'ﾃｷｽﾄ表示';
        MemoForm.Memo1.Text := TClipItem(TheTreeView.Selected.Data).Text;
      end else begin
        MemoForm.Caption := '簡易ｴﾃﾞｨﾀ';
        MemoForm.Memo1.Clear;
      end;
//      Enabled := false;
//      MemoForm.Show;
      MemoForm.ShowModal;  


      TheIniFile.WriteInt('MemoForm', 'Column', MemoForm.Memo1.Column);              
      TheIniFile.WriteBool('MemoForm', 'AutoWrap', MemoForm.Memo1.AutoWrap);
      TheIniFile.WriteBool('MemoForm', 'WordWrap', MemoForm.WordWrapAction.Checked);
      TheIniFile.WriteFont('MemoForm', 'Font', MemoForm.Memo1.Font);
      TheIniFile.WriteColor('MemoForm', 'BkColor', MemoForm.Memo1.Color);
      TheIniFile.WriteForm2('MemoForm', MemoForm);
    finally
      MemoForm.Release;
      MemoForm := nil;
    end;
  end;

end;

procedure TSimpleClipForm.DropFileSource1AfterDrop(Sender: TObject;
  DragResult: TDragResult; Optimized: Boolean);
begin
//  doutb(DragResult = drCancel)
  if Option.IsDelAfterSavedImg and (DragResult <> drCancel) then
    DeleteItemAction.Execute;
end;

procedure TSimpleClipForm.EditTextMenuClick(Sender: TObject);
begin
  ProcEditAndPasteAction.Caption := TMenuItem(Sender).Caption;
  ExcuteItem(ProcEditAndPasteAction);
end;

procedure TSimpleClipForm.CreateEditTextMenu;
  procedure CreateEditTextMenuItem(Dir: String; Item: TMenuItem);
  var
    Rec: TSearchRec;
    Found: Integer;
    mi: TMenuItem;
    s: string;
  begin
    Found := FindFirst(IncludeTrailingPathDelimiter(Dir) + '*.*', faAnyFile, Rec);
    try
      while (Found = 0) do begin
        if (Rec.Name <> '..') and (Rec.Name <> '.') then begin
          s := IncludeTrailingPathDelimiter(Dir) + Rec.Name;
//          if (Rec.Attr and SysUtils.faDirectory > 0) and IsSubDirExist(s) then begin
//            mi := TMenuItem.Create(Self);
//            mi.Caption := Rec.Name;
//            mi.AutoHotkeys := maManual;
//            Item.Add(mi);
//            CreateEditTextMenuItem(s, mi);
//          end;
          if ((Rec.Attr and SysUtils.faDirectory) = 0) and (not IsBinary(s)) and
            ((ExtractFileExt(s) = '.vbs') or (ExtractFileExt(s) = '.js')) then begin
            mi := TMenuItem.Create(Self);
            mi.Caption := Rec.Name;
            mi.AutoHotkeys := maManual;
            mi.OnClick := EditTextMenuClick;
            if (Pos('#', Rec.Name) = 1) then
              mi.Visible := False;
            Item.Add(mi);
          end;
        end;
        Found := FindNext(Rec);
      end;
    finally
      FindClose(Rec);
    end;
  end;
var
  dir: string;
begin
  dir := TextScriptsDirPath;
  if not DirectoryExists(dir) then Exit;

  CreateEditTextMenuItem(dir, EditTextMenu);
end;

function TSimpleClipForm.GetScriptsDirPath: string;
begin
  Result := ExtractFilePath(Application.ExeName) + 'scripts\';
end;

function TSimpleClipForm.GetTextScriptsDirPath: string;
begin
  Result := ScriptsDirPath + 'text\';
end;

procedure TSimpleClipForm.TheTreeViewClick(Sender: TObject);
//var p: TPoint;
begin
//  GetCursorPos(p);
//  p := TheTreeView.ScreenToClient(p);
//  TheTreeView.Selected := nil;//TheTreeView.GetNodeAt(p.X, p.Y);
end;

procedure TSimpleClipForm.DropFiles1Drop(Sender: TObject; Files: TStrings);
var sl: TStringList; i: Integer; ci: TClipItem; s: string;
begin
  sl := TStringList.Create;
  try
    for i := 0 to Files.Count-1 do begin
      sl.Add(ExtractFileName(Files[i]));
    end;
    ci := TClipItem.Create;
    ci.ClipMode := cmText;
    s := Trim(sl.Text);
    ci.Text := s;
    ci.Hash := ci.ClacHash;
    ci.Name := s;
    AddTheTreeView(ci);
  finally
    sl.Free;
  end;
end;

procedure TSimpleClipForm.TreePopupMenuPopup(Sender: TObject);
//var ci: TClipItem;
begin
//  if TheTreeView.Selected = nil then Exit;
//  ci := TClipItem(TheTreeView.Selected.Data);
//  if ci = nil then Exit;
////  DispTextMenu.Action := nil;
//  if ci.ClipMode = cmImage then begin
//    DispTextMenu.Caption := 'ﾀｲﾄﾙ変更(&T)';
//  end else begin
//    DispTextMenu.Caption := 'ﾃｷｽﾄ表示(&T)';
//  end;
end;

procedure TSimpleClipForm.ExportActionExecute(Sender: TObject);
var keta: Byte; fn: string; i: Integer; ci: TClipItem; ws: WideString; sl: TStringList;
begin
  if FolderDialog1.Execute then begin
    sl := TStringList.Create;
    keta := Length(IntToStr(Option.HistoryCount));
    for i := 0 to TheTreeView.Items.Count-1 do begin
      ci := TClipItem(TheTreeView.Items[i].Data);
      sl.Text := ci.Name;
      ws := NotErrorFileName(sl[0]);
//      if Pos(ws, #13#10) > 0 then
//        ws := Copy(ws, 1, Pos(ws, #13#10));
      if Length(ws) > 50 then
        ws := Copy(ws, 1, 50);
      fn := Format('%.' + IntToStr(keta) + 'd', [i]) + ' - ' + 
        ws + GetExtention(ci.ClipMode);
      fn := IncludeTrailingPathDelimiter(FolderDialog1.Directory) + fn;
      if ci.ClipMode = cmImage then begin
        ci.SaveToImage(fn, Option.DropImgFormat);
      end else begin
        ci.SaveToText(fn);
      end;
    end;
    sl.Free;
    Beep;
  end;
end;

procedure TSimpleClipForm.SimpleEditorActionExecute(Sender: TObject);
//var i: Integer; mi: TMenuItem;
begin
  TheTreeView.Selected := nil;
  DispTextAction.Execute;
//  MemoForm := TMemoForm.Create(Self);
//  try
//    TheIniFile.ReadForm2('MemoForm', MemoForm);
//    MemoForm.Caption := '簡易ｴﾃﾞｨﾀ';
//    for i := 0 to EditTextMenu.Count-1 do begin
//      mi := TMenuItem.Create(Self);
//      mi.Caption := EditTextMenu.Items[i].Caption;
//      mi.OnClick := MemoForm.ScriptMenuClick;
//      MemoForm.ScriptMenu.Add(mi);
//    end;
//
//    MemoForm.Memo1.Color := TheIniFile.ReadColor('MemoForm', 'BkColor', clWhite);
//    TheIniFile.ReadFont('MemoForm', 'Font', MemoForm.Memo1.Font);
//
//    MemoForm.ShowModal;
//
//    TheIniFile.WriteFont('MemoForm', 'Font', MemoForm.Memo1.Font);
//    TheIniFile.WriteColor('MemoForm', 'BkColor', MemoForm.Memo1.Color);
//    TheIniFile.WriteForm2('MemoForm', MemoForm);
//  finally
//    MemoForm.Release;
//  end;
end;

procedure TSimpleClipForm.SetHiddenLock(const Value: Boolean);
var i: Integer; n: TTreeNode; ci: TClipItem;
begin                         
  if not Terminated then begin
    TheTreeView.OnDeletion := nil;
    TheTreeView.Items.BeginUpdate;
  end;
  
  if Value then begin
    CheckMenuItem(hSysmenu, MENU_HIDDENLOCK, MF_CHECKED);
    TempList.Clear;
    for i := 0 to TheTreeView.Items.Count-1 do begin
      n := TheTreeView.Items[i];
      ci := TClipItem(n.Data);
      if ci.Lock then
        TempList.Add(ci);
    end;
    for i := TheTreeView.Items.Count-1 downto 0 do begin  
      n := TheTreeView.Items[i];
      ci := TClipItem(n.Data);
      if ci.Lock then
        n.Delete;
    end;
  end else begin   
    CheckMenuItem(hSysmenu, MENU_HIDDENLOCK, MF_UNCHECKED);
    for i := TempList.Count-1 downto 0 do begin
      ci := TClipItem(TempList[i]);
      TheTreeView.Items.AddObjectFirst(nil, ci.Name, ci);
    end;
    TempList.Clear;
  end;
  FHiddenLock := Value;
  HiddenLockAction.Checked := Value;

  if not Terminated then begin
    TheTreeView.OnDeletion := TheTreeViewDeletion;
    TheTreeView.Items.EndUpdate;
  end;
end;

procedure TSimpleClipForm.HiddenLockActionExecute(Sender: TObject);
begin
  HiddenLock := not HiddenLock;
end;

procedure TSimpleClipForm.LoadFromSearchIni;
var i: Integer; wsi: TWebSearchItem; s: string; mi: TMenuItem;
begin
  if not FileExists(WebSearchIniFile.FileName) then begin
    WebSearchMenu.Visible := False;
    Exit;
  end;
  for i := 0 to 200 do begin
    with WebSearchIniFile do begin
      s := ReadStr('WebSearchItems', 'wsi[' + IntToStr(i) + '].Name', '');
      if s = '' then Exit;
      wsi := TWebSearchItem.Create;
      wsi.Name := s;
      wsi.UrlTop := ReadStr('WebSearchItems', 'wsi[' + IntToStr(i) + '].UrlTop', '');
      wsi.UrlBottom := ReadStr('WebSearchItems', 'wsi[' + IntToStr(i) + '].UrlBottom', '');
      wsi.Encode := TEncode(ReadInt('WebSearchItems', 'wsi[' + IntToStr(i) + '].Encode', 0));     
      wsi.Browser := ReadStr('WebSearchItems', 'wsi[' + IntToStr(i) + '].Browser', '');
      mi := TMenuItem.Create(self);
      mi.Caption := wsi.Name;
      mi.Tag := Integer(wsi);
      mi.OnClick := WebSearchMenuClick;
      WebSearchMenu.Add(mi);
    end;

//    WebSearchList.Add(wsi)
  end;
end;

procedure TSimpleClipForm.WebSearchMenuClick(Sender: TObject);
var wsi: TWebSearchItem;
begin
  wsi := TWebSearchItem(TMenuItem(Sender).Tag);
  wsi.Keyword := GetAvailableLine(TClipItem(TheTreeView.Selected.Data).Text);
  wsi.Excute;
end;

function TSimpleClipForm.GetAvailableLine(AText: string): string;
var
  r: TSkRegExp;
begin
  Result := '';
  r := TSkRegExp.Create;  //オブジェクトを生成
  try
    //正規表現パターンを設定
    r.MultiLine := True;
    r.Expression := '^.+$';
    //検索開始
    if r.Exec (AText) then Result := Trim(r.Match[0]);//p(r.Match[0]);
  finally
    r.Free;   //オブジェクトを解放
  end;
end;


procedure TSimpleClipForm.NewDbActionExecute(Sender: TObject);
var s, fn: string;
const EXT = '.db';
begin
  if InputQuery('新しいファイルの作成',
                'ファイル名を入力してください。拡張子は不要。', s) then begin
    if s = '' then Exit;
    fn := ExtractFilePath(Application.ExeName) + s + EXT;
    if FileExists(fn) then begin
      MessageDlg('以下のファイル名は既に存在しています。'#13#10 +
        fn + #13#10'ファイルを削除するか、他の名前を付けてください。', mtWarning, [mbOK], 0);
      Exit;
    end;
    if CopyFile(PChar(db_set_file), PChar(fn), True) then begin
      SaveDB;
      TheTreeView.Items.Clear;
      db_file := fn;
      TheDB.Free;
      TheDB := TSQLiteDatabase.Create(db_file);
      LoadDB;
    end;
  end;
end;

procedure TSimpleClipForm.ReadDbActionExecute(Sender: TObject);
begin
  DbOpenDialog.InitialDir := ExtractFileDir(Application.ExeName);
  if DbOpenDialog.Execute then begin
    SaveDB;
    TheTreeView.Items.Clear;
    db_file := DbOpenDialog.FileName;
    TheDB.Free;
    TheDB := TSQLiteDatabase.Create(db_file);
    LoadDB;
  end;
end;

procedure TSimpleClipForm.SaveDbActionExecute(Sender: TObject);
begin
  DbSaveDialog.InitialDir := ExtractFileDir(Application.ExeName);
  DbSaveDialog.FileName := ExtractFileName(db_file);
  if DbSaveDialog.Execute then begin
    SaveDB;
    CopyFile(PChar(db_file), PChar(DbSaveDialog.FileName), True);
    db_file := DbSaveDialog.FileName;   
    TheDB.Free;
    TheDB := TSQLiteDatabase.Create(db_file);
  end;
end;

procedure TSimpleClipForm.SetFormsCaption(s: string);
var cap: string;
begin
  cap := 'SimpleClip [' + ExtractFileName(s) + ']';
  if cap <> Caption then
    Caption := cap;
end;

procedure TSimpleClipForm.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  SetFormsCaption(db_file);
end;

end.
