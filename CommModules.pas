unit CommModules;

interface

uses
  SQLiteTable3, Classes, Windows, pngimage, MD5, Dbg, Helper,
  Jpeg, Graphics, Clipbrd, Messages, Forms, ShellApi, HTTPApp, jconvertex;

const
  VERSION = 'Ver.1.26.32';

  TABLE_NAME = 'ClipTable';

  CLM_ID          = 'ID';
  CLM_NAME        = 'Name';
  CLM_CLIPMODE    = 'ClipMode';
//  CLM_CLIPDATA    = 'ClipData';
  CLM_USEDCOUNT   = 'UsedCount';
  CLM_CREATEDDATE = 'CreatedDate';
  CLM_UPDATEDDATE = 'UpdatedDate';
  CLM_USEDDATE    = 'UsedDate';
  CLM_LOCK        = 'Lock';
  CLM_TEXT        = 'Text';
  CLM_IMAGE       = 'Image'; 
  CLM_HASH        = 'Hash';

  MENU_MOPMOST = 201;   
  MENU_OPTION  = 202;      
  MENU_VERSION = 203;
  MENU_EXPORT  = 204;
  MENU_EDITOR  = 205;  
  MENU_HIDDENLOCK  = 206;
  MENU_NEWDB   = 207;
  MENU_READDB  = 208;
  MENU_SAVEDB  = 209;

type
  //option
  TNameMode = (nmWndCaption, nmWndClass, nmDate);
//  TCallMouseAction = ();
  TDropImgFormat = (difBmp, difPng, difJpg);
  TCallKeyPress = (ckpNone, ckpHotkey, ckpShift, ckpCtrl, ckpAlt, ckpCaps);
  TCallMouseAction = (cmaNone, cmaLDblClkDsk, cmaRDblClkDsk, cmaMDblClkDsk,
    cmaLDblClkTsk, cmaRDblClkTsk, cmaMDblClkTsk);
  TEexeAction = (eaPaste, eaCopy, eaDialog);
  //obj
  TClipMode = (cmText, cmImage, cmDrop);

  //mouse hook func
  TInstallMouseHook = function (Wnd: HWND): Boolean; stdcall;
  TUnInstallMouseHook = procedure ; stdcall;
  TGetMouseUniqueMessage = function : Cardinal;stdcall;
   //ke yhook func
  TInstallKeyHook = function (Wnd: HWND): Boolean; stdcall;
  TUnInstallKeyHook = procedure ; stdcall;
  TGetKeyUniqueMessage = function : Cardinal;stdcall;
                                      
  TEncode = (eNone, eUrl, eUtf8, eEuc);
  
  TClipItem = class
  private
    FLock: Boolean;
    FUsedCount: Cardinal;
    FID: Integer;
    FName: string;
    FClipMode: TClipMode;
    FUpdatedDate: TDateTime;
    FCreatedDate: TDateTime;
    FUsedDate: TDateTime;
    FText: string;
    FPngImage: TPNGObject;
    FHash: string;
//    FClipData: TMemoryStream;
    procedure SetClipMode(const Value: TClipMode);
    procedure SetCreatedDate(const Value: TDateTime);
    procedure SetID(const Value: Integer);
    procedure SetLock(const Value: Boolean);
    procedure SetName(const Value: string);
    procedure SetUpdatedDate(const Value: TDateTime);
    procedure SetUsedCount(const Value: Cardinal);
    procedure SetUsedDate(const Value: TDateTime);
    procedure SetPngImage(const Value: TPNGObject);
    procedure SetText(const Value: string);
    procedure SetHash(const Value: string);
//    procedure SetClipData(const Value: TMemoryStream);

  protected

  public
    constructor Create;
    destructor Destroy; override;
    function ClacHash: string;
    function SaveToText(FileName: string): Boolean;
    function SaveToImage(FileName: string; dif: TDropImgFormat): Boolean;
    procedure ToClipBoard;
    procedure Paste(Text: string = '');
    procedure Assign(ci: TClipItem);
//    procedure Insert;
//    procedure Update;
//    procedure Delete;
    property ID: Integer read FID write SetID;
    property Name: string read FName write SetName;
    property ClipMode: TClipMode read FClipMode write SetClipMode;
