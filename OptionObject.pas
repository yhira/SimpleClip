unit OptionObject;

interface

uses
  ExtIniFile, Classes, Option, Windows, Helper, Menus, Forms,
  Dbg, Controls, MMSystem, CommModules, Graphics;

type
  TOption = class
  private
    hKeyDll, hMouseDll: HWND;
    InstallMouseHook: TInstallMouseHook;
    UnInstallMouseHook :TUnInstallMouseHook;
    GetMouseUniqueMessage: TGetMouseUniqueMessage;
    UnInstallKeyHook: TUnInstallKeyHook;
    InstallKeyHook: TInstallKeyHook;
    GetKeyUniqueMessage: TGetKeyUniqueMessage;     
//    FIniFile: TIniFileCompo;
    FIniFile: TExtIniFile;
    FHistoryCount: Integer;
    FNameMode: TNameMode;
    FIsDblClickExec: Boolean;
    FIsMinimiz: Boolean;
    FDropImgFormat: TDropImgFormat;
    FCallMouseAction: TCallMouseAction;
    FCallKeyPress: TCallKeyPress;
    FHotkey: TShortCut;
    FDropEexeAction: TEexeAction;
    FImageEexeAction: TEexeAction;
    FTextEexeAction: TEexeAction;
    FHotkeyId: ATOM;
    FIsCallMousePos: Boolean;
    FIsImageExclusion: Boolean;
    FIsTextExclusion: Boolean;
    FIsDropExclusion: Boolean;
    FIsSound: Boolean;
    FSoundFile: string;
    FTreeColor: TColor;
    FTreeFont: TFont;
    FIsHotTrack: Boolean;
    FHintFont: TFont;
    FHintColor: TColor;
    FHintWidth: Integer;
    FHintFontColor: TColor;
    FIsShowHint: Boolean;
    FIsZoomImage: Boolean;
    FIsShowIcon: Boolean;
    FIconBmpFile: string;
    FIsHideForm: Boolean;
    FIsClearList: Boolean;
    FIsHideWhenExe: Boolean;
    FIsClearImage: Boolean;
    FIsDelAfterSavedImg: Boolean;
    FIsIgnoreWhenHide: Boolean;
    FIsKeepImgSizeHint: Boolean;
    FMaxHistoryCount: Integer;
    FIsItemSort: Boolean;
    procedure OpenMouseHookDll(ADll: string);
    procedure CloseMouseHookDll;
    procedure OpenKeyHookDll(ADll: string);
    procedure CloseKeyHookDll;
    procedure SetHistoryCount(const Value: Integer);
    procedure SetNameMode(const Value: TNameMode);
    procedure SetIsDblClickExec(const Value: Boolean);
    procedure SetIsMinimiz(const Value: Boolean);
    procedure SetDropImgFormat(const Value: TDropImgFormat);
    procedure SetCallMouseAction(const Value: TCallMouseAction);
    procedure SetCallKeyPress(const Value: TCallKeyPress);
    procedure SetHotkey(const Value: TShortCut);
    procedure SetDropEexeAction(const Value: TEexeAction);
    procedure SetImageEexeAction(const Value: TEexeAction);
    procedure SetTextEexeAction(const Value: TEexeAction);
    procedure UnInstallHotKey;
    procedure InstallHotKey(const Value: TShortCut);
    function GetKeyUniqueMsg: Cardinal;
    function GetMouseUniqueMsg: Cardinal;
    procedure SetIsCallMousePos(const Value: Boolean);
    procedure SetIsDropExclusion(const Value: Boolean);
    procedure SetIsImageExclusion(const Value: Boolean);
    procedure SetIsTextExclusion(const Value: Boolean);
    procedure SetIsSound(const Value: Boolean);
    procedure SetSoundFile(const Value: string);
    procedure SetTreeColor(const Value: TColor);
    procedure SetTreeFont(const Value: TFont);
    procedure SetIsHotTrack(const Value: Boolean);
    procedure SetHintFont(const Value: TFont);
    procedure SetHintColor(const Value: TColor);
    procedure SetHintWidth(const Value: Integer);
    procedure SetHintFontColor(const Value: TColor);
    procedure SetIsShowHint(const Value: Boolean);
    procedure SetIsZoomImage(const Value: Boolean);
    procedure SetIsShowIcon(const Value: Boolean);
    procedure SetIconBmpFile(const Value: string);
    procedure SetIsHideForm(const Value: Boolean);
    procedure SetIsClearList(const Value: Boolean);
    procedure SetIsHideWhenExe(const Value: Boolean);
    procedure SetIsClearImage(const Value: Boolean);
    procedure SetIsDelAfterSavedImg(const Value: Boolean);
    procedure SetIsIgnoreWhenHide(const Value: Boolean);
    procedure SetIsKeepImgSizeHint(const Value: Boolean);
    procedure SetMaxHistoryCount(const Value: Integer);
    procedure SetIsItemSort(const Value: Boolean);
  protected

  public
    constructor Create;
    destructor Destroy; override;
    procedure SaveToIni;
    procedure LoadFromIni;
    procedure GetFromDlg;
    procedure SetToDlg;   
    procedure PlaySound;
  published
    property HistoryCount: Integer read FHistoryCount write SetHistoryCount; 
    property MaxHistoryCount: Integer read FMaxHistoryCount write SetMaxHistoryCount;
    property NameMode: TNameMode read FNameMode write SetNameMode;
    property IsDblClickExec: Boolean
      read FIsDblClickExec write SetIsDblClickExec;
    property IsMinimiz: Boolean read FIsMinimiz write SetIsMinimiz;
    property DropImgFormat: TDropImgFormat
      read FDropImgFormat write SetDropImgFormat;
    property CallKeyPress: TCallKeyPress
      read FCallKeyPress write SetCallKeyPress;
    property CallMouseAction: TCallMouseAction
      read FCallMouseAction write SetCallMouseAction;
    property Hotkey: TShortCut read FHotkey write SetHotkey;
    property TextEexeAction: TEexeAction
      read FTextEexeAction write SetTextEexeAction;
    property ImageEexeAction: TEexeAction
      read FImageEexeAction write SetImageEexeAction;
    property DropEexeAction: TEexeAction
      read FDropEexeAction write SetDropEexeAction;
    property HotkeyId: ATOM read FHotkeyId;
    property MouseUniqueMessage: Cardinal read GetMouseUniqueMsg;
    property KeyUniqueMessage: Cardinal read GetKeyUniqueMsg;
    property IsCallMousePos: Boolean
      read FIsCallMousePos write SetIsCallMousePos;
    property IsTextExclusion: Boolean read FIsTextExclusion write SetIsTextExclusion;
    property IsImageExclusion: Boolean read FIsImageExclusion write SetIsImageExclusion;
    property IsDropExclusion: Boolean read FIsDropExclusion write SetIsDropExclusion;
    property IsSound: Boolean read FIsSound write SetIsSound;
    property SoundFile: string read FSoundFile write SetSoundFile;
    property TreeFont: TFont read FTreeFont write SetTreeFont;
    property TreeColor: TColor read FTreeColor write SetTreeColor;
    property IsHotTrack: Boolean read FIsHotTrack write SetIsHotTrack;
