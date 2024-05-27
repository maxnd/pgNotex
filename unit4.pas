// ***********************************************************************
// ***********************************************************************
// pgNotex 1.x
// Author and copyright: Massimo Nardello, Modena (Italy) 2020-2024.
// Free software released under GPL licence version 3 or later.

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version. You can read the version 3
// of the Licence in http://www.gnu.org/licenses/gpl-3.0.txt
// or in the file Licence.txt included in the files of the
// source code of this software.
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
// ***********************************************************************
// ***********************************************************************

unit Unit4;

{$mode objfpc}{$H+}
{$modeswitch objectivec1}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, Menus, LazUTF8, CocoaAll, CocoaUtils, translate;

type

  { TfmOptions }

  TfmOptions = class(TForm)
    bnClose: TButton;
    bnStFontColorDef: TButton;
    bnStFontColorMod: TButton;
    bnStFontTitle1ColorMod: TButton;
    bnStFontTitle2ColorMod: TButton;
    bnStFontMarkerColorMod: TButton;
    cbNumTitles: TCheckBox;
    cbAutosave: TCheckBox;
    edPanOptions: TEdit;
    edPanTemplate: TEdit;
    edPanOutput: TEdit;
    edPanPath: TEdit;
    edLineSpacing: TEdit;
    edLineSpacingLess: TButton;
    edStSizePlus: TButton;
    edStSizeLess: TButton;
    edMaxSize: TEdit;
    edLineSpacingPlus: TButton;
    edParSpacing: TEdit;
    edParSpacingLess: TButton;
    edStSizeTitlesPlus: TButton;
    edStSizeTitlesLess: TButton;
    cbStFonts: TComboBox;
    cdColorDialog: TColorDialog;
    edFBLibPath: TEdit;
    edServer: TEdit;
    edPort: TEdit;
    edStSize: TEdit;
    edStSizeTitles: TEdit;
    edParSpacingPlus: TButton;
    lbFBLibPath: TLabel;
    lbPanOptions: TLabel;
    lbPanTemplate: TLabel;
    lbPanOutput: TLabel;
    lbPanPath: TLabel;
    lbPort: TLabel;
    lbServer: TLabel;
    lbStSize: TLabel;
    lbLineSpacing: TLabel;
    lbStSizeTitles: TLabel;
    lbMaxSize: TLabel;
    lbParSpacing: TLabel;
    lnStFonts: TLabel;
    mmMenuModal: TMainMenu;
    procedure bnCloseClick(Sender: TObject);
    procedure bnStFontColorDefClick(Sender: TObject);
    procedure bnStFontColorModClick(Sender: TObject);
    procedure bnStFontTitle1ColorModClick(Sender: TObject);
    procedure bnStFontTitle2ColorModClick(Sender: TObject);
    procedure bnStFontMarkerColorModClick(Sender: TObject);
    procedure cbAutosaveClick(Sender: TObject);
    procedure cbNumTitlesClick(Sender: TObject);
    procedure cbStFontsChange(Sender: TObject);
    procedure edLineSpacingLessClick(Sender: TObject);
    procedure edLineSpacingPlusClick(Sender: TObject);
    procedure edMaxSizeChange(Sender: TObject);
    procedure edMaxSizeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure edParSpacingLessClick(Sender: TObject);
    procedure edParSpacingPlusClick(Sender: TObject);
    procedure edStSizeLessClick(Sender: TObject);
    procedure edStSizePlusClick(Sender: TObject);
    procedure edStSizeTitlesLessClick(Sender: TObject);
    procedure edStSizeTitlesPlusClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fmOptions: TfmOptions;

implementation

uses Unit1;

  {$R *.lfm}


  { TfmOptions }

procedure TfmOptions.FormCreate(Sender: TObject);
var
  fm: NSFontManager;
  fd: NSFontDescriptor;
  FontFamilies: NSArray;
  i: integer;