//    property ClipData: TMemoryStream read FClipData write SetClipData;
    property UsedCount: Cardinal read FUsedCount write SetUsedCount;
    property CreatedDate: TDateTime read FCreatedDate write SetCreatedDate;
    property UpdatedDate: TDateTime read FUpdatedDate write SetUpdatedDate;
    property UsedDate: TDateTime read FUsedDate write SetUsedDate;
    property Lock: Boolean read FLock write SetLock;
    property PngImage: TPNGObject read FPngImage write SetPngImage;
    property Text: string read FText write SetText;
    property Hash: string read FHash write SetHash;
  end;


  TWebSearchItem = class
  private
    FUrlTop: string;
    FUrlBottom: string;
    FEncode: TEncode;
    FKeyword: string;
    FName: string;
    FBrowser: string;
    function GetUrl: String;
    procedure SetEncode(const Value: TEncode);
    procedure SetUrlBottom(const Value: string);
    procedure SetUrlTop(const Value: string);
    procedure SetKeyword(const Value: string);
    procedure SetName(const Value: string);
    procedure SetBrowser(const Value: string);
  public
    constructor Create;
    procedure Excute;
    property UrlTop: string read FUrlTop write SetUrlTop;
    property UrlBottom: string read FUrlBottom write SetUrlBottom;
    property Keyword: string read FKeyword write SetKeyword;
    property Encode: TEncode read FEncode write SetEncode;
    property Url: String read GetUrl;
    property Name: string read FName write SetName;
    property Browser: string read FBrowser write SetBrowser;
  end;

var
  TheDB: TSQLiteDatabase;
  db_file, db_set_file, temp_dir_path,
  sound_dir_path, sound_file,
  bmp_dir_path, bmp_file: string;
  h_foreground_wnd, h_fourcus_ctrl, h_form_wnd: HWND;
  fourcus_ctrl_selstart, fourcus_ctrl_selend: Integer;
  once_hittest: BOOL;
//  JournalHook: HHOOK;


implementation

uses SysUtils, Main;

{ TClipItem }

function TClipItem.ClacHash: string;
var ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  case ClipMode of
    cmImage:begin
      PngImage.SaveToStream(ms);
      ms.Position := 0;
      Result := CalcMD5(ms.Memory, ms.Size);
//      DOut(Result);
//      DOutI(ms.Size);
    end;
    else Result := CalcMD5(PByte(FText), Length(FText));
  end;
  ms.Free;
end;

constructor TClipItem.Create;
begin
  ID := -1;
  Name := '';          
  UsedCount := 0;
  CreatedDate := Now;  
  UpdatedDate := Now;
  UsedDate    := Now;
  Lock := False;
  FPngImage := TPNGObject.Create;
//  FClipData := TMemoryStream.Create;
end;

destructor TClipItem.Destroy;
begin
  FPngImage.Free;
//  FClipData.Free;
  inherited;
end;

function TClipItem.SaveToImage(FileName: string; dif: TDropImgFormat): Boolean;
var bmp: TBitmap; jpg: TJPEGImage;
begin
  Result := False;
  if ClipMode <> cmImage then Exit;
  case dif of
    difBmp:begin
      bmp := TBitmap.Create;
      try
        bmp.Assign(PngImage);
        bmp.SaveToFile(FileName);
      finally
        bmp.Free;
      end;
    end;
    difJpg: begin
      bmp := TBitmap.Create;
      jpg := TJPEGImage.Create;
      try
        bmp.Assign(PngImage);
        jpg.Assign(bmp);
        jpg.SaveToFile(FileName);
      finally
        jpg.Free;
        bmp.Free;
      end;
    end;
    else PngImage.SaveToFile(FileName);
  end;
  Result := True;
end;

function TClipItem.SaveToText(FileName: string): Boolean;
var sl: TStringList;
begin
  Result := False;
  if ClipMode = cmImage then Exit;
  sl := TStringList.Create;
  try
    sl.Text := Self.Text;
    sl.SaveToFile(FileName);
    Result := True;
  finally
    sl.Free;
  end;
end;

procedure TClipItem.SetClipMode(const Value: TClipMode);
begin
  FClipMode := Value;
end;

procedure TClipItem.SetCreatedDate(const Value: TDateTime);
begin
  FCreatedDate := Value;
end;

//procedure TClipItem.SetClipData(const Value: TMemoryStream);
//begin
//  FClipData.CopyFrom(Value, Value.Size);
//end;

procedure TClipItem.SetHash(const Value: string);
begin
  FHash := Value;
end;

procedure TClipItem.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TClipItem.SetLock(const Value: Boolean);
begin
  FLock := Value;
end;

procedure TClipItem.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TClipItem.SetPngImage(const Value: TPNGObject);
begin
  FPngImage.Assign(Value);
end;