//    property HintFont: TFont read FHintFont write SetHintFont;
    property HintColor: TColor read FHintColor write SetHintColor;  
    property HintFontColor: TColor read FHintFontColor write SetHintFontColor;
    property HintWidth: Integer read FHintWidth write SetHintWidth;
    property IsShowHint: Boolean read FIsShowHint write SetIsShowHint;
    property IsZoomImage: Boolean read FIsZoomImage write SetIsZoomImage;
    property IsShowIcon: Boolean read FIsShowIcon write SetIsShowIcon;
    property IconBmpFile: string read FIconBmpFile write SetIconBmpFile;
    property IsHideForm: Boolean read FIsHideForm write SetIsHideForm;
    property IsClearList: Boolean read FIsClearList write SetIsClearList;
    property IsHideWhenExe: Boolean read FIsHideWhenExe write SetIsHideWhenExe;
    property IsClearImage: Boolean read FIsClearImage write SetIsClearImage;
    property IsDelAfterSavedImg: Boolean read FIsDelAfterSavedImg write SetIsDelAfterSavedImg;
    property IsIgnoreWhenHide: Boolean read FIsIgnoreWhenHide write SetIsIgnoreWhenHide;
    property IsKeepImgSizeHint: Boolean read FIsKeepImgSizeHint write SetIsKeepImgSizeHint;
    property IsItemSort: Boolean read FIsItemSort write SetIsItemSort;
