unit Memo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, OleCtrls, ActnList, MSScriptControl_TLB, ActiveX,
  Clipbrd, StdActns, Variants,  Dbg, HEditor, hOleddEditor, EditorEx,
  SonEdit;

type
  TMemoForm = class(TForm)
    MainMenu1: TMainMenu;
    ScriptMenu: TMenuItem;
    ScriptControl: TScriptControl;
    N1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Undo1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    N5: TMenuItem;
    ActionList1: TActionList;
    EditUndo1: TEditUndo;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditDelete1: TEditDelete;
    EditSelectAll1: TEditSelectAll;
    D1: TMenuItem;
    N2: TMenuItem;
    A1: TMenuItem;
    Memo1: TSonEdit;
    WordWrapMenu: TMenuItem;
    WordWrapAction: TAction;
    procedure ScriptMenuClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditUndo1Execute(Sender: TObject);
    procedure EditCut1Execute(Sender: TObject);
    procedure EditCopy1Execute(Sender: TObject);
    procedure EditPaste1Execute(Sender: TObject);
    procedure EditDelete1Execute(Sender: TObject);
    procedure EditSelectAll1Execute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure Memo1DblClick(Sender: TObject);
    procedure WordWrapActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private �錾 }
  public
    { Public �錾 }
  end;

var
  MemoForm: TMemoForm;

implementation

{$R *.dfm}

uses Main;

procedure TMemoForm.ScriptMenuClick(Sender: TObject);
var s, sp, txt: string; sl: TStringList;
  Params : PSafeArray;
  v : Variant;
  ReturnValue: Variant;
  IsSelect: Boolean;
  sStr, sLen: Integer;
begin
  s := TMenuItem(Sender).Caption;
  sp := SimpleClipForm.TextScriptsDirPath + s;
  sl := TStringList.Create;
  IsSelect := Pos('#', s) = 1;
//  sStr := Memo1.SelStart;
//  sLen := Memo1.SelLength;
//  DOut(Memo1.SelText);
  try
    v := VarArrayCreate([0, 0], varVariant);
    if IsSelect then begin
      v[0] := Memo1.SelText;
    end else begin
      v[0] := Memo1.Text;
    end;
    

    Params := PSafeArray(TVarData(v).VArray);

    if ExtractFileExt(sp) = '.vbs' then begin
      ScriptControl.Language := 'VBScript';
    end else begin
      ScriptControl.Language := 'JavaScript';
    end;
    sl.LoadFromFile(sp);
    ScriptControl.AddCode(sl.Text);
    ReturnValue := ScriptControl.Run('EditText', Params);
    
    if IsSelect then begin
      Memo1.SelText := ReturnValue;
    end else begin
      Memo1.Text := ReturnValue;
    end;
    Memo1.SetFocus;   
//    Memo1.SelStart := sStr;
//    Memo1.SelLength := sLen;
  finally
    sl.Free;
  end;
end;

procedure TMemoForm.N1Click(Sender: TObject);
begin
  try
    Clipboard.AsText := Memo1.Text;
  except

  end;
end;

procedure TMemoForm.Button1Click(Sender: TObject);
begin
//  Memo1.Font.Name := '�l�r �S�V�b�N';
  ShowMessage(Memo1.Font.Name);
//  Memo1.Invalidate;
end;

procedure TMemoForm.EditUndo1Execute(Sender: TObject);
begin
  Memo1.Undo;
end;

procedure TMemoForm.EditCut1Execute(Sender: TObject);
begin
  Memo1.Cut;
end;

procedure TMemoForm.EditCopy1Execute(Sender: TObject);
begin
  Memo1.CopyToClipboard;
end;

procedure TMemoForm.EditPaste1Execute(Sender: TObject);
begin
  Memo1.Paste;
end;

procedure TMemoForm.EditDelete1Execute(Sender: TObject);
begin
  Memo1.SelText := '';
end;

procedure TMemoForm.EditSelectAll1Execute(Sender: TObject);
begin
  Memo1.SelectAll;
end;

procedure TMemoForm.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
var IsSel: Boolean;
begin
  IsSel := Memo1.Selmode;
  EditUndo1.Enabled := Memo1.Modified;
  EditCut1.Enabled := IsSel;    
  EditCopy1.Enabled := IsSel;
  EditDelete1.Enabled := IsSel;
  EditPaste1.Enabled := Clipboard.AsText <> '';
end;

procedure TMemoForm.Memo1DblClick(Sender: TObject);
begin
  Memo1.WordSel;
end;

procedure TMemoForm.WordWrapActionExecute(Sender: TObject);
begin
  Memo1.WordWrap := not Memo1.WordWrap;
end;

procedure TMemoForm.FormShow(Sender: TObject);
begin
  Memo1.WordWrap := WordWrapAction.Checked;
end;

procedure TMemoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  with SimpleClipForm do begin
//    TheIniFile.WriteInt('MemoForm', 'Column', MemoForm.Memo1.Column);              
//    TheIniFile.WriteBool('MemoForm', 'AutoWrap', MemoForm.Memo1.AutoWrap);
//    TheIniFile.WriteBool('MemoForm', 'WordWrap', MemoForm.WordWrapAction.Checked);
//    TheIniFile.WriteFont('MemoForm', 'Font', MemoForm.Memo1.Font);
//    TheIniFile.WriteColor('MemoForm', 'BkColor', MemoForm.Memo1.Color);
//    TheIniFile.WriteForm2('MemoForm', MemoForm);
//  end;
//  Action := caFree;
//  MemoForm := nil;
end;

procedure TMemoForm.FormCreate(Sender: TObject);
begin
  Width := 400;
  Height := 300;
end;

procedure TMemoForm.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//
end;

procedure TMemoForm.Memo1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//
end;

end.

