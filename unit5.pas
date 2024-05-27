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

unit Unit5;

{$mode objfpc}{$H+}
{$modeswitch objectivec1}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, ExtCtrls,
  StdCtrls, Menus, LazFileUtils, LazUTF8, translate, CocoaAll, CocoaUtils;

type

  { TfmBookmarks }

  TfmBookmarks = class(TForm)
    bnCancel: TButton;
    bnClear: TButton;
    bnUp: TButton;
    bnDown: TButton;
    bnGoTo: TButton;
    bnSet: TButton;
    lbBookmarks: TLabel;
    mmMenuModal: TMainMenu;
    pnBottom: TPanel;
    pnBookmarks: TPanel;
    sgBookmarks: TStringGrid;
    shBookmarks: TShape;
    procedure bnCancelClick(Sender: TObject);
    procedure bnClearClick(Sender: TObject);
    procedure bnDownClick(Sender: TObject);
    procedure bnGoToClick(Sender: TObject);
    procedure bnSetClick(Sender: TObject);
    procedure bnUpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure sgBookmarksDblClick(Sender: TObject);
    procedure sgBookmarksKeyDown(Sender: TObject; var Key: word;
      Shift: TShiftState);
  private

  public
    stDbName: string;

  end;

var
  fmBookmarks: TfmBookmarks;

implementation

uses Unit1;

  {$R *.lfm}

  { TfmBookmarks }

procedure TfmBookmarks.FormCreate(Sender: TObject);
begin
  if LowerCase(UTF8Copy(NSStringToString(
    NSLocale.preferredLanguages.objectAtIndex(0)), 1, 2)) = 'it' then
  begin
    translate.TranslateTo('pgnotex.it');
  end;
  stDbName := '';
  sgBookmarks.FocusRectVisible := False;
  sgBookmarks.RowHeights[0] := 35;
  if IsPaintDark = False then
  begin
    sgBookmarks.TitleFont.Color := $001ABC0F;
    sgBookmarks.FixedColor := clWhite;
    fmBookmarks.Color := clWhite;
  end
  else
  begin
    sgBookmarks.TitleFont.Color := $0040B5F0;
    sgBookmarks.SelectedColor := $00424242;
  end;
end;

procedure TfmBookmarks.FormActivate(Sender: TObject);
begin
  sgBookmarks.SetFocus;
end;

procedure TfmBookmarks.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = 27 then
  begin
    key := 0;
    ModalResult := mrCancel;
  end;
end;

procedure TfmBookmarks.FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    key := 0;
    bnGoToClick(nil);
  end;
end;

procedure TfmBookmarks.sgBookmarksDblClick(Sender: TObject);
begin
  bnGoToClick(nil);
end;

procedure TfmBookmarks.sgBookmarksKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  if key = 46 then
  begin
    bnClearClick(nil);
  end;
end;

procedure TfmBookmarks.bnSetClick(Sender: TObject);
begin
  with sgBookmarks do
  begin
    if fmMain.zqNotesID.AsString <> '' then
    begin
      Cells[1, Row] := fmMain.zqNotebooksID.AsString;
      Cells[2, Row] := fmMain.zqSectionsID.AsString;
      Cells[3, Row] := fmMain.zqNotesID.AsString;
      Cells[4, Row] := fmMain.zqNotebooksTITLE.Value;
      Cells[5, Row] := fmMain.zqSectionsTITLE.Value;
      Cells[6, Row] := fmMain.zqNotesTITLE.Value;
    end;
  end;
end;

procedure TfmBookmarks.bnClearClick(Sender: TObject);
begin
  with sgBookmarks do
  begin
    Cells[1, Row] := '';
    Cells[2, Row] := '';
    Cells[3, Row] := '';
    Cells[4, Row] := '';
    Cells[5, Row] := '';
    Cells[6, Row] := '';
  end;
end;

procedure TfmBookmarks.bnUpClick(Sender: TObject);
var
  stData: string;
begin
  if sgBookmarks.Row > 1 then
  begin
    with sgBookmarks do
    begin
      stData := Cells[1, Row - 1];
      Cells[1, Row - 1] := Cells[1, Row];
      Cells[1, Row] := stData;
      stData := Cells[2, Row - 1];
      Cells[2, Row - 1] := Cells[2, Row];
      Cells[2, Row] := stData;
      stData := Cells[3, Row - 1];
      Cells[3, Row - 1] := Cells[3, Row];
      Cells[3, Row] := stData;
      stData := Cells[4, Row - 1];
      Cells[4, Row - 1] := Cells[4, Row];
      Cells[4, Row] := stData;
      stData := Cells[5, Row - 1];
      Cells[5, Row - 1] := Cells[5, Row];
      Cells[5, Row] := stData;
      stData := Cells[6, Row - 1];
      Cells[6, Row - 1] := Cells[6, Row];
      Cells[6, Row] := stData;
      Row := Row - 1;
    end;
  end;
end;

procedure TfmBookmarks.bnDownClick(Sender: TObject);
var
  stData: string;
begin
  if sgBookmarks.Row < 9 then
  begin
    with sgBookmarks do
    begin
      stData := Cells[1, Row + 1];
      Cells[1, Row + 1] := Cells[1, Row];
      Cells[1, Row] := stData;
      stData := Cells[2, Row + 1];
      Cells[2, Row + 1] := Cells[2, Row];
      Cells[2, Row] := stData;
      stData := Cells[3, Row + 1];
      Cells[3, Row + 1] := Cells[3, Row];
      Cells[3, Row] := stData;
      stData := Cells[4, Row + 1];
      Cells[4, Row + 1] := Cells[4, Row];
      Cells[4, Row] := stData;
      stData := Cells[5, Row + 1];
      Cells[5, Row + 1] := Cells[5, Row];
      Cells[5, Row] := stData;
      stData := Cells[6, Row + 1];
      Cells[6, Row + 1] := Cells[6, Row];
      Cells[6, Row] := stData;
      Row := Row + 1;
    end;
  end;
end;

procedure TfmBookmarks.bnGoToClick(Sender: TObject);
begin
  if sgBookmarks.Cells[1, sgBookmarks.Row] <> '' then
  begin
    ModalResult := mrOk;
  end;
end;

procedure TfmBookmarks.bnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


end.