//    property CallHotkey: TShortCut;
//    property CallKeyPress: TCallKeyPress;
  end;


implementation

uses SysUtils, Main, ExtCtrls;

{ TOption }

constructor TOption.Create;
begin
  FIniFile := TExtIniFile.Create(nil);
  FTreeFont := TFont.Create;
//  FHintFont := TFont.Create;
  FIniFile.DefaultFolder := dfUser;
  FIniFile.FileName := ExtractFilePath(Application.ExeName) + 'Option.ini';
  FIniFile.UpdateAtOnce := True;
  hKeyDll := 0;
  hMouseDll := 0;
end;

destructor TOption.Destroy;
begin
//  DOutI(integer(addr(UnInstallMouseHook)));
//  DOutI(integer(addr(UnInstallKeyHook)));
  if hMouseDll <> 0 then begin
    UnInstallMouseHook;
    CloseMouseHookDll;
  end;
  if hKeyDll <> 0 then begin
    UnInstallKeyHook;
    CloseKeyHookDll;
  end;   

  UnInstallHotKey;
//  FHintFont.Free;
  FTreeFont.Free;
  FIniFile.Free;
  inherited;
end;

procedure TOption.LoadFromIni;
var FixNo: Integer;
begin
  with FIniFile do begin                                         
    MaxHistoryCount := ReadInt('Opton', 'MaxHistoryCount', 100);
    HistoryCount := ReadInt('Opton', 'HistoryCount', 30);  
    NameMode := TNameMode(ReadInt('Opton', 'NameMode', Ord(nmWndCaption)));
    IsDblClickExec := ReadBool('Opton', 'IsDblClickExec', True);
    IsMinimiz := ReadBool('Opton', 'IsMinimiz', True);
    DropImgFormat := TDropImgFormat(ReadInt('Opton',
      'DropImgFormat', Ord(difPng)));
    CallMouseAction := TCallMouseAction(
      ReadInt('Opton', 'CallMouseAction', Ord(cmaLDblClkDsk)));
    CallKeyPress := TCallKeyPress(
      ReadInt('Opton', 'CallKeyPress', Ord(ckpNone)));
    TextEexeAction := TEexeAction(
      ReadInt('Opton', 'TextEexeAction', Ord(eaPaste)));
    ImageEexeAction := TEexeAction(
      ReadInt('Opton', 'ImageEexeAction', Ord(eaDialog)));
    DropEexeAction := TEexeAction(
      ReadInt('Opton', 'DropEexeAction', Ord(eaPaste)));
    IsCallMousePos := ReadBool('Opton', 'IsCallMousePos', False);
    IsTextExclusion := ReadBool('Opton', 'IsTextExclusion', False);
    IsImageExclusion := ReadBool('Opton', 'IsImageExclusion', False);
    IsDropExclusion := ReadBool('Opton', 'IsDropExclusion', False);
    Hotkey := ReadInt('Opton', 'Hotkey', 0);
    IsSound := ReadBool('Opton', 'IsSound', True);
    SoundFile := ReadStr('Opton', 'SoundFile', sound_file);
    ReadFont('Opton', 'TreeFont', TreeFont);
    TreeFont := TreeFont;
    TreeColor := ReadColor('Opton', 'TreeColor', clWindow);
    IsHotTrack := ReadBool('Opton', 'IsHotTrack', True);