procedure TClipItem.SetText(const Value: string);
begin
  FText := Value;
end;

procedure TClipItem.SetUpdatedDate(const Value: TDateTime);
begin
  FUpdatedDate := Value;
end;

procedure TClipItem.SetUsedCount(const Value: Cardinal);
begin
  FUsedCount := Value;
end;

procedure TClipItem.SetUsedDate(const Value: TDateTime);
begin
  FUsedDate := Value;
end;

procedure TClipItem.ToClipBoard;
var
  MyFormat : Word;
  AData : THandle;
  APalette: HPALETTE;
  bmp: TBitmap;
begin
  if ClipMode = cmImage then begin
    bmp := TBitmap.Create;
    bmp.Assign(PngImage);
    bmp.SaveToClipboardFormat(MyFormat, AData, APalette);
    Clipboard.SetAsHandle(MyFormat, AData);
    bmp.Free;
  end else begin
    try
      Clipboard.AsText := Text;
      SimpleClipForm.Option.PlaySound;
    except

    end;
  end;
end;

procedure TClipItem.Paste(Text: string);
//var
//  h: HWND;
//  ThreadID1, ThreadID2: Cardinal;
//  Buf: ^DWORD;
//  st, en: Integer;
var IsCtrl: Boolean;
begin      
//  if Clipboard.AsText = '' then begin
//    SimpleClipForm.Option.PlaySound;
//    Exit;
//  end;
//  SendMessage(h_fourcus_ctrl, EM_GETSEL, Integer(@st), Integer(@en));

//  Buf := GetMemory(SizeOf(DWORD));
//  //現在ユーザーが作業しているウィンドウを取得
//  h := GetForegroundWindow;
//  //フォアグラウンドウィンドウを作成したスレッドのIDを取得
//  ThreadID1 := GetWindowThreadProcessId(h);
//  //目的のウィンドウを作成したスレッドのIDを取得
//  ThreadID2 := GetCurrentThreadId;
//  //現在の入力状態を目的のスレッドにアタッチ
//  AttachThreadInput(ThreadID1, ThreadID2, True);
//  //現在の[フォアグラウンド ロック タイムアウト]の設定を取得
//  SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, Buf, 0);
//  //設定を 0ms に変更
//  SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, nil, 0);

//  h := GetAncestor(h_foreground_wnd, GA_ROOT);
  if not IsWindow(h_foreground_wnd) then Exit;
  IsCtrl :=(GetKeyState(VK_CONTROL) and (1 shl 15))<>0;
  (SetForegroundWindow(h_foreground_wnd));
  Application.ProcessMessages;
  Sleep(200);

//  //設定を元に戻して…
//  SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, Buf, 0);
//  //デタッチしておしまい
//  AttachThreadInput(ThreadID2, ThreadID1, False);
//  FreeMemory(Buf);
//  beep;

//  SendMessage(h_fourcus_ctrl, EM_SETSEL, st, en);


//  SendMessage(h_fourcus_ctrl, EM_GETSEL, Integer(@ss2), Integer(@se2));
//  DOutI(ss1);
//  DOutI(ss2);
//  DOutB(ss1 = ss2);
//
//  DOutI(se1);
//  DOutI(se2);
//  DOutB(se1 = se2);
//  DOut('-----------');
  if Text = '' then begin
    ToClipBoard;
  end else begin
    try
      Clipboard.AsText := Text;
      SimpleClipForm.Option.PlaySound;
    except

    end;
  end;
  Application.ProcessMessages;
  Sleep(100);
//  keybd_event(VK_SHIFT,0,0,0);
//  keybd_event(VK_SHIFT,0,KEYEVENTF_KEYUP,0);

  keybd_event(VK_CONTROL,0,0,0);
  keybd_event(Ord('V'),0,0,0);
  keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
  keybd_event(VK_CONTROL,0,KEYEVENTF_KEYUP,0);

//  keybd_event(VK_SHIFT,0,0,0);
  Sleep(10);
  if IsCtrl then begin
//    IsCtrl :=(GetKeyState(VK_CONTROL) and (1 shl 15))<>0;
//    if IsCtrl then begin
//      keybd_event(VK_CONTROL,0,0,0);
//      keybd_event(VK_CONTROL,0,KEYEVENTF_KEYUP,0);
//    end;

    Application.ProcessMessages;
    Sleep(250);
    SetForegroundWindow(h_form_wnd);
    Application.ProcessMessages;
    Sleep(10);
                
