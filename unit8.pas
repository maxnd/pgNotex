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

unit Unit8;

{$mode objfpc}{$H+}
{$modeswitch objectivec1}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, DBCtrls,
  ExtCtrls, StdCtrls, Grids, Menus, LazUTF8, translate, CocoaAll,
  CocoaTextEdits, CocoaUtils;

type

  { TfmShowAllTasks }

  TfmShowAllTasks = class(TForm)
    cbShowAll: TCheckBox;
    dbTasks: TDBMemo;
    grTasks: TDBGrid;
    mmMenuModal: TMainMenu;
    nbOK: TButton;
    pnBottom: TPanel;
    pnTasks: TPanel;
    lbShowAll: TStaticText;
    Splitter1: TSplitter;
    procedure cbShowAllClick(Sender: TObject);
    procedure dbTasksChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure grTasksDblClick(Sender: TObject);
    procedure grTasksDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure grTasksKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure nbOKClick(Sender: TObject);
  private
    procedure FindTask;

  public

  end;

var
  fmShowAllTasks: TfmShowAllTasks;

implementation

uses Unit1;

{$R *.lfm}

{ TfmShowAllTasks }

procedure TfmShowAllTasks.FormCreate(Sender: TObject);
begin
  if LowerCase(UTF8Copy(NSStringToString(
    NSLocale.preferredLanguages.objectAtIndex(0)), 1, 2)) = 'it' then
  begin
    translate.TranslateTo('pgnotex.it');
  end;
  grTasks.FocusRectVisible := False;
  if IsPaintDark = False then
  begin
    grTasks.TitleFont.Color := $001ABC0F;
    dbTasks.Font.Color := clBlack;
    lbShowAll.Font.Color := $001ABC0F;
    dbTasks.Color := clWhite;
    grTasks.FixedColor := clWhite;
    fmShowAllTasks.Color := clWhite;
  end
  else
  begin
    grTasks.TitleFont.Color := $0040B5F0;
    grTasks.SelectedColor := $00424242;
    grTasks.TitleStyle := tsLazarus;
    dbTasks.Font.Color := clWhite;
    lbShowAll.Font.Color := $0040B5F0;
  end;
end;

procedure TfmShowAllTasks.grTasksDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if fmMain.zqAllTasks.FieldByName('done').AsInteger = 1 then
  begin
    grTasks.canvas.Font.Color := clTaskGreen;
  end
  else if ((fmMain.zqAllTasks.FieldByName('end_date').IsNull = False) and
    (fmMain.zqAllTasks.FieldByName('end_date').AsDateTime < Date)) then
  begin
    grTasks.canvas.Font.Color := clRed;
  end
  else if ((fmMain.zqAllTasks.FieldByName('start_date').IsNull = False) and
    (fmMain.zqAllTasks.FieldByName('start_date').AsDateTime <= Date)) then
  begin
    grTasks.canvas.Font.Color := clTaskBlue;
  end;
  grTasks.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfmShowAllTasks.grTasksKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    key := 0;
    grTasksDblClick(nil);
  end;
end;

procedure TfmShowAllTasks.grTasksDblClick(Sender: TObject);
begin
  FindTask;
end;

procedure TfmShowAllTasks.cbShowAllClick(Sender: TObject);
begin
  with fmMain.zqAllTasks do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select Notebooks.ID as NotebooksID, Sections.ID as SectionsID,');
    SQL.Add('Notes.ID as NotesID, Tasks.ID as TasksID,');
    SQL.Add('Notebooks.Title as NotebooksTitle, Sections.Title as SectionsTitle,');
    SQL.Add('Notes.Title as NotesTitle, Tasks.Done, Tasks.Title, Tasks.Start_Date,');
    SQL.Add('Tasks.End_Date, Tasks.Priority, Tasks.Resources, Tasks.Comments');
    SQL.Add('from Notebooks, Sections, Notes, Tasks');
    SQL.Add('where Notebooks.ID = Sections.ID_Notebooks');
    SQL.Add('and Sections.ID = Notes.ID_Sections');
    SQL.Add('and Notes.ID = Tasks.ID_Notes');
    if cbShowAll.Checked = False then
    begin
      SQL.Add('and DONE = 0');
    end;
    SQL.Add('order by DONE, END_DATE, START_DATE, PRIORITY');
    Open;
  end;

end;

procedure TfmShowAllTasks.dbTasksChange(Sender: TObject);
begin
  if dbTasks.Text <> '' then
  begin
    dbTasks.ReadOnly := False;
    TCocoaTextView(NSScrollView(dbTasks.Handle).documentView).
      checkTextInDocument(nil);
    dbTasks.ReadOnly := True;
  end;
end;

procedure TfmShowAllTasks.FormActivate(Sender: TObject);
begin
  TCocoaTextView(NSScrollView(dbTasks.Handle).documentView).
    setContinuousSpellCheckingEnabled(True);
  TCocoaTextView(NSScrollView(dbTasks.Handle).documentView).
    setGrammarCheckingEnabled(False);
  TCocoaTextView(NSScrollView(dbTasks.Handle).documentView).
    setFocusRingType(1);
  TCocoaTextView(NSScrollView(dbTasks.Handle).documentView).
    setAutomaticQuoteSubstitutionEnabled(True);
  TCocoaTextView(NSScrollView(dbTasks.Handle).documentView).
    setSmartInsertDeleteEnabled(True);
  TCocoaTextView(NSScrollView(dbTasks.Handle).documentView).
    setAutomaticLinkDetectionEnabled(True);
  TCocoaTextView(NSScrollView(dbTasks.Handle).documentView).
    setImportsGraphics(False);
  if dbTasks.Text <> '' then
  begin
    dbTasks.ReadOnly := False;
    TCocoaTextView(NSScrollView(dbTasks.Handle).documentView).
      checkTextInDocument(nil);
    dbTasks.ReadOnly := True;
  end;
end;

procedure TfmShowAllTasks.FormKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  if key = 27 then
  begin
    key := 0;
    Close;
  end;
end;

procedure TfmShowAllTasks.FindTask;
begin
  if fmMain.zqAllTasks.RecordCount > 0 then
  begin
    fmMain.zqNotebooks.Locate('id', fmMain.zqAllTasksNOTEBOOKSID.Value, []);
    fmMain.zqSections.Locate('id', fmMain.zqAllTasksSECTIONSID.Value, []);
    fmMain.zqNotes.Locate('id', fmMain.zqAllTasksNOTESID.Value, []);
    fmMain.zqTasks.Locate('id', fmMain.zqAllTasksTASKSID.Value, []);
    fmMain.pcPageControl.PageIndex := 1;
    Close;
  end;
end;

procedure TfmShowAllTasks.nbOKClick(Sender: TObject);
begin
  Close;
end;

end.