//    ReadFont('Opton', 'HintFont', HintFont);
//    HintFont := HintFont;
    HintColor := ReadColor('Opton', 'HintColor', clCream);
    HintFontColor := ReadColor('Opton', 'HintFontColor', clWindowText);
    HintWidth := ReadInt('Opton', 'HintWidth', 300);
    IsShowHint := ReadBool('Opton', 'IsShowHint', True);
    IsZoomImage := ReadBool('Opton', 'IsZoomImage', True);
    IsShowIcon := ReadBool('Opton', 'IsShowIcon', True);
    IconBmpFile := ReadStr('Opton', 'IconBmpFile', bmp_file);
    IsHideForm := ReadBool('Opton', 'IsHideForm', False);
    IsClearList := ReadBool('Opton', 'IsClearList', False);
    IsClearImage := ReadBool('Opton', 'IsClearImage', False);
    IsHideWhenExe := ReadBool('Opton', 'IsHideWhenExe', False);
    IsDelAfterSavedImg := ReadBool('Opton', 'IsDelAfterSavedImg', False);
    IsIgnoreWhenHide := ReadBool('Opton', 'IsIgnoreWhenHide', False);
    IsKeepImgSizeHint := ReadBool('Opton', 'IsKeepImgSizeHint', False);    
    IsItemSort := ReadBool('Opton', 'IsItemSort', True);

    FixNo := ReadInt('Opton', 'FixNo', 0);
    if FixNo = 0 then begin
      if (not IsTextExclusion) and (not IsImageExclusion) and
        (not IsDropExclusion) then Exit;
      IsTextExclusion := not IsTextExclusion;
      IsImageExclusion := not IsImageExclusion;
      IsDropExclusion := not IsDropExclusion;
    end;
  end;
end;

procedure TOption.SaveToIni;
begin
  with FIniFile do begin
    WriteInt('Opton', 'HistoryCount', HistoryCount); 
    WriteInt('Opton', 'MaxHistoryCount', MaxHistoryCount);
    WriteInt('Opton', 'NameMode', Ord(NameMode));
    WriteBool('Opton', 'IsDblClickExec', IsDblClickExec);
    WriteBool('Opton', 'IsMinimiz', IsMinimiz);    
    WriteInt('Opton', 'DropImgFormat', Ord(DropImgFormat));
    WriteInt('Opton', 'Hotkey', Hotkey);
    WriteInt('Opton', 'CallMouseAction', Ord(CallMouseAction));
    WriteInt('Opton', 'CallKeyPress', Ord(CallKeyPress));
    WriteInt('Opton', 'TextEexeAction', Ord(TextEexeAction));
    WriteInt('Opton', 'ImageEexeAction', Ord(ImageEexeAction));
    WriteInt('Opton', 'DropEexeAction', Ord(DropEexeAction));
    WriteBool('Opton', 'IsCallMousePos', IsCallMousePos);
    WriteBool('Opton', 'IsTextExclusion', IsTextExclusion);
    WriteBool('Opton', 'IsImageExclusion', IsImageExclusion);
    WriteBool('Opton', 'IsDropExclusion', IsDropExclusion);
    WriteBool('Opton', 'IsSound', IsSound);
    WriteStr('Opton', 'SoundFile', SoundFile);
    WriteFont('Opton', 'TreeFont', TreeFont);
    WriteColor('Opton', 'TreeColor', TreeColor);
    WriteBool('Opton', 'IsHotTrack', IsHotTrack);
//    WriteFont('Opton', 'HintFont', HintFont);
    WriteColor('Opton', 'HintColor', HintColor);   
    WriteColor('Opton', 'HintFontColor', HintFontColor);
    WriteInt('Opton', 'HintWidth', HintWidth);
    WriteBool('Opton', 'IsShowHint', IsShowHint);
    WriteBool('Opton', 'IsZoomImage', IsZoomImage);
    WriteBool('Opton', 'IsShowIcon', IsShowIcon);
    WriteStr('Opton', 'IconBmpFile', IconBmpFile);
    WriteBool('Opton', 'IsHideForm', IsHideForm);
    WriteBool('Opton', 'IsClearList', IsClearList);       
    WriteBool('Opton', 'IsClearImage', IsClearImage);
    WriteBool('Opton', 'IsHideWhenExe', IsHideWhenExe);
    WriteBool('Opton', 'IsDelAfterSavedImg', IsDelAfterSavedImg);
    WriteBool('Opton', 'IsIgnoreWhenHide', IsIgnoreWhenHide);
    WriteBool('Opton', 'IsKeepImgSizeHint', IsKeepImgSizeHint);     
    WriteBool('Opton', 'IsItemSort', IsItemSort);

    WriteInt('Opton', 'FixNo', 1);

    Update;
  end;