//    IsCtrl :=(GetKeyState(VK_CONTROL) and (1 shl 15))<>0;
//    if IsCtrl then begin
//      keybd_event(VK_CONTROL,0,0,0);
//    end else begin                   
//      keybd_event(VK_CONTROL,0,0,0);
//      keybd_event(VK_CONTROL,0,KEYEVENTF_KEYUP,0);
//    end;
  end;

end;


procedure TClipItem.Assign(ci: TClipItem);
begin
  FID := ci.ID;
  FName := ci.FName;
  FClipMode := ci.ClipMode;
  FUsedCount := ci.UsedCount;
  FCreatedDate := ci.CreatedDate;
  FUpdatedDate := ci.UpdatedDate;
  FUsedDate := ci.UsedDate;
  FLock := ci.Lock;
  FText := ci.Text;
  FPngImage.Assign(ci.PngImage);
  FHash := ci.Hash;
end;

{ TWebSearchItem }

constructor TWebSearchItem.Create;
begin
  FUrlTop := '';
  FUrlBottom := '';
  FEncode := eNone;
end;

procedure TWebSearchItem.Excute;
begin
  if FBrowser <> '' then begin
    ShellExecute(Application.Handle, 'open', PChar(Browser), PChar(GetUrl), nil, SW_SHOWNORMAL);
  end else begin
    ShellExecute(Application.Handle, 'open', PChar(GetUrl), nil, nil, SW_SHOWNORMAL);
  end;
end;

function TWebSearchItem.GetUrl: String;
var s: String;
begin
  case FEncode of
    eUrl:  s := HTTPEncode(FKeyword);
    eUtf8: s := HTTPEncode(UTF8Encode(FKeyword));
    eEuc:  s := HTTPEncode(sjis2euc(FKeyword));
    else s := FKeyword;
  end;
  Result := FUrlTop + s + FUrlBottom;
end;

procedure TWebSearchItem.SetBrowser(const Value: string);
begin
  FBrowser := Value;
end;

procedure TWebSearchItem.SetEncode(const Value: TEncode);
begin
  FEncode := Value;
end;

procedure TWebSearchItem.SetKeyword(const Value: string);
begin
  FKeyword := Value;
end;

procedure TWebSearchItem.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TWebSearchItem.SetUrlBottom(const Value: string);
begin
  FUrlBottom := Value;
end;

procedure TWebSearchItem.SetUrlTop(const Value: string);
begin
  FUrlTop := Value;
end;

//var ini: TExtIniFile; s: string;

initialization
begin
  //public var
  db_set_file := ChangeFileExt(ParamStr(0), '.sqlite');
  db_file := ChangeFileExt(ParamStr(0), '.db');
  temp_dir_path := ExtractFilePath(ParamStr(0)) + 'temp\';
  sound_dir_path := ExtractFilePath(ParamStr(0)) + 'sound\';
  sound_file := sound_dir_path + 'click.wav';
  bmp_dir_path := ExtractFilePath(ParamStr(0)) + 'img\';
  bmp_file := bmp_dir_path + 'click.wav';
  //make dir and file
  if not FileExists(db_file) then
    CopyFile(PChar(db_set_file), PChar(db_file), True);
  if not FileExists(temp_dir_path) then
    ForceDirectories(temp_dir_path);
  if not FileExists(sound_dir_path) then
    ForceDirectories(sound_dir_path);      
  if not FileExists(bmp_dir_path) then
    ForceDirectories(bmp_dir_path);

//  ini := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
//  try
//    s := ini.ReadString('Initialization', 'DataFile', '');
//    if s <> '' then begin
//      db_file := s;
//    end;
//  finally
//    ini.Free;
//  end;
    
//  ini := TExtIniFile.Create(nil);
//  try
//    ini.FileName := ChangeFileExt(ParamStr(0), '.ini');
//    s := ini.ReadStr('Initialization', 'DataFile', '');
//    if s <> '' then begin
//      db_file := s;
//    end;
//  finally
//    ini.Free;
//  end;

  TheDB := TSQLiteDatabase.Create(db_file);
end;

finalization
begin
//  ini := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
//  try
//    ini.WriteString('Initialization', 'DataFile', db_file);
//  finally
//    ini.Free;
//  end;
            
//  ini := TExtIniFile.Create(nil);
//  try
//    ini.FileName := ChangeFileExt(ParamStr(0), '.ini');
//    ini.WriteStr('Initialization', 'DataFile', db_file);
//    ini.Update;
//  finally
//    ini.Free;
//  end;

  DeleteDir(temp_dir_path, False);
  TheDB.Free;
end;

end.