begin
  if LowerCase(UTF8Copy(NSStringToString(
    NSLocale.preferredLanguages.objectAtIndex(0)), 1, 2)) = 'it' then
  begin
    translate.TranslateTo('pgnotex.it');
  end;
  fm := NSFontManager.sharedFontManager;
  FontFamilies := fm.availableFontFamilies;
  for i := 0 to FontFamilies.Count - 1 do
  begin
    fd := fmMain.FindFont(NSStringToString(
      FontFamilies.objectAtIndex(i).description), 0);
    if NSStringToString(fd.fontAttributes.description) <> '' then
    begin
      cbStFonts.Items.Add(NSStringToString(FontFamilies.objectAtIndex(
        i).description));
    end;
    if IsPaintDark = False then
    begin
      lnStFonts.Font.Color := $001ABC0F;
      lbStSize.Font.Color := $001ABC0F;
      lbStSizeTitles.Font.Color := $001ABC0F;
      lbMaxSize.Font.Color := $001ABC0F;
      lbLineSpacing.Font.Color := $001ABC0F;
      lbParSpacing.Font.Color := $001ABC0F;
      lbFBLibPath.Font.Color := $001ABC0F;
      lbServer.Font.Color := $001ABC0F;
      lbPort.Font.Color := $001ABC0F;
      lbPanOptions.Font.Color := $001ABC0F;
      lbPanTemplate.Font.Color := $001ABC0F;
      lbPanOutput.Font.Color := $001ABC0F;
      lbPanPath.Font.Color := $001ABC0F;
      cbNumTitles.Font.Color := $001ABC0F;
      cbAutosave.Font.Color := $001ABC0F;
      fmOptions.Color := clWhite;
    end
    else
    begin
      lnStFonts.Font.Color := $0040B5F0;
      lbStSize.Font.Color := $0040B5F0;
      lbStSizeTitles.Font.Color := $0040B5F0;
      lbMaxSize.Font.Color := $0040B5F0;
      lbLineSpacing.Font.Color := $0040B5F0;
      lbParSpacing.Font.Color := $0040B5F0;
      lbFBLibPath.Font.Color := $0040B5F0;
      lbServer.Font.Color := $0040B5F0;
      lbPort.Font.Color := $0040B5F0;
      lbPanOptions.Font.Color := $0040B5F0;
      lbPanTemplate.Font.Color := $0040B5F0;
      lbPanOutput.Font.Color := $0040B5F0;
      lbPanPath.Font.Color := $0040B5F0;
      cbNumTitles.Font.Color := $0040B5F0;
      cbAutosave.Font.Color := $0040B5F0;
    end;
  end;
  cbStFonts.ItemIndex := 0;
end;

procedure TfmOptions.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = 27 then
  begin
    key := 0;
    Close;
  end;
end;

procedure TfmOptions.FormShow(Sender: TObject);
begin
  if fmMain.zcConnection.Connected = False then
  begin
    edFBLibPath.ReadOnly := False;
    edServer.ReadOnly := False;
    edPort.ReadOnly := False;
  end
  else
  begin
    edFBLibPath.ReadOnly := True;
    edServer.ReadOnly := True;
    edPort.ReadOnly := True;
  end;
  cbStFonts.ItemIndex := cbStFonts.Items.IndexOf(fmMain.dbText.Font.Name);
  edStSize.Text := IntToStr(fmMain.dbText.Font.Size);
  edStSizeTitles.Text := IntToStr(fmMain.sgTitles.Font.Size);
  edMaxSize.Text := IntToStr(iMaxSize);
  edLineSpacing.Text := IntToStr(iLineSpacing);
  edParSpacing.Text := IntToStr(iParSpacing);
  edFBLibPath.Text := fmMain.zcConnection.LibraryLocation;
  edServer.Text := fmMain.zcConnection.HostName;
  edPort.Text := IntToStr(fmMain.zcConnection.Port);
  cbNumTitles.Checked := blNumTitles;
  cbAutosave.Checked := blAutosave;
  edPanOptions.Text := pandocOptions;
  edPanTemplate.Text := pandocTemplate;
  edPanOutput.Text := pandocOutput;
  edPanPath.Text := pandocPath;