end;

procedure TOption.GetFromDlg;
begin
  with OptionDlg do begin
    HistoryCount := HistoryCountSpinEdit.Value;
    NameMode := TNameMode(NameModeRadioGroup.ItemIndex);
    IsDblClickExec := IsDblClickExecCheckBox.Checked;
    IsMinimiz := IsMinimizCheckBox.Checked;
    DropImgFormat := TDropImgFormat(DropImgFormatRadioGroup.ItemIndex);
    CallKeyPress := TCallKeyPress(CallKeyPressRadioGroup.ItemIndex);
    CallMouseAction := TCallMouseAction(CallMouseActionRadioGroup.ItemIndex);
    Hotkey := TextToShortCut(HotKeyEdit.Text);
    TextEexeAction := TEexeAction(TextEexeActionRadioGroup.ItemIndex);
    ImageEexeAction := TEexeAction(ImageEexeActionRadioGroup.ItemIndex);
    DropEexeAction := TEexeAction(DropEexeActionRadioGroup.ItemIndex);
    IsCallMousePos := IsCallMousePosCheckBox.Checked;
    IsTextExclusion := IsTextExclusionCheckBox.Checked;
    IsImageExclusion := IsImageExclusionCheckBox.Checked;
    IsDropExclusion := IsDropExclusionCheckBox.Checked;
    IsSound := IsSoundCheckBox.Checked;
    SoundFile := SoundFileEdit.Text;
    TreeFont := TreeFontDialog.Font;
    TreeColor := TreeColorColorBox.Selected;
    IsHotTrack := IsHotTrackCheckBox.Checked;
//    HintFont := HintFontDialog.Font;
    HintColor := HintColorColorBox.Selected;
    HintFontColor := HintFontColorColorBox.Selected;
    HintWidth := HintWidthSpinEdit.Value;
    IsShowHint := IsShowHintCheckBox.Checked;
    IsZoomImage := IsZoomImageCheckBox.Checked;
    IsShowIcon := IsShowIconCheckBox.Checked;
    IconBmpFile := IconBmpFileEdit.Text;
    IsHideForm := IsHideFormCheckBox.Checked;
    IsClearList := IsClearListCheckBox.Checked;
    IsClearImage := IsClearImageCheckBox.Checked;
    IsHideWhenExe := IsHideWhenExeCheckBox.Checked;
    IsDelAfterSavedImg := IsDelAfterSavedImgCheckBox.Checked;
    IsIgnoreWhenHide := IsIgnoreWhenHideCheckBox.Checked;
    IsKeepImgSizeHint := IsKeepImgSizeHintCheckBox.Checked;
    IsItemSort := IsItemSortCheckBox.Checked;
  end;
end;

procedure TOption.SetToDlg;
begin
  with OptionDlg do begin      
    HistoryCountSpinEdit.MaxValue := MaxHistoryCount;
    HistoryRangeLabel.Caption := '(10 - ' + IntToStr(MaxHistoryCount) + ')';
    HistoryCountSpinEdit.Value := HistoryCount;
    NameModeRadioGroup.ItemIndex := Ord(NameMode);
    IsDblClickExecCheckBox.Checked := IsDblClickExec;
    IsMinimizCheckBox.Checked := IsMinimiz;
    DropImgFormatRadioGroup.ItemIndex := Ord(DropImgFormat);
    CallKeyPressRadioGroup.ItemIndex := Ord(CallKeyPress);
    CallMouseActionRadioGroup.ItemIndex := Ord(CallMouseAction);
    HotKeyEdit.Text := ShortCutToText(Hotkey);
    TextEexeActionRadioGroup.ItemIndex := Ord(TextEexeAction);
    ImageEexeActionRadioGroup.ItemIndex := Ord(ImageEexeAction);
    DropEexeActionRadioGroup.ItemIndex := Ord(DropEexeAction);
    IsCallMousePosCheckBox.Checked := IsCallMousePos;
    IsTextExclusionCheckBox.Checked := IsTextExclusion;
    IsImageExclusionCheckBox.Checked := IsImageExclusion;
    IsDropExclusionCheckBox.Checked := IsDropExclusion;
    IsSoundCheckBox.Checked := IsSound;
    SoundFileEdit.Text := SoundFile;
    TreeFontDialog.Font := TreeFont;
    TreeColorColorBox.Selected := TreeColor; 
    IsHotTrackCheckBox.Checked := IsHotTrack;  
