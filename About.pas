unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ShellAPI, DateUtils, CommModules, yhFiles;

type
  TAboutForm = class(TForm)
    VersionLabel: TLabel;
    URLLabel: TLabel;
    CopyRightLabel: TLabel;
    TitleLabel: TLabel;
    DbLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure URLLabelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure URLLabelMouseLeave(Sender: TObject);
    procedure URLLabelClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  AboutForm: TAboutForm;

implementation


{$R *.dfm}


procedure TAboutForm.FormCreate(Sender: TObject);
begin
  TitleLabel.Caption := Application.Title;
  VersionLabel.Caption := GetFileVersion(Application.ExeName);
  CopyRightLabel.Caption := 'Copyright (C) 2010-' + IntToStr(YearOf(now)) + ' yhira';
  URLLabel.Caption := 'http://netakiri.net/';
  DbLabel.Caption := ExtractFileName(db_file);
end;

procedure TAboutForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	Close;
end;

procedure TAboutForm.URLLabelMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  with URLLabel do begin
    Font.Style := [fsUnderline];
    Cursor := crHandPoint;
    Font.Color := clRed;
  end;
end;

procedure TAboutForm.URLLabelMouseLeave(Sender: TObject);
begin
  with URLLabel do begin
    Font.Style := [];
    Cursor := crDefault;  
    Font.Color := clBlue;
  end;
end;

procedure TAboutForm.URLLabelClick(Sender: TObject);
begin
  with URLLabel do
  begin
    ShellExecute(Application.Handle,
                 PChar('open'), PChar(Caption),
                 PChar(0), nil, SW_NORMAL);
  end;
end;

procedure TAboutForm.FormClick(Sender: TObject);
begin
  Close;
end;

end.

