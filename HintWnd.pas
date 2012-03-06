unit HintWnd;

interface

uses
  Windows, Graphics, CommModules, Controls, Classes, SysUtils, Types,
  pngimage, Messages, Dbg, Forms;

type
  THintWindowEx = class(THintWindow)
  private
//    FBitmap: TBitmap;
    FText: string;
    FPng: TPNGObject;
    procedure SetText(const Value: string);
    procedure SetPng(const Value: TPNGObject);
  protected
    procedure Paint; override;
    procedure WndProc(var Message: TMessage); override;
    procedure CMMouseleave(var Message: TMessage); message CM_MOUSELEAVE;
  public
    procedure Clear;
    procedure ShowImage(r: TRect);
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
//    property Bitmap: TBitmap read FBitmap write FBitmap;
    property Png: TPNGObject read FPng write SetPng;
    property Text: string read FText write SetText;
  end;


implementation

uses Main;

{ THintWindowEx }

procedure THintWindowEx.Clear;
begin
  FPng.Free;
  FPng := TPNGObject.Create;
//  FBitmap.Free;
//  FBitmap := TBitmap.Create;
end;

constructor THintWindowEx.Create(AOwner: TComponent);
begin
  inherited;
//  FBitmap := TBitmap.Create;
  FPng := TPNGObject.Create;
end;

destructor THintWindowEx.Destroy;
begin
//  FBitmap.Free;
  FPng.Free;
  inherited;
end;

procedure THintWindowEx.Paint;
//var png: TPNGObject;
begin
  inherited;
  if Png.Width <> 0 then begin
//    png := TPNGObject.Create;
//    png.Assign(Bitmap);
    Canvas.StretchDraw(Bounds(5, 5, ClientWidth-10, ClientHeight-10), png);
//    png.Free;
  end;
end;

procedure THintWindowEx.ShowImage(r: TRect);
begin
//  r := Rect(0, 0, Bitmap.Width, Bitmap.Height);
  ActivateHint(r, '');
end;

procedure THintWindowEx.SetText(const Value: string);
begin
  FText := Value;
end;

procedure THintWindowEx.SetPng(const Value: TPNGObject);
begin
  FPng.Assign(Value);
end;


procedure THintWindowEx.WndProc(var Message: TMessage);
var p, mp: TPoint; dr: TRect;
begin
//  inherited;
  if Message.Msg = WM_NCHITTEST then begin   //doutb(once_hittest);
    if once_hittest then Exit;
    RecreateWnd;
    once_hittest := True;
//     beep;
//    GetCursorPos(p);
//    with SimpleClipForm do begin
////      DOutI(TheTreeView.Selected.Index);
//      dr := TheTreeView.Selected.DisplayRect(False);
//      mp := TheTreeView.ClientToScreen(Point((dr.Right-dr.Left) div 2, dr.Bottom-(dr.Bottom-dr.Top) div 2));
//      SetCursorPos(mp.X, mp.Y);
//      Sleep(50);
//      SetCursorPos(p.X, p.Y);
//    end;
//    Application.ActivateHint(point(SimpleClipForm.Left + SimpleClipForm.Width,SimpleClipForm.Top));
//    SimpleClipForm.TheTreeView.Perform(Message.Msg, Message.WParam, Message.LParam);
//    ReleaseHandle;
      //  ReleaseHandle;
//    Application.ProcessMessages;
//    SimpleClipForm.TheTreeView.SetFocus;
  end;
  inherited;
//  DOut(IntToHex(Message.Msg, 4));
end;

procedure THintWindowEx.CMMouseleave(var Message: TMessage);
begin
  ReleaseHandle;
end;

end.