//    HintFontDialog.Font := HintFont;
    HintColorColorBox.Selected := HintColor;  
    HintFontColorColorBox.Selected := HintFontColor;
    HintWidthSpinEdit.Value := HintWidth;   
    IsShowHintCheckBox.Checked := IsShowHint; 
    IsZoomImageCheckBox.Checked := IsZoomImage;  
    IsShowIconCheckBox.Checked := IsShowIcon;  
    IconBmpFileEdit.Text := IconBmpFile;  
    IsHideFormCheckBox.Checked := IsHideForm;
    IsClearListCheckBox.Checked := IsClearList; 
    IsClearImageCheckBox.Checked := IsClearImage;
    IsHideWhenExeCheckBox.Checked := IsHideWhenExe;
    IsDelAfterSavedImgCheckBox.Checked := IsDelAfterSavedImg; 
    IsIgnoreWhenHideCheckBox.Checked := IsIgnoreWhenHide; 
    IsKeepImgSizeHintCheckBox.Checked := IsKeepImgSizeHint;  
    IsItemSortCheckBox.Checked := IsItemSort;
  end;
end;

procedure TOption.SetHistoryCount(const Value: Integer);
begin
  FHistoryCount := Value;
  if Value < 10 then FHistoryCount := 10; 
  if Value > MaxHistoryCount then FHistoryCount := MaxHistoryCount;
end;

procedure TOption.SetIsMinimiz(const Value: Boolean);
begin
  FIsMinimiz := Value;
end;

procedure TOption.SetIsDblClickExec(const Value: Boolean);
begin
  FIsDblClickExec := Value;
  with SimpleClipForm do begin
    if Value then begin
      TheTreeView.DragMode := dmAutomatic;
      TheTreeView.OnDblClick := TheTreeViewDblClick;
      TheTreeView.OnClick := nil;
//      TheTreeView.OnClick := TheTreeViewDblClick;
    end else begin
      SimpleClipForm.TheTreeView.DragMode := dmManual;
      TheTreeView.OnDblClick := nil;
      TheTreeView.OnClick := TheTreeViewDblClick;
    end;
  end;
end;

procedure TOption.SetNameMode(const Value: TNameMode);
begin
  FNameMode := Value;
end;

procedure TOption.SetDropImgFormat(const Value: TDropImgFormat);
begin
  FDropImgFormat := Value;
end;

procedure TOption.SetCallMouseAction(const Value: TCallMouseAction);
var mhfn: string;
begin
  FCallMouseAction := Value;
  mhfn := 'mh.dll';
  if (Value <> cmaNone) and  FileExists(mhfn) then begin
    OpenMouseHookDll(mhfn);
    (InstallMouseHook(Application.Handle));
  end else begin           
//    FCallMouseAction := cmaNone;
    if hMouseDll <> 0 then begin
      UnInstallMouseHook;
      CloseMouseHookDll;
    end;
  end;
end;

procedure TOption.SetCallKeyPress(const Value: TCallKeyPress);
var khfn: string;
begin
  FCallKeyPress := Value;
  khfn := 'kh.dll';
  if (Value <> ckpNone) and (Value <> ckpHotkey) and
                           FileExists(khfn) then begin
    OpenKeyHookDll(khfn);
    InstallKeyHook(Application.Handle);
  end else begin
    if hKeyDll <> 0 then begin
      UnInstallKeyHook;
      CloseKeyHookDll;
    end;
  end;