end;

procedure TfmOptions.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  with fmMain do
  begin
    if zcConnection.Connected = False then
    begin
      fmMain.zcConnection.LibraryLocation := edFBLibPath.Text;
      zcConnection.HostName := edServer.Text;
      zcConnection.Port := StrToInt(edPort.Text);
    end;
  end;
  pandocOptions := edPanOptions.Text;
  pandocTemplate := edPanTemplate.Text;
  pandocOutput := edPanOutput.Text;
  pandocPath := edPanPath.Text;
end;

procedure TfmOptions.cbStFontsChange(Sender: TObject);
begin
  fmMain.dbText.Font.Name := cbStFonts.Text;
  fmMain.sgTitles.Font.Name := cbStFonts.Text;
  if fmMain.pnMain.Visible = True then
  begin
    fmMain.FormatListTitles(False, True);
  end;
end;

procedure TfmOptions.edMaxSizeChange(Sender: TObject);
begin
  if edMaxSize.Text = '' then
  begin
    edMaxSize.Text := '1';
  end;
  iMaxSize := StrToInt(edMaxSize.Text);
end;

procedure TfmOptions.edMaxSizeKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  if not (key in [Ord('0'), Ord('1'), Ord('2'), Ord('3'), Ord('4'),
    Ord('5'), Ord('6'), Ord('7'), Ord('8'), Ord('9'), 8, 9, 37, 39]) then
  begin
    key := 0;
  end;
end;

procedure TfmOptions.edStSizeLessClick(Sender: TObject);
begin
  if StrToInt(edStSize.Text) > 7 then
  begin
    edStSize.Text := IntToStr(StrToInt(edStSize.Text) - 1);
    fmMain.dbText.Font.Size := StrToInt(edStSize.Text);
    if fmMain.pnMain.Visible = True then
    begin
      fmMain.FormatListTitles(False, True);
    end;
  end;
end;

procedure TfmOptions.edStSizePlusClick(Sender: TObject);
begin
  if StrToInt(edStSize.Text) < 256 then
  begin
    edStSize.Text := IntToStr(StrToInt(edStSize.Text) + 1);
    fmMain.dbText.Font.Size := StrToInt(edStSize.Text);
    if fmMain.pnMain.Visible = True then
    begin
      fmMain.FormatListTitles(False, True);
    end;
  end;
end;

procedure TfmOptions.edStSizeTitlesLessClick(Sender: TObject);
begin
  if StrToInt(edStSizeTitles.Text) > 7 then
  begin
    edStSizeTitles.Text := IntToStr(StrToInt(edStSizeTitles.Text) - 1);
    fmMain.sgTitles.Font.Size := StrToInt(edStSizeTitles.Text);
  end;
end;

procedure TfmOptions.edStSizeTitlesPlusClick(Sender: TObject);
begin
  if StrToInt(edStSizeTitles.Text) < 256 then
  begin
    edStSizeTitles.Text := IntToStr(StrToInt(edStSizeTitles.Text) + 1);
    fmMain.sgTitles.Font.Size := StrToInt(edStSizeTitles.Text);
  end;
end;

procedure TfmOptions.edLineSpacingLessClick(Sender: TObject);
begin
  if StrToInt(edLineSpacing.Text) > -10 then
  begin
    edLineSpacing.Text := IntToStr(StrToInt(edLineSpacing.Text) - 1);
    iLineSpacing := StrToInt(edLineSpacing.Text);
    if fmMain.pnMain.Visible = True then
    begin
      fmMain.FormatListTitles(False, True);
    end;
  end;
end;

procedure TfmOptions.edLineSpacingPlusClick(Sender: TObject);
begin
  if StrToInt(edLineSpacing.Text) < 30 then
  begin
    edLineSpacing.Text := IntToStr(StrToInt(edLineSpacing.Text) + 1);
    iLineSpacing := StrToInt(edLineSpacing.Text);
    if fmMain.pnMain.Visible = True then
    begin
      fmMain.FormatListTitles(False, True);
    end;
  end;
