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

unit unitcopyright;

{$mode objfpc}{$H+}
{$modeswitch objectivec1}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  LCLIntf, Menus, LazUTF8, translate, CocoaAll, CocoaUtils;

type

  { TfmCopyright }

  TfmCopyright = class(TForm)
    imLogo: TImage;
    imImagecopyright: TImage;
    lbApp: TLabel;
    lbCopyrightVers: TLabel;
    lbCopyrightVers1: TLabel;
    lbPostgres: TLabel;
    lbOK: TLabel;
    lbCopyrightDesc: TLabel;
    lbCopyrightAuthor2: TLabel;
    lbCopyrightAuthor3: TLabel;
    lbCopyrightName: TLabel;
    mmMenuModal: TMainMenu;
    rmCopyrightText: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure imImagecopyrightClick(Sender: TObject);
    procedure imLogoClick(Sender: TObject);
    procedure lbAppClick(Sender: TObject);
    procedure lbOKClick(Sender: TObject);
    procedure lbPostgresClick(Sender: TObject);
  private

  public

  end;

var
  fmCopyright: TfmCopyright;

implementation

uses unit1;

  {$R *.lfm}

  { TfmCopyright }

procedure TfmCopyright.FormCreate(Sender: TObject);
begin
  if LowerCase(UTF8Copy(NSStringToString(
    NSLocale.preferredLanguages.objectAtIndex(0)), 1, 2)) = 'it' then
  begin
    translate.TranslateTo('pgnotex.it');
  end;
  if IsPaintDark = False then
  begin
    lbCopyrightName.Font.Color := $001ABC0F;
    lbCopyrightDesc.Font.Color := $001ABC0F;
    lbCopyrightAuthor2.Font.Color := $001ABC0F;
    lbCopyrightAuthor3.Font.Color := $001ABC0F;
    rmCopyrightText.Font.Color := $001ABC0F;
    lbPostgres.Font.Color := $001ABC0F;
    lbOK.Color := $001ABC0F;
    fmCopyright.Color := clWhite;
    rmCopyrightText.Color := clWhite;
  end
  else
  begin
    lbCopyrightName.Font.Color := $0040B5F0;
    lbCopyrightDesc.Font.Color := $0040B5F0;
    lbCopyrightAuthor2.Font.Color := $0040B5F0;
    lbCopyrightAuthor3.Font.Color := $0040B5F0;
    rmCopyrightText.Font.Color := $0040B5F0;
    lbPostgres.Font.Color := $0040B5F0;
    lbOK.Color := $0040B5F0;
  end;
  rmCopyrightText.Lines.Add(
    'This program is free software: you can redistribute it and/or modify it ' +
    'under the terms of the GNU General Public License as published by the Free ' +
    'Software Foundation, either version 3 of the License, or (at your option) ' +
    'any later version. You can read the version 3 of the Licence in ' +
    'http://www.gnu.org/licenses gpl-3.0.txt. For other information you can also ' +
    'see http://www.gnu.org/licenses.');
  rmCopyrightText.Lines.Add(
    'This program is distributed in the hope ' +
    'that it will be useful, but WITHOUT ANY WARRANTY; without even the implied ' +
    'warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU ' +
    'General Public License for more details.');
  rmCopyrightText.Lines.Add('This software has been written with Lazarus, and ' +
    'uses the Zeos components to access the PostgreSQL database.');
end;

procedure TfmCopyright.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = 27 then
  begin
    key := 0;
    Close;
  end;
end;

procedure TfmCopyright.imImagecopyrightClick(Sender: TObject);
begin
  OpenURL('https://github.com/maxnd/pgnotex');
end;

procedure TfmCopyright.imLogoClick(Sender: TObject);
begin
  OpenURL('https://www.gnu.org/licenses/gpl-3.0.html');
end;

procedure TfmCopyright.lbAppClick(Sender: TObject);
begin
  OpenURL('https://github.com/maxnd/pgnotex');
end;

procedure TfmCopyright.lbOKClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCopyright.lbPostgresClick(Sender: TObject);
begin
  OpenURL('https://www.postgresql.org');
end;

end.