end;

procedure TOption.UnInstallHotKey;
begin
  //ホットキーの登録解除
  UnregisterHotKey(SimpleClipForm.Handle, FHotkeyId);
  //アトムに関連付けられている文字列を、アトムテーブルから削除
  DeleteAtom(FHotkeyId);
end;

procedure TOption.InstallHotKey(const Value: TShortCut);  
var fsModifiers, vk: UINT;
begin
  //文字列を識別する一意の値をもらいそれをホットキーIDとする
  FHotkeyId := GlobalAddAtom(PChar('SimpleClipHotKey'));
  GetHotKeyFromShortCut(Value, fsModifiers, vk);
  RegisterHotKey(SimpleClipForm.Handle, FHotkeyId, fsModifiers, vk);
end;

procedure TOption.SetHotkey(const Value: TShortCut);
begin
  FHotkey := Value;
  if (CallKeyPress = ckpHotkey) and (Value <> 0) then begin
    InstallHotKey(Value);
    SimpleClipForm.DispAction.ShortCut := Value;
  end else begin
    UnInstallHotKey;
  end;
end;

procedure TOption.SetDropEexeAction(const Value: TEexeAction);
begin
  FDropEexeAction := Value;
end;

procedure TOption.SetImageEexeAction(const Value: TEexeAction);
begin
  FImageEexeAction := Value;
end;

procedure TOption.SetTextEexeAction(const Value: TEexeAction);
begin
  FTextEexeAction := Value;
end;

procedure TOption.CloseKeyHookDll;
begin
  if hKeyDll <> 0 then begin
    FreeLibrary(hKeyDll);
    hKeyDll := 0;
  end;
end;

procedure TOption.CloseMouseHookDll;
begin
  if hMouseDll <> 0 then begin
    FreeLibrary(hMouseDll);
    hMouseDll := 0;
  end; 
end;

procedure TOption.OpenKeyHookDll(ADll: string);
begin
  CloseKeyHookDll;
  hKeyDll := LoadLibrary(PChar(ADll));
  if (hKeyDll <> 0) then begin
    InstallKeyHook     := GetProcAddress(hKeyDll, 'InstallKeyHook');
    UnInstallKeyHook   := GetProcAddress(hKeyDll, 'UnInstallKeyHook');
    GetKeyUniqueMessage := GetProcAddress(hKeyDll, 'GetKeyUniqueMessage');
  end else
    CallKeyPress := ckpNone;
//  DOutI(integer(addr(InstallKeyHook)));
//  DOutI(integer(addr(UnInstallKeyHook)));
//  DOutI(integer(addr(GetKeyUniqueMessage)));
end;

procedure TOption.OpenMouseHookDll(ADll: string);
begin
  CloseMouseHookDll;
  hMouseDll := LoadLibrary(PChar(ADll));
  if (hMouseDll <> 0) then begin
    InstallMouseHook     := GetProcAddress(hMouseDll, 'InstallMouseHook');
    UnInstallMouseHook   := GetProcAddress(hMouseDll, 'UnInstallMouseHook');
    GetMouseUniqueMessage := GetProcAddress(hMouseDll, 'GetMouseUniqueMessage');
  end else
    CallMouseAction := cmaNone;
end;

function TOption.GetKeyUniqueMsg: Cardinal;
begin
  if hKeyDll = 0 then
    Result := 0
  else
    Result := GetKeyUniqueMessage;
end;

function TOption.GetMouseUniqueMsg: Cardinal;
begin          
  if hMouseDll = 0 then
    Result := 0
  else
  Result := GetMouseUniqueMessage;
end;

procedure TOption.SetIsCallMousePos(const Value: Boolean);
begin
  FIsCallMousePos := Value;
end;

procedure TOption.SetIsDropExclusion(const Value: Boolean);
begin
  FIsDropExclusion := Value;
end;

