program SimpleClip;

{%ToDo 'SimpleClip.todo'}

uses
  FastMM4,
  FastMove,
  FastCode,
  Forms,
  Windows,
  Messages,
  Main in 'Main.pas' {SimpleClipForm},
  CommModules in 'CommModules.pas',
  OptionObject in 'OptionObject.pas',
  Helper in 'Helper.pas',
  Option in 'Option.pas' {OptionDlg},
  HintWnd in 'HintWnd.pas',
  About in 'About.pas' {AboutForm},
  Memo in 'Memo.pas' {MemoForm},
  yhFiles in 'yhFiles.pas';

{$R *.res}

const SIMPLECLIP_MUTEX_NAME = 'SimpleClip_c1qr5qrkxrsppj2';
var
  hMutex, hWind, hOwner: HWND;
begin    
  //２分経つまで待機
  while GetTickCount < 90000 do begin
    //Exit;  //起動を止めるときはコメントをを外す
    Sleep(1000);
  end;

  hMutex := OpenMutex(MUTEX_ALL_ACCESS, False, SIMPLECLIP_MUTEX_NAME);
  if (hMutex <> 0)  then begin
    CloseHandle(hMutex);
    //先に起動しているこのプログラムのウィンドウハンドルとオーナーウィンドウのハンドルを取得
    hWind := FindWindow('TSimpleClipForm', 'SimpleClip');
    hOwner := GetWindow(hWind, GW_OWNER);
    if (IsIconic(hOwner)) then begin
      //最小化されていたら元のサイズに戻す
      SendMessage(hOwner, WM_SYSCOMMAND, SC_RESTORE,-1);
    end else begin
      //前面に移動させる
      SetForegroundWindow(hWind);
    end;
    Exit;
  end;
  CreateMutex(nil, False, SIMPLECLIP_MUTEX_NAME);
                      
  h_foreground_wnd := GetForegroundWindow;
  
  SetWindowLong(Application.Handle, GWL_EXSTYLE,
        GetWindowLong(Application.Handle, GWL_EXSTYLE) Or WS_EX_TOOLWINDOW);

  Application.Initialize;
  Application.Title := 'SimpleClip';
  Application.ShowHint := True;
  Application.CreateForm(TSimpleClipForm, SimpleClipForm);
  Application.Run;
end.
