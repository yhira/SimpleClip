unit Option;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls, Spin, HotKeyEdit, CommModules, Dialogs,
  ExtDlgs;

type
  TOptionDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    PageControl: TPageControl;
    CallTabSheet: TTabSheet;
    TextTabSheet: TTabSheet;
    ImageTabSheet: TTabSheet;
    BasicTabSheet: TTabSheet;
    FileTabSheet: TTabSheet;
    Label1: TLabel;
    HistoryCountSpinEdit: TSpinEdit;
    NameModeRadioGroup: TRadioGroup;
    IsDblClickExecCheckBox: TCheckBox;
    IsMinimizCheckBox: TCheckBox;
    DropImgFormatRadioGroup: TRadioGroup;
    HotKeyEdit: THotKeyEdit;
    HotkeyClearButton: TButton;
    TextEexeActionRadioGroup: TRadioGroup;
    ImageEexeActionRadioGroup: TRadioGroup;
    DropEexeActionRadioGroup: TRadioGroup;
    CallKeyPressRadioGroup: TRadioGroup;
    CallMouseActionRadioGroup: TRadioGroup;
    IsCallMousePosCheckBox: TCheckBox;
    IsTextExclusionCheckBox: TCheckBox;
    IsImageExclusionCheckBox: TCheckBox;
    IsDropExclusionCheckBox: TCheckBox;
    SoundGroupBox: TGroupBox;
    IsSoundCheckBox: TCheckBox;
    SoundFileEdit: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    TreeFontDialog: TFontDialog;
    DesignTabSheet: TTabSheet;
    HintTabSheet: TTabSheet;
    TreeFontButton: TButton;
    TreeColorColorBox: TColorBox;
    IsHotTrackCheckBox: TCheckBox;
    HintFontButton: TButton;
    HintColorColorBox: TColorBox;
    HintFontDialog: TFontDialog;
    HintWidthSpinEdit: TSpinEdit;
    HintFontColorColorBox: TColorBox;
    IsShowHintCheckBox: TCheckBox;
    IsZoomImageCheckBox: TCheckBox;
    TreeIconGroupBox: TGroupBox;
    IsShowIconCheckBox: TCheckBox;
    IconBmpFileEdit: TEdit;
    SpeedButton2: TSpeedButton;
    OpenDialog2: TOpenPictureDialog;
    Panel1: TPanel;
    IsHideFormCheckBox: TCheckBox;
    IsClearListCheckBox: TCheckBox;
    IsHideWhenExeCheckBox: TCheckBox;
    IsClearImageCheckBox: TCheckBox;
    IsDelAfterSavedImgCheckBox: TCheckBox;
    IsIgnoreWhenHideCheckBox: TCheckBox;
    IsKeepImgSizeHintCheckBox: TCheckBox;
    HistoryRangeLabel: TLabel;
    IsItemSortCheckBox: TCheckBox;
    procedure HotkeyClearButtonClick(Sender: TObject);
    procedure CallKeyPressRadioGroupClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TreeFontButtonClick(Sender: TObject);
    procedure HintFontButtonClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IsClearListCheckBoxClick(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  OptionDlg: TOptionDlg;

implementation

{$R *.dfm}

procedure TOptionDlg.HotkeyClearButtonClick(Sender: TObject);
begin
  HotKeyEdit.Clear;
end;

procedure TOptionDlg.CallKeyPressRadioGroupClick(Sender: TObject);
begin
  HotKeyEdit.Enabled := CallKeyPressRadioGroup.ItemIndex = Ord(ckpHotkey);
  HotkeyClearButton.Enabled := HotKeyEdit.Enabled;
//  if (GetForegroundWindow = Self.Handle) and
//    (CallKeyPressRadioGroup.ItemIndex = Ord(ckpHotkey)) then begin
//    HotKeyEdit.SetFocus;
//  end;
end;

procedure TOptionDlg.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.InitialDir := sound_dir_path;
  if OpenDialog1.Execute then begin
    SoundFileEdit.Text := OpenDialog1.FileName;
  end;
end;

procedure TOptionDlg.TreeFontButtonClick(Sender: TObject);
begin
  TreeFontDialog.Execute;
end;

procedure TOptionDlg.HintFontButtonClick(Sender: TObject);
begin
  HintFontDialog.Execute;
end;

procedure TOptionDlg.SpeedButton2Click(Sender: TObject);
begin
  OpenDialog2.InitialDir := bmp_dir_path;
  if OpenDialog2.Execute then begin
    IconBmpFileEdit.Text := OpenDialog2.FileName;
  end;
end;

procedure TOptionDlg.FormShow(Sender: TObject);
begin
  IsClearImageCheckBox.Enabled := not IsClearListCheckBox.Checked;
end;

procedure TOptionDlg.IsClearListCheckBoxClick(Sender: TObject);
begin
  IsClearImageCheckBox.Enabled := not IsClearListCheckBox.Checked;
end;

end.