procedure TOption.SetIsImageExclusion(const Value: Boolean);
begin
  FIsImageExclusion := Value;
end;

procedure TOption.SetIsTextExclusion(const Value: Boolean);
begin
  FIsTextExclusion := Value;
end;

procedure TOption.SetIsSound(const Value: Boolean);
begin
  FIsSound := Value;
end;

procedure TOption.SetSoundFile(const Value: string);
begin
  FSoundFile := Value;
end;

procedure TOption.PlaySound;
begin
  if not IsSound then Exit;
  if not FileExists(FSoundFile) then
    FSoundFile := sound_file;
  sndPlaySound(nil, SND_ASYNC);
  sndPlaySound(PChar(FSoundFile), SND_ASYNC);
end;

procedure TOption.SetTreeColor(const Value: TColor);
begin
  FTreeColor := Value;
  SimpleClipForm.TheTreeView.Color := Value;
end;

procedure TOption.SetTreeFont(const Value: TFont);
begin
  FTreeFont.Assign(Value);    
  SimpleClipForm.TheTreeView.Font := Value;
end;

procedure TOption.SetIsHotTrack(const Value: Boolean);
begin
  FIsHotTrack := Value;
  SimpleClipForm.TheTreeView.HotTrack := Value;
end;

procedure TOption.SetHintFont(const Value: TFont);
begin
  FHintFont.Assign(Value);
//  Screen.HintFont := Value;
end;

procedure TOption.SetHintColor(const Value: TColor);
begin
  FHintColor := Value;
end;

procedure TOption.SetHintWidth(const Value: Integer);
begin
  FHintWidth := Value;
end;

procedure TOption.SetHintFontColor(const Value: TColor);
begin
  FHintFontColor := Value;
end;

procedure TOption.SetIsShowHint(const Value: Boolean);
begin
  FIsShowHint := Value;
end;

procedure TOption.SetIsZoomImage(const Value: Boolean);
begin
  FIsZoomImage := Value;
end;

procedure TOption.SetIsShowIcon(const Value: Boolean);
begin
  FIsShowIcon := Value;
  if Value then begin
    SimpleClipForm.TheTreeView.Images := SimpleClipForm.TreeImageList;
  end else begin
    SimpleClipForm.TheTreeView.Images := nil;
  end;
//  SimpleClipForm.tr
end;

procedure TOption.SetIconBmpFile(const Value: string);
var bmp: TBitmap;
begin
  FIconBmpFile := Value;
  if FIsShowIcon and (FileExists(Value)) then begin
    bmp := TBitmap.Create;
    try
      bmp.LoadFromFile(Value);
      with SimpleClipForm do begin
        TreeImageList.Clear;
        TreeImageList.AddMasked(bmp, clFuchsia);
      end;
    finally
      bmp.Free
    end;
  end;
end;

procedure TOption.SetIsHideForm(const Value: Boolean);
begin
  FIsHideForm := Value;
  Application.ShowMainForm := not Value;
end;

procedure TOption.SetIsClearList(const Value: Boolean);
begin
  FIsClearList := Value;
end;

procedure TOption.SetIsHideWhenExe(const Value: Boolean);
begin
  FIsHideWhenExe := Value;
end;

procedure TOption.SetIsClearImage(const Value: Boolean);
begin
  FIsClearImage := Value;
end;

procedure TOption.SetIsDelAfterSavedImg(const Value: Boolean);
begin
  FIsDelAfterSavedImg := Value;
end;

procedure TOption.SetIsIgnoreWhenHide(const Value: Boolean);
begin
  FIsIgnoreWhenHide := Value;
end;

procedure TOption.SetIsKeepImgSizeHint(const Value: Boolean);
begin
  FIsKeepImgSizeHint := Value;
end;

procedure TOption.SetMaxHistoryCount(const Value: Integer);
begin
  if (Value >= 100) and (Value <= 10000) then
    FMaxHistoryCount := Value
  else
    FMaxHistoryCount := 100;
end;

procedure TOption.SetIsItemSort(const Value: Boolean);
begin
  FIsItemSort := Value;
end;

end.
