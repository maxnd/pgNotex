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

unit unit3;

{$mode objfpc}{$H+}
{$modeswitch objectivec1}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Menus, DB, LazUTF8, translate, CocoaAll, CocoaUtils;

type

  { TfmSections }

  TfmSections = class(TForm)
    bnCancel: TButton;
    bnOK: TButton;
    dbID: TDBEdit;
    dbTitle: TDBEdit;
    dbComments: TDBMemo;
    mmMenuModal: TMainMenu;
    procedure bnCancelClick(Sender: TObject);
    procedure bnOKClick(Sender: TObject);
    procedure dbCommentsKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure dbTitleEnter(Sender: TObject);
    procedure dbTitleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fmSections: TfmSections;


implementation

uses Unit1;

{$R *.lfm}

{ TfmNotebooks }

procedure TfmSections.FormCreate(Sender: TObject);
begin
  if LowerCase(UTF8Copy(NSStringToString(
    NSLocale.preferredLanguages.objectAtIndex(0)), 1, 2)) = 'it' then
  begin
    translate.TranslateTo('pgnotex.it');
  end;
end;

procedure TfmSections.FormShow(Sender: TObject);
begin
  if IsPaintDark = False then
  begin
    dbComments.Font.Color := clBlack;
    dbID.Font.Color := $001ABC0F;
    dbComments.Color := clWhite;
    fmSections.color := clWhite;
  end
  else
  begin
    dbComments.Font.Color := clWhite;
    dbID.Font.Color := $0040B5F0;
  end;
  dbTitle.SetFocus;
  dbTitle.SelStart := StrToNSString(dbTitle.Text, True).length;
end;

procedure TfmSections.dbCommentsKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  if ((Key = 13) and (Shift = [ssMeta])) then
  begin
    key := 0;
    bnOKClick(nil);
  end;
end;

procedure TfmSections.dbTitleEnter(Sender: TObject);
begin
  dbTitle.SelStart := StrToNSString(dbTitle.Text, True).length
end;

procedure TfmSections.bnOKClick(Sender: TObject);
begin
  if fmMain.dsSections.State in [dsEdit, dsInsert] then
  begin
    fmMain.zqSections.Post;
  end;
  if fmMain.zqSections.UpdatesPending = True then
  begin
    fmMain.zqSections.ApplyUpdates;
  end;
  Close;
end;

procedure TfmSections.dbTitleKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    key := 0;
    dbComments.SetFocus;
  end;
end;

procedure TfmSections.bnCancelClick(Sender: TObject);
begin
  if fmMain.dsSections.State in [dsEdit, dsInsert] then
  begin
    fmMain.zqSections.Cancel;
  end;
  if fmMain.zqSections.UpdatesPending = True then
  begin
    fmMain.zqSections.CancelUpdates;
  end;
  Close;
end;

end.