end;

procedure TfmOptions.edParSpacingLessClick(Sender: TObject);
begin
  if StrToInt(edParSpacing.Text) > 0 then
  begin
    edParSpacing.Text := IntToStr(StrToInt(edParSpacing.Text) - 1);
    iParSpacing := StrToInt(edParSpacing.Text);
    if fmMain.pnMain.Visible = True then
    begin
      fmMain.FormatListTitles(False, True);
    end;
  end;
end;

procedure TfmOptions.edParSpacingPlusClick(Sender: TObject);
begin
  if StrToInt(edParSpacing.Text) < 50 then
  begin
    edParSpacing.Text := IntToStr(StrToInt(edParSpacing.Text) + 1);
    iParSpacing := StrToInt(edParSpacing.Text);
    if fmMain.pnMain.Visible = True then
    begin
      fmMain.FormatListTitles(False, True);
    end;
  end;
end;

procedure TfmOptions.bnStFontColorDefClick(Sender: TObject);
begin
  if IsPaintDark = True then
  begin
    fmMain.dbText.Font.Color := clWhite;
    clTitle1 := clWhite;
    clTitle2 := clWhite;
    clMarker := clWhite;
  end
  else
  begin
    fmMain.dbText.Font.Color := clDefault;
    clTitle1 := clDefault;
    clTitle2 := clDefault;
    clMarker := clDefault;
  end;
  fmMain.sgTitles.Font.Color := clDefault;
end;

procedure TfmOptions.bnStFontColorModClick(Sender: TObject);
begin
  cdColorDialog.Color := fmMain.dbText.Font.Color;
  if cdColorDialog.Execute then
  begin
    fmMain.dbText.Font.Color := cdColorDialog.Color;
    if fmMain.pnMain.Visible = True then
    begin
      fmMain.FormatListTitles(False, True);
    end;
  end;
end;

procedure TfmOptions.bnStFontTitle1ColorModClick(Sender: TObject);
begin
  cdColorDialog.Color := clTitle1;
  if cdColorDialog.Execute then
  begin
    clTitle1 := cdColorDialog.Color;
    fmMain.sgTitles.Font.Color := clTitle1;
    if fmMain.pnMain.Visible = True then
    begin
      fmMain.FormatListTitles(False, True);
    end;
  end;
end;

procedure TfmOptions.bnStFontTitle2ColorModClick(Sender: TObject);
begin
  cdColorDialog.Color := clTitle2;
  if cdColorDialog.Execute then
  begin
    clTitle2 := cdColorDialog.Color;
    fmMain.sgTitles.Font.Color := clTitle2;
    if fmMain.pnMain.Visible = True then
    begin
      fmMain.FormatListTitles(False, True);
    end;
  end;
end;

procedure TfmOptions.bnStFontMarkerColorModClick(Sender: TObject);
begin
  cdColorDialog.Color := clMarker;
  if cdColorDialog.Execute then
  begin
    clMarker := cdColorDialog.Color;
    fmMain.sgTitles.Font.Color := clMarker;
    if fmMain.pnMain.Visible = True then
    begin
      fmMain.FormatListTitles(False, True);
    end;
  end;
end;

procedure TfmOptions.cbAutosaveClick(Sender: TObject);
begin
  blAutosave := cbAutosave.Checked;
  fmMain.tmAutosaveTimer.AutoEnabled := False;
  fmMain.tmAutosaveTimer.Enabled := blAutosave;
end;

procedure TfmOptions.cbNumTitlesClick(Sender: TObject);
begin
  blNumTitles := cbNumTitles.Checked;
  if fmMain.pnMain.Visible = True then
  begin
    fmMain.FormatListTitles(True, False);
  end;
end;

procedure TfmOptions.bnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
