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

unit Unit1;

{$mode objfpc}{$H+}
{$modeswitch objectivec1}

interface

uses
  Classes, SysUtils, DB, IBConnection, sqldb, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, Menus, DBGrids, ComCtrls, DBCtrls, StdCtrls, Grids,
  ZConnection, ZDataset, ZSqlUpdate, LCLIntf, IniFiles, LazUTF8,
  zipper, LazFileUtils, FileUtil, Clipbrd, process, DefaultTranslator,
  CocoaAll, CocoaTextEdits, CocoaUtils, Unix, Types;

type

  { TfmMain }

  TfmMain = class(TForm)
    appgNotex: TApplicationProperties;
    B26: TMenuItem;
    B3: TMenuItem;
    B37: TMenuItem;
    B8: TMenuItem;
    bnFind: TButton;
    cbFields: TComboBox;
    cbSearchRange: TComboBox;
    dsAllTasks: TDataSource;
    dbText: TMemo;
    dsFind: TDataSource;
    dbID: TDBEdit;
    dbTasks: TDBMemo;
    dbTitle: TDBEdit;
    dsImpExpNotes: TDataSource;
    dsTagsList: TDataSource;
    dsTasks: TDataSource;
    edFind: TMemo;
    edPassword: TEdit;
    edDbName: TEdit;
    edUserName: TEdit;
    grAttachments: TDBGrid;
    grFind: TDBGrid;
    grNotebooks: TDBGrid;
    grNotes: TDBGrid;
    grSections: TDBGrid;
    grTagsList: TDBGrid;
    grTasks: TDBGrid;
    grLinks: TDBGrid;
    grTags: TDBGrid;
    dsLinks: TDataSource;
    dsNotebooks: TDataSource;
    dsTags: TDataSource;
    dsSections: TDataSource;
    dsNotes: TDataSource;
    dsAttachments: TDataSource;
    pmNotesAttachmentsSaveDownloads: TMenuItem;
    pmNotesAttachmentsLoadDownloads: TMenuItem;
    Separator3: TMenuItem;
    miNotesAttachmentsLoadDownloads: TMenuItem;
    miNotesAttachmentsSaveDownloads: TMenuItem;
    Separator2: TMenuItem;
    tmTitlesTimer: TIdleTimer;
    itTime: TIdleTimer;
    lbFilters: TLabel;
    lbDbName: TLabel;
    lbTime: TLabel;
    lbInfo: TLabel;
    lbTitle: TLabel;
    lbID: TLabel;
    miNotesAttachmentsInsertAs: TMenuItem;
    pmNotesAttachmentsInsName: TMenuItem;
    Separator1: TMenuItem;
    miNotesTagsDeleteEmpty: TMenuItem;
    miEditFormatTitles: TMenuItem;
    miEditPandoc: TMenuItem;
    miEditEncodeLinks: TMenuItem;
    pmTasksNew: TMenuItem;
    pmTasksDelete: TMenuItem;
    N41: TMenuItem;
    pmTasksSort: TMenuItem;
    N42: TMenuItem;
    pmTasksHide: TMenuItem;
    N38: TMenuItem;
    miToolsTrans0: TMenuItem;
    N37: TMenuItem;
    miToolsTrans3: TMenuItem;
    miToolsTrans2: TMenuItem;
    miToolsTrans1: TMenuItem;
    miToolsTrans: TMenuItem;
    N36: TMenuItem;
    miEditPrevPic: TMenuItem;
    pmUpdateTags: TMenuItem;
    miNotesTasksRefresh: TMenuItem;
    N16b: TMenuItem;
    miEditSelectAll: TMenuItem;
    N34: TMenuItem;
    miEditPaste: TMenuItem;
    miEditCopy: TMenuItem;
    miEditCut: TMenuItem;
    N26: TMenuItem;
    N24: TMenuItem;
    miToolsFullScreen: TMenuItem;
    pmInsertTag: TMenuItem;
    miEditBookmarks: TMenuItem;
    N31: TMenuItem;
    miFileExport: TMenuItem;
    miFileImport: TMenuItem;
    N29: TMenuItem;
    N14: TMenuItem;
    miEditClean: TMenuItem;
    miNotesImport: TMenuItem;
    N28: TMenuItem;
    N27: TMenuItem;
    miPGManual: TMenuItem;
    N30: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    P2: TMenuItem;
    P3: TMenuItem;
    miNotesSearch: TMenuItem;
    miNotesCopyID: TMenuItem;
    miSectionsCopyID: TMenuItem;
    miNotebooksCopyID: TMenuItem;
    N25: TMenuItem;
    miFileClose: TMenuItem;
    miNotesShowAllTasks: TMenuItem;
    N23: TMenuItem;
    miNotesTasksHide: TMenuItem;
    N16: TMenuItem;
    miNoteschangeSection: TMenuItem;
    N21: TMenuItem;
    miSectionsChangeNotebook: TMenuItem;
    N20: TMenuItem;
    miNotesMoveDown: TMenuItem;
    miNotesMoveUp: TMenuItem;
    miNotesMove: TMenuItem;
    N19: TMenuItem;
    miSectionsMoveDown: TMenuItem;
    miSectionsMoveUp: TMenuItem;
    miSectionsMove: TMenuItem;
    N18: TMenuItem;
    miNotebooksMoveDown: TMenuItem;
    miNotebooksMoveUp: TMenuItem;
    miNotebooksMove: TMenuItem;
    N17: TMenuItem;
    miToolsShowEditor: TMenuItem;
    miEdit: TMenuItem;
    miNotesTagsRename: TMenuItem;
    N13: TMenuItem;
    miNotesFind: TMenuItem;
    N12: TMenuItem;
    miNotesLinksLocate: TMenuItem;
    N11: TMenuItem;
    N10: TMenuItem;
    miFileRefresh: TMenuItem;
    miNotesAttachmentsOpen: TMenuItem;
    miNotesAttachmentsSaveAs: TMenuItem;
    N9: TMenuItem;
    miSectionsComments: TMenuItem;
    N8: TMenuItem;
    miFileUndo: TMenuItem;
    miNotebooksComments: TMenuItem;
    N7: TMenuItem;
    N6: TMenuItem;
    miPGCopyright: TMenuItem;
    miToolsOptions: TMenuItem;
    miNotesTasksDelete: TMenuItem;
    miNotesTasksNew: TMenuItem;
    miNotesLinksDelete: TMenuItem;
    miNotesLinksNew: TMenuItem;
    miNotesAttachmentsDelete: TMenuItem;
    miNotesAttachmentsNew: TMenuItem;
    miNotesTagsDelete: TMenuItem;
    miNotesTagsNew: TMenuItem;
    miNotesTasks: TMenuItem;
    miNotesLinks: TMenuItem;
    miNotesAttachments: TMenuItem;
    miNotesTags: TMenuItem;
    N5: TMenuItem;
    miNotesSortByCustom: TMenuItem;
    miNotesSortByModificationDate: TMenuItem;
    miNotesSortByTitle: TMenuItem;
    miNotesSortBy: TMenuItem;
    N4: TMenuItem;
    miNotesDelete: TMenuItem;
    miNotesNew: TMenuItem;
    miSectionsSortbyCustom: TMenuItem;
    miSectionsSortbyTitle: TMenuItem;
    miSectionsSortby: TMenuItem;
    N3: TMenuItem;
    miNotebooksSortbyCustom: TMenuItem;
    miNotebooksSortbyTitle: TMenuItem;
    miNotebooksSortby: TMenuItem;
    N2: TMenuItem;
    miSectionsDelete: TMenuItem;
    miSectionsNew: TMenuItem;
    miNotebooksDelete: TMenuItem;
    miNotebooksNew: TMenuItem;
    miPGNotex: TMenuItem;
    miTools: TMenuItem;
    miNotes: TMenuItem;
    miSection: TMenuItem;
    miNotebooks: TMenuItem;
    N1: TMenuItem;
    miFileSave: TMenuItem;
    miFile: TMenuItem;
    mmMenu: TMainMenu;
    odOpenDialog: TOpenDialog;
    pmNotebooksCopyID: TMenuItem;
    pmNotebooksDelete: TMenuItem;
    pmNotebooksMove: TMenuItem;
    pmNotebooksMoveDown: TMenuItem;
    pmNotebooksMoveUp: TMenuItem;
    pmNotebooksNew: TMenuItem;
    pmNotesAttachmentsDelete: TMenuItem;
    pmNotesAttachmentsNew: TMenuItem;
    pmNotesAttachmentsOpen: TMenuItem;
    pmNotesAttachmentsSaveAs: TMenuItem;
    pmNotesCopyID: TMenuItem;
    pmNotesDelete: TMenuItem;
    pmNotesLinksDelete: TMenuItem;
    pmNotesLinksLocate: TMenuItem;
    pmNotesLinksNew: TMenuItem;
    pmNotesMove: TMenuItem;
    pmNotesMoveDown: TMenuItem;
    pmNotesMoveUp: TMenuItem;
    pmNotesNew: TMenuItem;
    pmNotesTagsDelete: TMenuItem;
    pmNotesTagsNew: TMenuItem;
    pmNotesTagsRename: TMenuItem;
    pmSectionsCopyID: TMenuItem;
    pmSectionsDelete: TMenuItem;
    pmSectionsMove: TMenuItem;
    pmSectionsMoveDown: TMenuItem;
    pmSectionsMoveUp: TMenuItem;
    pmSectionsNew: TMenuItem;
    pnLogin: TPanel;
    pnText: TPanel;
    pnTasks: TPanel;
    pnTitle: TPanel;
    pcPageControl: TPageControl;
    pnBottom: TPanel;
    pnRight: TPanel;
    pnLeft: TPanel;
    pnMain: TPanel;
    pnStatusBar: TPanel;
    pmNotebooks: TPopupMenu;
    pmSections: TPopupMenu;
    pmNotes: TPopupMenu;
    pmAttachments: TPopupMenu;
    pmTags: TPopupMenu;
    pmLinks: TPopupMenu;
    pmTasks: TPopupMenu;
    ppTags: TPopupMenu;
    sdSaveDialog: TSaveDialog;
    shSave: TShape;
    spLeft: TSplitter;
    spTasks: TSplitter;
    spNotebooks_Sections: TSplitter;
    spNotebooks_Sections1: TSplitter;
    spRight: TSplitter;
    spTitles: TSplitter;
    spBottom: TSplitter;
    spAttachments: TSplitter;
    spLink: TSplitter;
    spNotes_Sections: TSplitter;
    sgTitles: TStringGrid;
    lbFound: TStaticText;
    lbUserName: TStaticText;
    lbPassword: TStaticText;
    lbLogo: TStaticText;
    tmAutosaveTimer: TIdleTimer;
    tsNotes: TTabSheet;
    tsTasks: TTabSheet;
    zcConnection: TZConnection;
    zqAllTasksCOMMENTS: TMemoField;
    zqAllTasksDONE: TSmallintField;
    zqAllTasksEND_DATE: TDateField;
    zqAllTasksNOTEBOOKSID: TLongintField;
    zqAllTasksNOTEBOOKSTITLE: TStringField;
    zqAllTasksNOTESID: TLongintField;
    zqAllTasksNOTESTITLE: TStringField;
    zqAllTasksPRIORITY: TStringField;
    zqAllTasksRESOURCES: TStringField;
    zqAllTasksSECTIONSID: TLongintField;
    zqAllTasksSECTIONSTITLE: TStringField;
    zqAllTasksSTART_DATE: TDateField;
    zqAllTasksTASKSID: TLongintField;
    zqAllTasksTITLE: TStringField;
    zqImpExpAttachments: TZQuery;
    zqAttachmentsATTACHMENT: TBlobField;
    zqAttachmentsID: TLongintField;
    zqAttachmentsID_NOTES: TLongintField;
    zqAttachmentsORD: TLongintField;
    zqAttachmentsTITLE: TStringField;
    zqFindIDNOTEBOOKS: TLongintField;
    zqFindIDNOTES: TLongintField;
    zqFindIDSECTIONS: TLongintField;
    zqFindTITLENOTEBOOKS: TStringField;
    zqFindTITLENOTES: TStringField;
    zqFindTITLESECTIONS: TStringField;
    zqImpExpAttachmentsATTACHMENT: TBlobField;
    zqImpExpAttachmentsID: TLongintField;
    zqImpExpAttachmentsID_NOTES: TLongintField;
    zqImpExpAttachmentsORD: TLongintField;
    zqImpExpAttachmentsTITLE: TStringField;
    zqImpExpNotesID: TLongintField;
    zqImpExpNotesID_SECTIONS: TLongintField;
    zqImpExpNotesMODIFICATION_DATE: TDateTimeField;
    zqImpExpNotesORD: TLongintField;
    zqImpExpNotesTEXT: TMemoField;
    zqImpExpNotesTITLE: TStringField;
    zqImpExpTasks: TZQuery;
    zqImpExpTagsID: TLongintField;
    zqImpExpTagsID_NOTES: TLongintField;
    zqImpExpTagsTAG: TStringField;
    zqImpExpTasksCOMMENTS: TMemoField;
    zqImpExpTasksDONE: TSmallintField;
    zqImpExpTasksEND_DATE: TDateField;
    zqImpExpTasksID: TLongintField;
    zqImpExpTasksID_NOTES: TLongintField;
    zqImpExpTasksPRIORITY: TStringField;
    zqImpExpTasksRESOURCES: TStringField;
    zqImpExpTasksSTART_DATE: TDateField;
    zqImpExpTasksTITLE: TStringField;
    zqLinks: TZQuery;
    zqLinksID: TLongintField;
    zqLinksID_NOTES: TLongintField;
    zqLinksLINK_NOTE: TLongintField;
    zqLinksTITLE: TStringField;
    zqImpExpNotes: TZQuery;
    zqNotesMODIFICATION_DATE: TDateTimeField;
    zqImpExpTags: TZQuery;
    zqTagsList: TZQuery;
    zqTagsListTAG: TStringField;
    zqTasks: TZQuery;
    zqNotebooksCOMMENTS: TMemoField;
    zqNotebooksID: TLongintField;
    zqNotebooksORD: TLongintField;
    zqNotebooksTITLE: TStringField;
    zqNotesID: TLongintField;
    zqNotesID_SECTIONS: TLongintField;
    zqNotesORD: TLongintField;
    zqNotesTEXT: TMemoField;
    zqNotesTITLE: TStringField;
    zqSectionsCOMMENTS: TMemoField;
    zqSectionsID: TLongintField;
    zqSectionsID_NOTEBOOKS: TLongintField;
    zqSectionsORD: TLongintField;
    zqSectionsTITLE: TStringField;
    zqNotebooks: TZQuery;
    zqTags: TZQuery;
    zqSections: TZQuery;
    zqNotes: TZQuery;
    zqAttachments: TZQuery;
    zqCheckID: TZReadOnlyQuery;
    zqTagsID: TLongintField;
    zqTagsID_NOTES: TLongintField;
    zqTagsTAG: TStringField;
    zqTasksCOMMENTS: TMemoField;
    zqTasksDONE: TSmallintField;
    zqTasksEND_DATE: TDateField;
    zqTasksID: TLongintField;
    zqTasksID_NOTES: TLongintField;
    zqTasksPRIORITY: TStringField;
    zqTasksRESOURCES: TStringField;
    zqTasksSTART_DATE: TDateField;
    zqTasksTITLE: TStringField;
    zqGetLink: TZReadOnlyQuery;
    zqFind: TZReadOnlyQuery;
    zqRenameTags: TZQuery;
    zqAllTasks: TZQuery;
    zuImpExpAttachments: TZUpdateSQL;
    zuImpExpTasks: TZUpdateSQL;
    zuLinks: TZUpdateSQL;
    zuImpExpNotes: TZUpdateSQL;
    zuRenameTags: TZUpdateSQL;
    zuImpExpTags: TZUpdateSQL;
    zuTasks: TZUpdateSQL;
    zuNotebooks: TZUpdateSQL;
    zuTags: TZUpdateSQL;
    zuSections: TZUpdateSQL;
    zuNotes: TZUpdateSQL;
    zuAttachments: TZUpdateSQL;
    procedure appgNotexException(Sender: TObject; E: Exception);
    procedure bnFindClick(Sender: TObject);
    procedure dbTasksChange(Sender: TObject);
    procedure dbTextChange(Sender: TObject);
    procedure dbTextKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure dbTextKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure dbTitleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure dsAttachmentsDataChange(Sender: TObject; Field: TField);
    procedure dsNotesDataChange(Sender: TObject; Field: TField);
    procedure dsTagsDataChange(Sender: TObject; Field: TField);
    procedure dsTasksDataChange(Sender: TObject; Field: TField);
    procedure edFindKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure edPasswordKeyPress(Sender: TObject; var Key: char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grAttachmentsDblClick(Sender: TObject);
    procedure grAttachmentsGetCellHint(Sender: TObject; Column: TColumn;
      var AText: string);
    procedure grFindDblClick(Sender: TObject);
    procedure grFindKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure grLinksDblClick(Sender: TObject);
    procedure grLinksGetCellHint(Sender: TObject; Column: TColumn;
      var AText: string);
    procedure grNotebooksDblClick(Sender: TObject);
    procedure grNotebooksGetCellHint(Sender: TObject; Column: TColumn;
      var AText: string);
    procedure grNotesGetCellHint(Sender: TObject; Column: TColumn;
      var AText: string);
    procedure grSectionsDblClick(Sender: TObject);
    procedure grSectionsGetCellHint(Sender: TObject; Column: TColumn;
      var AText: string);
    procedure grTagsGetCellHint(Sender: TObject; Column: TColumn;
      var AText: string);
    procedure grTagsListDblClick(Sender: TObject);
    procedure grTagsListGetCellHint(Sender: TObject; Column: TColumn;
      var AText: string);
    procedure grTagsListKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure grTasksDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure grTasksGetCellHint(Sender: TObject; Column: TColumn;
      var AText: string);
    procedure grTasksKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure grTasksUserCheckboxState(Sender: TObject; Column: TColumn;
      var AState: TCheckboxState);
    procedure itTimeTimer(Sender: TObject);
    procedure miEditCopyClick(Sender: TObject);
    procedure miEditCutClick(Sender: TObject);
    procedure miEditEncodeLinksClick(Sender: TObject);
    procedure miEditPandocClick(Sender: TObject);
    procedure miEditPasteClick(Sender: TObject);
    procedure miEditPrevPicClick(Sender: TObject);
    procedure miEditSelectAllClick(Sender: TObject);
    procedure miEditFormatTitlesClick(Sender: TObject);
    procedure miNotesAttachmentsInsertAsClick(Sender: TObject);
    procedure miNotesAttachmentsLoadDownloadsClick(Sender: TObject);
    procedure miNotesAttachmentsSaveDownloadsClick(Sender: TObject);
    procedure miNotesTagsDeleteEmptyClick(Sender: TObject);
    procedure miNotesTasksRefreshClick(Sender: TObject);
    procedure miEditBookmarksClick(Sender: TObject);
    procedure miEditCleanClick(Sender: TObject);
    procedure miFileExportClick(Sender: TObject);
    procedure miFileImportClick(Sender: TObject);
    procedure miNotesImportClick(Sender: TObject);
    procedure miPGManualClick(Sender: TObject);
    procedure miFileCloseClick(Sender: TObject);
    procedure miNotebooksCopyIDClick(Sender: TObject);
    procedure miNotesCopyIDClick(Sender: TObject);
    procedure miNotesSearchClick(Sender: TObject);
    procedure miNotesShowAllTasksClick(Sender: TObject);
    procedure miNotesTasksHideClick(Sender: TObject);
    procedure miFileRefreshClick(Sender: TObject);
    procedure miPGCopyrightClick(Sender: TObject);
    procedure miNotebooksMoveDownClick(Sender: TObject);
    procedure miNotebooksMoveUpClick(Sender: TObject);
    procedure miNotesAttachmentsOpenClick(Sender: TObject);
    procedure miNotesAttachmentsSaveAsClick(Sender: TObject);
    procedure miNoteschangeSectionClick(Sender: TObject);
    procedure miNotesFindClick(Sender: TObject);
    procedure miNotesLinksLocateClick(Sender: TObject);
    procedure miNotesMoveDownClick(Sender: TObject);
    procedure miNotesMoveUpClick(Sender: TObject);
    procedure miNotesTagsRenameClick(Sender: TObject);
    procedure miSectionsChangeNotebookClick(Sender: TObject);
    procedure miSectionsCopyIDClick(Sender: TObject);
    procedure miSectionsMoveDownClick(Sender: TObject);
    procedure miSectionsMoveUpClick(Sender: TObject);
    procedure miToolsFullScreenClick(Sender: TObject);
    procedure miToolsShowEditorClick(Sender: TObject);
    procedure miToolsOptionsClick(Sender: TObject);
    procedure miToolsTrans1Click(Sender: TObject);
    procedure pmInsertTagClick(Sender: TObject);
    procedure pmUpdateTagsClick(Sender: TObject);
    procedure sgTitlesClick(Sender: TObject);
    procedure sgTitlesDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure sgTitlesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure sgTitlesMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure StateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miFileSaveClick(Sender: TObject);
    procedure miNotebooksCommentsClick(Sender: TObject);
    procedure miNotebooksDeleteClick(Sender: TObject);
    procedure miNotebooksNewClick(Sender: TObject);
    procedure miNotebooksSortbyCustomClick(Sender: TObject);
    procedure miNotebooksSortbyTitleClick(Sender: TObject);
    procedure miNotesAttachmentsDeleteClick(Sender: TObject);
    procedure miNotesAttachmentsNewClick(Sender: TObject);
    procedure miNotesDeleteClick(Sender: TObject);
    procedure miNotesLinksDeleteClick(Sender: TObject);
    procedure miNotesLinksNewClick(Sender: TObject);
    procedure miNotesNewClick(Sender: TObject);
    procedure miNotesSortByCustomClick(Sender: TObject);
    procedure miNotesSortByModificationDateClick(Sender: TObject);
    procedure miNotesSortByTitleClick(Sender: TObject);
    procedure miNotesTagsDeleteClick(Sender: TObject);
    procedure miNotesTagsNewClick(Sender: TObject);
    procedure miNotesTasksDeleteClick(Sender: TObject);
    procedure miNotesTasksNewClick(Sender: TObject);
    procedure miSectionsCommentsClick(Sender: TObject);
    procedure miSectionsDeleteClick(Sender: TObject);
    procedure miSectionsNewClick(Sender: TObject);
    procedure miSectionsSortbyCustomClick(Sender: TObject);
    procedure miSectionsSortbyTitleClick(Sender: TObject);
    procedure miFileUndoClick(Sender: TObject);
    procedure tmAutosaveTimerTimer(Sender: TObject);
    procedure tmTitlesTimerTimer(Sender: TObject);
    procedure zqAttachmentsAfterDelete(DataSet: TDataSet);
    procedure zqAttachmentsAfterInsert(DataSet: TDataSet);
    procedure zqAttachmentsAfterScroll(DataSet: TDataSet);
    procedure zqAttachmentsBeforeDelete(DataSet: TDataSet);
    procedure zqAttachmentsBeforeInsert(DataSet: TDataSet);
    procedure zqLinksAfterDelete(DataSet: TDataSet);
    procedure zqLinksAfterInsert(DataSet: TDataSet);
    procedure zqLinksAfterScroll(DataSet: TDataSet);
    procedure zqLinksBeforeDelete(DataSet: TDataSet);
    procedure zqLinksBeforeInsert(DataSet: TDataSet);
    procedure zqNotebooksAfterDelete(DataSet: TDataSet);
    procedure zqNotebooksAfterInsert(DataSet: TDataSet);
    procedure zqNotebooksAfterScroll(DataSet: TDataSet);
    procedure zqNotebooksBeforeDelete(DataSet: TDataSet);
    procedure zqNotesAfterDelete(DataSet: TDataSet);
    procedure zqNotesAfterInsert(DataSet: TDataSet);
    procedure zqNotesAfterScroll(DataSet: TDataSet);
    procedure zqNotesBeforeDelete(DataSet: TDataSet);
    procedure zqNotesBeforeInsert(DataSet: TDataSet);
    procedure zqNotesBeforePost(DataSet: TDataSet);
    procedure zqSectionsAfterDelete(DataSet: TDataSet);
    procedure zqSectionsAfterInsert(DataSet: TDataSet);
    procedure zqSectionsAfterScroll(DataSet: TDataSet);
    procedure zqSectionsBeforeDelete(DataSet: TDataSet);
    procedure zqSectionsBeforeInsert(DataSet: TDataSet);
    procedure zqTagsAfterDelete(DataSet: TDataSet);
    procedure zqTagsAfterInsert(DataSet: TDataSet);
    procedure zqTagsAfterScroll(DataSet: TDataSet);
    procedure zqTagsBeforeDelete(DataSet: TDataSet);
    procedure zqTagsBeforeInsert(DataSet: TDataSet);
    procedure zqTagsListAfterScroll(DataSet: TDataSet);
    procedure zqTasksAfterDelete(DataSet: TDataSet);
    procedure zqTasksAfterInsert(DataSet: TDataSet);
    procedure zqTasksAfterPost(DataSet: TDataSet);
    procedure zqTasksBeforeDelete(DataSet: TDataSet);
    procedure zqTasksBeforeInsert(DataSet: TDataSet);
  private
    function CanMove(stLine: string; stHeader: string): boolean;
    function CleanXML(stXMLText: string): string;
    procedure Connect;
    function FindFont(FamilyName: string; iStyle: smallint): NSFontDescriptor;
    procedure FindNotes;
    procedure Disconnect;
    function GetDict(txt: NSTextStorage; textOffset: integer): NSDictionary;
    function GetNotexTempDir: string;
    function GetPara(txt: NSTextStorage; textOffset: integer; isReadOnly,
      useDefault: boolean): NSParagraphStyle;
    function GetWritePara(txt: NSTextStorage; textOffset: integer
      ): NSMutableParagraphStyle;
    procedure InsText(stText: string);
    procedure SelectInsertFootnote;
    procedure RenumberFootnotes;
    procedure RenumberList(blAll: boolean);
    procedure ResetChanges;
    procedure RefreshData;
    procedure SaveAll;
    procedure SelectTitle;
    procedure SetLists;
    procedure UpdateInfo;
  public
    procedure FormatListTitles(ListTitles: boolean; FormatText: boolean);
    function UTF8CocoaPos(const SearchForText, SearchInText: string;
      StartPos: SizeInt = 1): PtrInt;

  end;

var
  fmMain: TfmMain;
  myHomeDir, myConfigFile: string;
  blSortCustomNotebooks: boolean = True;
  blSortCustomSections: boolean = True;
  blSortCustomNotes: boolean = True;
  blChangeIDSectionNote: smallint = -1;
  blChangedText: boolean = False;
  blLoadNotes: boolean = True;
  blModNote: boolean = False;
  iLastNotebook: integer = 0;
  iLastSection: integer = 0;
  iLastNote: integer = 0;
  iMaxSize: integer = 120000;
  clTitle1: TColor = clDefault;
  clTitle2: TColor = clDefault;
  clTitle3: TColor = clDefault;
  iLineSpacing: integer = 0;
  iParSpacing: integer = 0;
  clTaskGreen, clTaskBlue: TColor;
  IsPaintDark: boolean;
  blNumTitles: boolean = False;
  blAutosave: boolean = False;
  userName: string;
  dbName: string;
  pandocPath: string = '/usr/local/bin/';
  pandocOptions: string = '+footnotes+inline_notes';
  pandocTemplate: string = 'word-template.docx';
  pandocOutput: string = '.docx';
  iEndHeading: integer = -1;

resourcestring

  msg001 = 'Data input or operation not correct. The error message is:';
  msg002 = 'Undo the changes to the text?';
  msg003 = 'The value entered is not valid.';
  msg004 = 'No note has been selected.';
  msg015 = 'Delete the current notebook with all the related sections and notes?';
  msg016 = 'It''s not possible to add a new section because no notebook is selected.';
  msg017 = 'Delete the current section with all the related notes?';
  msg018 = 'It''s not possible to add a new note because no section is selected.';
  msg019 = 'Delete the current note with all the related elements?';
  msg020 = 'It''s not possible to add a new attachment because no note is selected.';
  msg021 = 'Delete the current attachment?';
  msg022 = 'It''s not possible to add a new tag because no note is selected.';
  msg023 = 'Delete the current tag?';
  msg024 = 'It''s not possible to add a new link because no note is selected.';
  msg025 = 'Delete the current link?';
  msg026 = 'It''s not possible to add a new task because no note is selected.';
  msg027 = 'Delete the current task?';
  msg028 = 'The user name, the password or the database are not correct.';
  msg029 = 'It''s not possible to save the data.';
  msg030 = 'Undo all the changes not yet saved?';
  msg031 = 'It''s not possible to undo the changes.';
  msg032 = 'It''s not possible to refresh the data.';
  msg033 = 'The start date is not correct.';
  msg034 = 'The end date is not correct.';
  msg035 = 'Insert notebook ID';
  msg036 = 'Insert the ID of the new notebook.';
  msg037 = 'Insert the ID of the note to be linked.';
  msg038 = 'Insert section ID';
  msg039 = 'Insert the ID of the new section.';
  msg040 = 'No note selected.';
  msg041 = 'Notes found:';
  msg042 = 'It''s not possible to import the file';
  msg043 = 'The SQL clause is not correct.';
  msg045 = 'It was not possible to export the notes.';
  msg046 = 'It was not possible to import the notes.';
  msg047 = 'The selected file was not created with pgNotex.';
  msg048 = 'It was not possible to find the note.';
  msg052 = 'Insert note ID';
  msg053 = 'The note is already linked.';
  msg054 = 'The tag is already present.';
  msg055 = 'The file has been updated.';
  msg056 = 'The file has not been found.';
  msg057 = 'Create a new task?';
  dateformat = 'en';
  prior1 = '1. Urgent';
  prior2 = '2. Very important';
  prior3 = '3. Important';
  prior4 = '4. Normal';
  prior5 = '5. Optional';
  find1 = 'Title contains';
  find2 = 'Text contains';
  find3 = 'Modification date among';
  find4 = 'Tags equal to';
  find5 = 'Attachment name contains';
  find6 = 'Activity title contains';
  find7 = 'SQL Where clause';
  find8 = 'In the whole database';
  find9 = 'In the current notebook';
  find10 = 'In the current section';
  lbNotebooks = 'Notebooks';
  lbSections = 'Sections';
  lbNotes = 'Notes';
  lbAttachments = 'Attached files';
  lbTags = 'Tags';
  lbTagsList = 'Tags list';
  lbLinks = 'Linked notes';
  sb001 = 'Note saved on';
  sb002 = 'at';
  sb003 = 'Tasks';
  sb005 = 'Characters';
  ts001 = 'Done';
  ts002 = 'Title';
  ts003 = 'Start date';
  ts004 = 'End date';
  ts005 = 'Priority';
  ts006 = 'Resources';
  ts007 = 'Comments';
  fileext001 = 'All formats|*.txt;*.odt;*.docx|' +
    'Text file|*.txt|Writer files|*.odt|' + 'Word files|*.docx|All files|*';
  fileext002 = 'All files|*';
  fileext003 = 'pgNotex archive|*.sna';
  pdfmanual = 'pgnotex-manual.pdf';

implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8, Unit9, Unit11,
  unitcopyright, translate;

{$R *.lfm}

procedure TfmMain.FormCreate(Sender: TObject);
var
  MyIni: TIniFile;
begin
  if LowerCase(UTF8Copy(NSStringToString(
    NSLocale.preferredLanguages.objectAtIndex(0)), 1, 2)) = 'it' then
  begin
    translate.TranslateTo('pgnotex.it');
  end;
  myHomeDir := GetUserDir + 'Library/Preferences/';
  myConfigFile := 'pgnotex';
  if DirectoryExists(myHomeDir) = False then
  begin
    CreateDirUTF8(myHomeDir);
  end;
  if DirectoryExists(GetNotexTempDir) = False then
  begin
    CreateDirUTF8(GetNotexTempDir);
  end;
  IsPaintDark := IsAppDark;
  if IsPaintDark = True then
  begin
    clTitle1 := clWhite;
    clTitle2 := clWhite;
    clTitle3 := clWhite;
    dbText.Font.Color := clWhite;
  end
  else
  begin
    fmMain.Color := clWhite;
    dbID.Color := clWhite;
    dbTitle.Color := clWhite;
    sgTitles.Color := clWhite;
    dbText.Color := clWhite;
    dbTasks.Color := clWhite;
    grNotebooks.FixedColor := clWhite;
    grSections.FixedColor := clWhite;
    grNotes.FixedColor := clWhite;
    grAttachments.FixedColor := clWhite;
    grTasks.FixedColor := clWhite;
    grTags.FixedColor := clWhite;
    grLinks.FixedColor := clWhite;
    grTagsList.FixedColor := clWhite;
    grFind.FixedColor := clWhite;
    edFind.Color := clWhite;
    clTitle1 := clBlack;
    clTitle2 := clBlack;
    clTitle3 := clBlack;
    dbText.Font.Color := clBlack;
  end;
  if FileExistsUTF8(myHomeDir + myConfigFile) then
  begin
    try
      MyIni := TIniFile.Create(myHomeDir + myConfigFile);
      if MyIni.ReadString('pgnotex', 'maximize', '') = 'true' then
      begin
        fmMain.WindowState := wsMaximized;
      end
      else
      begin
        fmMain.Top := MyIni.ReadInteger('pgnotex', 'top', 0);
        fmMain.Left := MyIni.ReadInteger('pgnotex', 'left', 0);
        if MyIni.ReadInteger('pgnotex', 'width', 0) > 100 then
          fmMain.Width := MyIni.ReadInteger('pgnotex', 'width', 0)
        else
          fmMain.Width := 1000;
        if MyIni.ReadInteger('pgnotex', 'heigth', 0) > 100 then
          fmMain.Height := MyIni.ReadInteger('pgnotex', 'heigth', 0)
        else
          fmMain.Height := 600;
      end;
      pnLeft.Width := MyIni.ReadInteger('pgnotex', 'pnleft', 550);
      pnRight.Width := MyIni.ReadInteger('pgnotex', 'pnright', 360);
      grNotebooks.Height := MyIni.ReadInteger('pgnotex', 'grnotebooks', 190);
      grSections.Height := MyIni.ReadInteger('pgnotex', 'grsections', 190);
      grAttachments.Height := MyIni.ReadInteger('pgnotex', 'grattachments', 170);
      grLinks.Height := MyIni.ReadInteger('pgnotex', 'grlinks', 150);
      zcConnection.HostName := MyIni.ReadString('pgnotex', 'host', 'localhost');
      zcConnection.Port := MyIni.ReadInteger('pgnotex', 'port', 3050);
      zcConnection.LibraryLocation :=
        MyIni.ReadString('pgnotex', 'libloc',
        '/Library/PostgreSQL/16/lib/libpq.5.dylib');
      dbText.Font.Name := MyIni.ReadString('pgnotex', 'fontname', 'Helvetica');
      dbText.Font.Size := MyIni.ReadInteger('pgnotex', 'fontsize', 12);
      sgTitles.Font.Size := MyIni.ReadInteger('pgnotex', 'fonttitlessize', 12);
      if IsPaintDark = False then
      begin
        dbText.Font.Color := StringToColor(MyIni.ReadString('pgnotex',
          'fontcolor', 'clDefault'));
      end
      else
      begin
        dbText.Font.Color := StringToColor(MyIni.ReadString('pgnotex',
          'fontcolor', 'clWhite'));
      end;
      if MyIni.ReadInteger('pgnotex', 'trans', 0) = 0 then
      begin
        miToolsTrans0.Checked := True;
      end
      else
      if MyIni.ReadInteger('pgnotex', 'trans', 0) = 1 then
      begin
        miToolsTrans1.Checked := True;
        miToolsTrans1Click(miToolsTrans1);
      end
      else
      if MyIni.ReadInteger('pgnotex', 'trans', 0) = 2 then
      begin
        miToolsTrans2.Checked := True;
        miToolsTrans1Click(miToolsTrans2);
      end
      else
      if MyIni.ReadInteger('pgnotex', 'trans', 0) = 3 then
      begin
        miToolsTrans3.Checked := True;
        miToolsTrans1Click(miToolsTrans3);
      end;
      if MyIni.ReadInteger('pgnotex', 'numtitles', 0) = 1 then
      begin
        blNumTitles := True;
      end;
      if MyIni.ReadInteger('pgnotex', 'autosave', 0) = 1 then
      begin
        blAutosave := True;
        tmAutosaveTimer.Enabled := True;
      end;
      iMaxSize := MyIni.ReadInteger('pgnotex', 'maxsize', 120000);
      iLineSpacing := MyIni.ReadInteger('pgnotex', 'linespacing', 0);
      iParSpacing := MyIni.ReadInteger('pgnotex', 'parspacing', 0);
      clTitle1 := StringToColor(MyIni.ReadString('pgnotex', 'title1', 'clDefault'));
      clTitle2 := StringToColor(MyIni.ReadString('pgnotex', 'title2', 'clDefault'));
      clTitle3 := StringToColor(MyIni.ReadString('pgnotex', 'title3', 'clDefault'));
      iLastNotebook := MyIni.ReadInteger('pgnotex', 'lastnotebook', 0);
      iLastSection := MyIni.ReadInteger('pgnotex', 'lastsection', 0);
      iLastNote := MyIni.ReadInteger('pgnotex', 'lastnote', 0);
      userName := MyIni.ReadString('pgnotex', 'username', 'postgres');
      dbName := MyIni.ReadString('pgnotex', 'dbname', '');
      pandocOptions := MyIni.ReadString('pgnotex', 'panoption',
        '+footnotes+inline_notes');
      pandocTemplate := MyIni.ReadString('pgnotex', 'pantemplate', 'word-template.docx');
      pandocOutput := MyIni.ReadString('pgnotex', 'panoutputput', '.docx');
      pandocPath := MyIni.ReadString('pgnotex', 'panpath', '/usr/local/bin/');
      if MyIni.ReadInteger('pgnotex', 'sortcustomnotebooks', 0) = 0 then
      begin
        blSortCustomNotebooks := False;
        miNotebooksSortbyTitle.Checked := True;
        miNotebooksMoveUp.Enabled := blSortCustomNotebooks;
        miNotebooksMoveDown.Enabled := blSortCustomNotebooks;
        zqNotebooks.SQL.Clear;
        zqNotebooks.SQL.Add('Select * from Notebooks order by Title');
      end
      else
      begin
        blSortCustomNotebooks := True;
        miNotebooksSortbyCustom.Checked := True;
        miNotebooksMoveUp.Enabled := blSortCustomNotebooks;
        miNotebooksMoveDown.Enabled := blSortCustomNotebooks;
        zqNotebooks.SQL.Clear;
        zqNotebooks.SQL.Add('Select * from Notebooks order by Ord');
      end;

      if MyIni.ReadInteger('pgnotex', 'sortcustomsections', 0) = 0 then
      begin
        blSortCustomSections := False;
        miSectionsSortbyTitle.Checked := True;
        miSectionsMoveUp.Enabled := blSortCustomSections;
        miSectionsMoveDown.Enabled := blSortCustomSections;
        zqSections.SQL.Clear;
        zqSections.SQL.Add('Select * from Sections order by Title');
      end
      else
      begin
        blSortCustomSections := True;
        miSectionsSortbyCustom.Checked := True;
        miSectionsMoveUp.Enabled := blSortCustomSections;
        miSectionsMoveDown.Enabled := blSortCustomSections;
        zqSections.SQL.Clear;
        zqSections.SQL.Add('Select * from Sections order by Ord');
      end;
      if MyIni.ReadInteger('pgnotex', 'sortcustomnotes', 0) = 0 then
      begin
        blSortCustomNotes := False;
        miNotesSortByTitle.Checked := True;
        miNotesMoveUp.Enabled := blSortCustomNotes;
        miNotesMoveDown.Enabled := blSortCustomNotes;
        zqNotes.SQL.Clear;
        zqNotes.SQL.Add('Select * from Notes order by Title');
      end
      else
      if MyIni.ReadInteger('pgnotex', 'sortcustomnotes', 0) = 1 then
      begin
        blSortCustomNotes := True;
        miNotesSortByCustom.Checked := True;
        miNotesMoveUp.Enabled := blSortCustomNotes;
        miNotesMoveDown.Enabled := blSortCustomNotes;
        zqNotes.SQL.Clear;
        zqNotes.SQL.Add('Select * from Notes order by Ord');
      end
      else
      begin
        blSortCustomNotes := False;
        miNotesSortByModificationDate.Checked := True;
        miNotesMoveUp.Enabled := blSortCustomNotes;
        miNotesMoveDown.Enabled := blSortCustomNotes;
        zqNotes.SQL.Clear;
        zqNotes.SQL.Add('Select * from Notes order by Modification_Date');
      end;
    finally
      MyIni.Free;
    end;
  end;
  Disconnect;
  miPGNotex.Caption := #$EF#$A3#$BF;
  grNotebooks.FocusRectVisible := False;
  grSections.FocusRectVisible := False;
  grNotes.FocusRectVisible := False;
  grAttachments.FocusRectVisible := False;
  grTags.FocusRectVisible := False;
  grLinks.FocusRectVisible := False;
  grTasks.FocusRectVisible := False;
  grTagsList.FocusRectVisible := False;
  grFind.FocusRectVisible := False;
  sgTitles.FocusRectVisible := False;
  sgTitles.Font.Name := dbText.Font.Name;
  sgTitles.Font.Color := dbText.Font.Color;
  if IsPaintDark = False then
  begin
    clTaskGreen := clGreen;
    clTaskBlue := clBlue;
    grNotebooks.TitleFont.Color := $001ABC0F;
    grSections.TitleFont.Color := $001ABC0F;
    grNotes.TitleFont.Color := $001ABC0F;
    grTasks.TitleFont.Color := $001ABC0F;
    grAttachments.TitleFont.Color := $001ABC0F;
    grTags.TitleFont.Color := $001ABC0F;
    grLinks.TitleFont.Color := $001ABC0F;
    grTagsList.TitleFont.Color := $001ABC0F;
    grFind.TitleFont.Color := $001ABC0F;
    lbID.Font.Color := $001ABC0F;
    dbID.Font.Color := $001ABC0F;
    lbTitle.Font.Color := $001ABC0F;
    lbUserName.Font.Color := $001ABC0F;
    lbPassword.Font.Color := $001ABC0F;
    lbDbName.Font.Color := $001ABC0F;
    lbFilters.Font.Color := $001ABC0F;
    grTagsList.Font.Color := clGray;
    lbLogo.Font.Color := $001ABC0F;
    lbFound.Font.Color := $001ABC0F;
    lbInfo.Font.Color := $001ABC0F;
    lbTime.Font.Color := $001ABC0F;
  end
  else
  begin
    clTaskGreen := clLime;
    clTaskBlue := clSkyBlue;
    grNotebooks.TitleFont.Color := $0040B5F0;
    grNotebooks.SelectedColor := $00424242;
    grNotebooks.TitleStyle := tsLazarus;
    grSections.TitleFont.Color := $0040B5F0;
    grSections.SelectedColor := $00424242;
    grSections.TitleStyle := tsLazarus;
    grNotes.TitleFont.Color := $0040B5F0;
    grNotes.SelectedColor := $00424242;
    grNotes.TitleStyle := tsLazarus;
    grTasks.TitleFont.Color := $0040B5F0;
    grTasks.SelectedColor := $00424242;
    grTasks.TitleStyle := tsLazarus;
    grAttachments.TitleFont.Color := $0040B5F0;
    grAttachments.SelectedColor := $00424242;
    grAttachments.TitleStyle := tsLazarus;
    grTags.TitleFont.Color := $0040B5F0;
    grTags.SelectedColor := $00424242;
    grTags.TitleStyle := tsLazarus;
    grLinks.TitleFont.Color := $0040B5F0;
    grLinks.SelectedColor := $00424242;
    grLinks.TitleStyle := tsLazarus;
    grTagsList.TitleFont.Color := $0040B5F0;
    grTagsList.SelectedColor := $00424242;
    grTagsList.TitleStyle := tsLazarus;
    grFind.TitleFont.Color := $0040B5F0;
    grFind.SelectedColor := $00424242;
    grFind.TitleStyle := tsLazarus;
    lbID.Font.Color := $0040B5F0;
    dbID.Font.Color := $0040B5F0;
    lbTitle.Font.Color := $0040B5F0;
    lbUserName.Font.Color := $0040B5F0;
    lbPassword.Font.Color := $0040B5F0;
    lbDbName.Font.Color := $0040B5F0;
    lbFilters.Font.Color := $0040B5F0;
    grTagsList.Font.Color := clDkGray;
    lbLogo.Font.Color := $0040B5F0;
    lbFound.Font.Color := $0040B5F0;
    lbInfo.Font.Color := $0040B5F0;
    lbTime.Font.Color := $0040B5F0;
  end;
  if dateformat = 'en' then
  begin
    zqTasksSTART_DATE.DisplayFormat := 'dddd mmmm d yyyy';
    zqTasksEND_DATE.DisplayFormat := 'dddd mmmm d yyyy';
  end
  else
  begin
    zqTasksSTART_DATE.DisplayFormat := 'dddd d mmmm yyyy';
    zqTasksEND_DATE.DisplayFormat := 'dddd d mmmm yyyy';
  end;
  with grTasks.Columns[4].PickList do
  begin
    Clear;
    Add(prior1);
    Add(prior2);
    Add(prior3);
    Add(prior4);
    Add(prior5);
  end;
  with cbFields.Items do
  begin
    Clear;
    Add(find1);
    Add(find2);
    Add(find3);
    Add(find4);
    Add(find5);
    Add(find6);
    Add(find7);
  end;
  cbFields.ItemIndex := 1;
  with cbSearchRange.Items do
  begin
    Clear;
    Add(find8);
    Add(find9);
    Add(find10);
  end;
  cbSearchRange.ItemIndex := 0;
end;

procedure TfmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  MyIni: TIniFile;
begin
  if zcConnection.Connected = True then
  begin
    SaveAll;
    dbText.Clear;
    Disconnect;
  end;
  userName := edUserName.Text;
  dbName := edDbName.Text;
  try
    MyIni := TIniFile.Create(myHomeDir + myConfigFile);
    if fmMain.WindowState = wsMaximized then
    begin
      MyIni.WriteString('pgnotex', 'maximize', 'true');
    end
    else
    begin
      MyIni.WriteString('pgnotex', 'maximize', 'false');
      MyIni.WriteInteger('pgnotex', 'top', fmMain.Top);
      MyIni.WriteInteger('pgnotex', 'left', fmMain.Left);
      MyIni.WriteInteger('pgnotex', 'width', fmMain.Width);
      MyIni.WriteInteger('pgnotex', 'heigth', fmMain.Height);
    end;
    MyIni.WriteInteger('pgnotex', 'pnleft', pnLeft.Width);
    MyIni.WriteInteger('pgnotex', 'pnright', pnRight.Width);
    MyIni.WriteInteger('pgnotex', 'grnotebooks', grNotebooks.Height);
    MyIni.WriteInteger('pgnotex', 'grsections', grSections.Height);
    MyIni.WriteInteger('pgnotex', 'grattachments', grAttachments.Height);
    MyIni.WriteInteger('pgnotex', 'grlinks', grLinks.Height);
    MyIni.WriteString('pgnotex', 'host', zcConnection.HostName);
    MyIni.WriteInteger('pgnotex', 'port', zcConnection.Port);
    MyIni.WriteString('pgnotex', 'libloc', zcConnection.LibraryLocation);
    MyIni.WriteString('pgnotex', 'fontname', dbText.Font.Name);
    MyIni.WriteInteger('pgnotex', 'fontsize', dbText.Font.Size);
    MyIni.WriteInteger('pgnotex', 'fonttitlessize', sgTitles.Font.Size);
    MyIni.WriteString('pgnotex', 'fontcolor', ColorToString(dbText.Font.Color));
    MyIni.WriteString('pgnotex', 'title1', ColorToString(clTitle1));
    MyIni.WriteString('pgnotex', 'title2', ColorToString(clTitle2));
    MyIni.WriteString('pgnotex', 'title3', ColorToString(clTitle3));
    MyIni.WriteInteger('pgnotex', 'maxsize', iMaxSize);
    MyIni.WriteInteger('pgnotex', 'linespacing', iLineSpacing);
    MyIni.WriteInteger('pgnotex', 'parspacing', iParSpacing);
    if miToolsTrans0.Checked = True then
    begin
      MyIni.WriteInteger('pgnotex', 'trans', 0);
    end
    else
    if miToolsTrans1.Checked = True then
    begin
      MyIni.WriteInteger('pgnotex', 'trans', 1);
    end
    else
    if miToolsTrans2.Checked = True then
    begin
      MyIni.WriteInteger('pgnotex', 'trans', 2);
    end
    else
    if miToolsTrans3.Checked = True then
    begin
      MyIni.WriteInteger('pgnotex', 'trans', 3);
    end;
    if blNumTitles = True then
    begin
      MyIni.WriteInteger('pgnotex', 'numtitles', 1);
    end
    else
    begin
      MyIni.WriteInteger('pgnotex', 'numtitles', 0);
    end;
    if blAutosave = True then
    begin
      MyIni.WriteInteger('pgnotex', 'autosave', 1);
    end
    else
    begin
      MyIni.WriteInteger('pgnotex', 'autosave', 0);
    end;
    if iLastNotebook > 0 then
    begin
      MyIni.WriteInteger('pgnotex', 'lastnotebook', iLastNotebook);
    end;
    if iLastSection > 0 then
    begin
      MyIni.WriteInteger('pgnotex', 'lastsection', iLastSection);
    end;
    if iLastNote > 0 then
    begin
      MyIni.WriteInteger('pgnotex', 'lastnote', iLastNote);
    end;
    MyIni.WriteString('pgnotex', 'username', userName);
    MyIni.WriteString('pgnotex', 'dbname', dbName);
    MyIni.WriteString('pgnotex', 'panoption', pandocOptions);
    MyIni.WriteString('pgnotex', 'pantemplate', pandocTemplate);
    MyIni.WriteString('pgnotex', 'panoutputput', pandocOutput);
    MyIni.WriteString('pgnotex', 'panpath', pandocPath);
    if blSortCustomNotebooks = False then
    begin
      MyIni.WriteInteger('pgnotex', 'sortcustomnotebooks', 0);
    end
    else
    begin
      MyIni.WriteInteger('pgnotex', 'sortcustomnotebooks', 1);
    end;
    if blSortCustomSections = False then
    begin
      MyIni.WriteInteger('pgnotex', 'sortcustomsections', 0);
    end
    else
    begin
      MyIni.WriteInteger('pgnotex', 'sortcustomsections', 1);
    end;
    if miNotesSortByTitle.Checked = True then
    begin
      MyIni.WriteInteger('pgnotex', 'sortcustomnotes', 0)      ;
    end
    else
    if miNotesSortbyCustom.Checked = True then
    begin
      MyIni.WriteInteger('pgnotex', 'sortcustomnotes', 1);
    end
    else
    begin
      MyIni.WriteInteger('pgnotex', 'sortcustomnotes', 2);
    end;
    if DirectoryExistsUTF8(GetNotexTempDir) = True then
    begin
      DeleteDirectory(GetNotexTempDir, False);
    end;
  finally
    MyIni.Free;
  end;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    setContinuousSpellCheckingEnabled(True);
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    setGrammarCheckingEnabled(False);
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    setFocusRingType(1);
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    setAutomaticQuoteSubstitutionEnabled(True);
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    setSmartInsertDeleteEnabled(True);
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    setAutomaticLinkDetectionEnabled(True);
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    setImportsGraphics(False);
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
end;

procedure TfmMain.FormResize(Sender: TObject);
begin
  if pnLogin.Visible = True then
  begin
    if fmMain.WindowState = wsMaximized then
    begin
      pnlogin.Left := (Screen.Width - pnLogin.Width) div 2;
      pnLogin.Top := (Screen.Height - PnLogin.Height) div 2;
    end
    else
    begin
      pnlogin.Left := (fmMain.Width - pnLogin.Width) div 2;
      pnLogin.Top := (fmMain.Height - PnLogin.Height) div 2;
    end;
  end;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  edUserName.Text := userName;
  edDbName.Text := dbName;
  if dbName = '' then
  begin
    if edDbName.Visible = True then
    begin
      edDbName.SetFocus;
    end;
  end
  else
  begin
    if edPassword.Visible = True then
    begin
      edPassword.SetFocus;
    end;
  end;
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    setRichText(True);
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    textContainer.setLineFragmentPadding(30);
end;

procedure TfmMain.FormDropFiles(Sender: TObject; const FileNames: array of string);
var
  myFile: string;
begin
  if zqNotes.RecordCount = 0 then
    Abort;
  for myFile in FileNames do
  begin
    zqAttachments.Append;
    zqAttachments.Edit;
    zqAttachmentsATTACHMENT.LoadFromFile(myFile);
    zqAttachmentsTITLE.Value :=
      StringReplace(ExtractFileName(myFile), #39, '', [rfReplaceAll]);
    zqAttachments.Post;
  end;
end;

procedure TfmMain.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if pnMain.Visible = False then
    Exit;
  if ((key > 47) and (key < 58) and (Shift = [ssMeta, ssAlt])) then
  begin
    if zqNotesID.AsString <> '' then
    begin
      fmBookmarks.sgBookmarks.Cells[1, key - 48] := zqNotebooksID.AsString;
      fmBookmarks.sgBookmarks.Cells[2, key - 48] := zqSectionsID.AsString;
      fmBookmarks.sgBookmarks.Cells[3, key - 48] := zqNotesID.AsString;
      fmBookmarks.sgBookmarks.Cells[4, key - 48] := zqNotebooksTITLE.Value;
      fmBookmarks.sgBookmarks.Cells[5, key - 48] := zqSectionsTITLE.Value;
      fmBookmarks.sgBookmarks.Cells[6, key - 48] := zqNotesTITLE.Value;
    end;
    key := 0;
  end
  else if ((key > 47) and (key < 58) and (Shift = [ssMeta])) then
  begin
    if fmBookmarks.sgBookmarks.Cells[1, key - 48] <> '' then
    begin
      SaveAll;
      blLoadNotes := False;
      zqNotebooks.Locate('ID', fmBookmarks.sgBookmarks.Cells[1, key - 48], []);
      zqSections.Locate('ID', fmBookmarks.sgBookmarks.Cells[2, key - 48], []);
      blLoadNotes := True;
      if zqNotes.Locate('ID', fmBookmarks.sgBookmarks.Cells[3, key - 48], []) =
        False then
      begin
        dsNotesDataChange(nil, nil);
        MessageDlg(msg048, mtWarning, [mbOK], 0);
      end;
      pcPageControl.ActivePageIndex := 0;
      if dbText.Visible = True then
      begin
        dbText.SetFocus;
      end;
    end;
    key := 0;
  end
  else
  if ((key = 187) and (Shift = [ssMeta, ssCtrl, ssAlt])) then
  begin
    if iParSpacing < 50 then
    begin
      iParSpacing := iParSpacing + 1;
      FormatListTitles(False, True);
    end;
    key := 0;
  end
  else
  if ((key = 189) and (Shift = [ssMeta, ssCtrl, ssAlt])) then
  begin
    if iParSpacing > 0 then
    begin
      iParSpacing := iParSpacing - 1;
      FormatListTitles(False, True);
    end;
    key := 0;
  end
  else
  if ((key = 187) and (Shift = [ssMeta, ssCtrl])) then
  begin
    if iLineSpacing < 30 then
    begin
      iLineSpacing := iLineSpacing + 1;
      FormatListTitles(False, True);
    end;
    key := 0;
  end
  else
  if ((key = 189) and (Shift = [ssMeta, ssCtrl])) then
  begin
    if iLineSpacing > -10 then
    begin
      iLineSpacing := iLineSpacing - 1;
      FormatListTitles(False, True);
    end;
    key := 0;
  end
  else
  if ((key = 187) and (Shift = [ssMeta])) then
  begin
    if dbText.Font.Size < 128 then
    begin
      dbText.Font.Size := dbText.Font.Size + 1;
    end;
    if sgTitles.Font.Size < 128 then
    begin
      sgTitles.Font.Size := sgTitles.Font.Size + 1;
    end;
    FormatListTitles(False, True);
    key := 0;
  end
  else
  if ((key = 189) and (Shift = [ssMeta])) then
  begin
    if dbText.Font.Size > 6 then
    begin
      dbText.Font.Size := dbText.Font.Size - 1;
    end;
    if sgTitles.Font.Size > 6 then
    begin
      sgTitles.Font.Size := sgTitles.Font.Size - 1;
    end;
    FormatListTitles(False, True);
    key := 0;
  end
  else
  if ((key = 33) and (Shift = [ssMeta])) then
  begin
    zqNotes.Prior;
    key := 0;
  end
  else
  if ((key = 34) and (Shift = [ssMeta])) then
  begin
    zqNotes.Next;
    key := 0;
  end
  else
  if ((key = 33) and (Shift = [ssShift, ssAlt, ssMeta])) then
  begin
    zqNotebooks.Prior;
    key := 0;
  end
  else
  if ((key = 34) and (Shift = [ssShift, ssAlt, ssMeta])) then
  begin
    zqNotebooks.Next;
    key := 0;
  end
  else
  if ((key = 33) and (Shift = [ssAlt, ssMeta])) then
  begin
    zqSections.Prior;
    key := 0;
  end
  else
  if ((key = 34) and (Shift = [ssAlt, ssMeta])) then
  begin
    zqSections.Next;
    key := 0;
  end
  else
  if ((key = Ord('Y')) and (Shift = [ssMeta])) then
  begin
    if miToolsShowEditor.Checked = True then
    begin
      miToolsShowEditorClick(nil);
    end;
    pcPageControl.ActivePageIndex := 0;
    key := 0;
  end
  else
  if ((key = Ord('Y')) and (Shift = [ssAlt, ssMeta])) then
  begin
    if miToolsShowEditor.Checked = True then
    begin
      miToolsShowEditorClick(nil);
    end;
    pcPageControl.ActivePageIndex := 1;
    key := 0;
  end;
end;

procedure TfmMain.edPasswordKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
  begin
    key := #0;
    Connect;
  end;
end;

procedure TfmMain.appgNotexException(Sender: TObject; E: Exception);
begin
  MessageDlg(msg001 + LineEnding + LineEnding + E.Message + '.',
    mtWarning, [mbOK], 0);
end;

procedure TfmMain.dbTextKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
var
  iNum: integer = 0;
  iPos, iTest, iLine, i: integer;
  myRect: NSRect;
  stClip, stHead: string;
  flCanMove: boolean;
begin
  if ((zqNotes.RecordCount = 0) and not (ssMeta in Shift)) then
  begin
    key := 0;
  end
  else
  if ((key = Ord(' ')) and (Shift <> [])) then
  begin
    key := 0;
  end
  else
  if ((key = Ord('V')) and (Shift = [ssMeta])) then
  begin
    miEditPasteClick(nil);
    key := 0;
  end
  else
  if ((key = Ord('C')) and (Shift = [ssMeta])) then
  begin
    miEditCopyClick(nil);
    key := 0;
  end
  else
  if ((key = Ord('A')) and (Shift = [ssMeta])) then
  begin
    // Workaround to prevent formatting clearing
    sgTitles.SetFocus;
    miEditSelectAllClick(nil);
    key := 0;
  end
  else
  if ((key = Ord('A')) and (Shift = [ssMeta, ssAlt])) then
  begin
    if dateformat = 'en' then
    begin
      InsText(formatDateTime('dddd mmmm d yyyy', Now()));
    end
    else
    begin
      InsText(formatDateTime('dddd d mmmm yyyy', Now()));
    end;
    key := 0;
  end
  else
  if ((key = Ord('A')) and (Shift = [ssMeta, ssAlt, ssShift])) then
  begin
    if dateformat = 'en' then
    begin
      InsText(formatDateTime('dddd mmmm d yyyy"," hh.nn', Now()));
    end
    else
    begin
      InsText(formatDateTime('dddd d mmmm yyyy"," hh.nn', Now()));
    end;
    key := 0;
  end
  else
  if ((key = 8) and (Shift = [ssMeta, ssShift])) then
  begin
    if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2) = '# ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 3) = '## ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 4) = '### ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 5) = '#### ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 6) = '##### ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 7) = '###### ')) then
    begin
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        selectParagraph(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        Delete(nil);
      tmTitlesTimer.AutoEnabled := True;
    end
    else
    if (((TryStrToInt(UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 1), iTest) =
      True) and (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 2, 2) = '. ')) or
      ((TryStrToInt(UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2), iTest) =
      True) and (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 3, 2) = '. '))) then
    begin
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        selectParagraph(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        Delete(nil);
      RenumberList(False);
    end
    else
    begin
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        selectParagraph(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        Delete(nil);
    end;
    key := 0;
  end
  else
  if ((key = Ord('F')) and (Shift = [ssMeta, ssAlt])) then
  begin
    SelectInsertFootnote;
    key := 0;
  end
  else
  if ((key = 190) and (Shift = [ssMeta, ssAlt])) then // It's the dot
  begin
    SetLists;
    dbTextChange(nil);
    key := 0;
  end
  else
  if ((key = Ord('Z')) and (Shift = [ssAlt, ssMeta])) then
  begin
    if MessageDlg(msg002, mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
    begin
      zqNotes.CancelUpdates;
      dbText.Text := zqNotesTEXT.Value;
      dbText.SelStart := 0;
      FormatListTitles(True, True);
    end;
    key := 0;
  end
  else
  if ((key = 38) and (Shift = [ssCtrl, ssMeta])) then
  begin
    key := 0;
    if dbText.CaretPos.y >= dbText.Lines.Count - 1 then
    begin
      iPos := dbText.SelStart;
      dbText.Lines.Add('');
      dbText.SelStart := iPos;
    end;
    if (((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2) <> '# ') and
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 3) <> '## ') and
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 4) <> '### ') and
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 5) <> '#### ') and
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 6) <> '##### ') and
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 7) <> '###### ')) or
      (dbText.CaretPos.y = 0)) then
    begin
      Exit;
    end;
    stHead := UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1,
      UTF8Pos(' ', dbText.Lines[dbText.CaretPos.Y]));
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      moveToBeginningOfParagraph(nil);
    iPos := dbText.SelStart;
    flCanMove := False;
    for i := dbText.CaretPos.Y - 1 downto 0 do
    begin
      if CanMove(UTF8Copy(dbText.Lines[i], 1, UTF8Pos(' ', dbText.Lines[i])),
        stHead) = True then
      begin
        flCanMove := True;
        Break;
      end;
      iPos := iPos - StrToNSString(dbText.Lines[i], True).length - 1;
    end;
    iPos := iPos - StrToNSString(dbText.Lines[i], True).length - 1;
    if flCanMove = True then
    begin
      iLine := dbText.CaretPos.Y;
      dbText.Lines.Move(iLine, i);
      Inc(i);
      Inc(iLine);
      while ((CanMove(UTF8Copy(dbText.Lines[iLine], 1, UTF8Pos(' ',
          dbText.Lines[iLine])), stHead) = False)  and
          (iLine <= dbText.Lines.Count - 1)) do
      begin
        dbText.Lines.Move(iLine, i);
        Inc(i);
        Inc(iLine);
      end;
      dbText.SelStart := iPos;
      FormatListTitles(True, True);
    end;
  end
  else
  if ((key = 40) and (Shift = [ssCtrl, ssMeta])) then
  begin
    key := 0;
    if dbText.CaretPos.y >= dbText.Lines.Count - 1 then
    begin
      iPos := dbText.SelStart;
      dbText.Lines.Add('');
      dbText.SelStart := iPos;
    end;
    if (((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2) <> '# ') and
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 3) <> '## ') and
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 4) <> '### ') and
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 5) <> '#### ') and
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 6) <> '##### ') and
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 7) <> '###### ')) or
      (dbText.CaretPos.y >= dbText.Lines.Count - 1)) then
    begin
      Exit;
    end;
    stHead := UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1,
      UTF8Pos(' ', dbText.Lines[dbText.CaretPos.Y]));
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      moveToBeginningOfParagraph(nil);
    iPos := dbText.SelStart;
    flCanMove := False;
    for i := dbText.CaretPos.Y + 1 to dbText.Lines.Count - 1 do
    begin
      if CanMove(UTF8Copy(dbText.Lines[i], 1, UTF8Pos(' ',
        dbText.Lines[i])), stHead) = True then
      begin
        flCanMove := True;
        Break;
      end;
    end;
    iPos := iPos + StrToNSString(dbText.Lines[i], True).length + 1;
    if flCanMove = True then
    begin
      Inc(i);
      while ((CanMove(UTF8Copy(dbText.Lines[i], 1, UTF8Pos(' ',
          dbText.Lines[i])), stHead) = False) and
          (i <= dbText.Lines.Count - 1)) do
      begin
        iPos := iPos + StrToNSString(dbText.Lines[i], True).length + 1;
        Inc(i);
      end;
      Dec(i);
      iLine := dbText.CaretPos.Y;
      dbText.Lines.Move(iLine, i);
      while ((CanMove(UTF8Copy(dbText.Lines[iLine], 1, UTF8Pos(' ',
          dbText.Lines[iLine])), stHead) = False) and
          (iLine <= dbText.Lines.Count - 1)) do
      begin
        dbText.Lines.Move(iLine, i);
      end;
      dbText.SelStart := iPos;
      FormatListTitles(True, True);
    end;
  end
  else
  if ((key = 38) and (Shift = [ssAlt, ssMeta])) then
  begin
    if dbText.CaretPos.y > 0 then
    begin
      if dbText.CaretPos.y >= dbText.Lines.Count - 1 then
      begin
        iPos := dbText.SelStart;
        dbText.Lines.Add('');
        dbText.SelStart := iPos;
      end;
      stClip := Clipboard.AsText;
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        selectParagraph(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        copy_(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        Delete(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        moveToBeginningOfParagraph(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        moveBackward(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        moveToBeginningOfParagraph(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        paste(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        moveBackward(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        moveToBeginningOfParagraph(nil);
      Clipboard.AsText := stClip;
      if (((TryStrToInt(UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 1), iTest) =
        True) and (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 2, 2) = '. ')) or
        ((TryStrToInt(UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2), iTest) =
        True) and (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 3, 2) = '. '))) then
      begin
        RenumberList(False);
      end;
      if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2) = '# ') or
        (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 3) = '## ') or
        (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 4) = '### ') or
        (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 5) = '#### ') or
        (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 6) = '##### ') or
        (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 7) = '###### ')) then
      begin
        FormatListTitles(True, True);
      end;
      dbTextChange(nil);
    end;
    key := 0;
  end
  else
  if ((key = 39) and (Shift = [ssCtrl, ssMeta])) then
  begin
    if dbText.CaretPos.y = dbText.Lines.Count then
    begin
      iPos := dbText.SelStart;
      dbText.Lines.Add('');
      dbText.SelStart := iPos;
    end;
    if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2) = '# ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 3) = '## ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 4) = '### ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 5) = '#### ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 6) = '##### ')) then
      begin
        iPos := dbText.SelStart;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          moveToBeginningOfParagraph(nil);
        InsText('#');
        FormatListTitles(True, True);
        dbText.SelStart := iPos + 1;
      end
      else
      if dbText.Lines[dbText.CaretPos.Y] = '' then
      begin
        InsText('# ');
        FormatListTitles(True, True);
      end;
    key := 0;
  end
  else
  if ((key = 37) and (Shift = [ssCtrl, ssMeta])) then
  begin
    if dbText.CaretPos.y = dbText.Lines.Count then
    begin
      iPos := dbText.SelStart;
      dbText.Lines.Add('');
      dbText.SelStart := iPos;
    end;
    if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 3) = '## ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 4) = '### ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 5) = '#### ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 6) = '##### ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 7) = '###### ')) then
    begin
      iPos := dbText.SelStart;
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        moveToBeginningOfParagraph(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        deleteForward(nil);
      FormatListTitles(True, True);
      dbText.SelStart := iPos - 1;
    end;
    key := 0;
  end
  else
  if ((key = 40) and (Shift = [ssAlt, ssMeta])) then
  begin
    if dbText.CaretPos.y < dbText.Lines.Count - 1 then
    begin
      stClip := Clipboard.AsText;
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        selectParagraph(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        copy_(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        Delete(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        moveToEndOfParagraph(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        moveForward(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        paste(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        moveBackward(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        moveToBeginningOfParagraph(nil);
      Clipboard.AsText := stClip;
      if (((TryStrToInt(UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 1), iTest) =
        True) and (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 2, 2) = '. ')) or
        ((TryStrToInt(UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2), iTest) =
        True) and (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 3, 2) = '. '))) then
      begin
        RenumberList(False);
      end;
      if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2) = '# ') or
        (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 3) = '## ') or
        (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 4) = '### ') or
        (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 5) = '#### ') or
        (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 6) = '##### ') or
        (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 7) = '###### ')) then
      begin
        FormatListTitles(True, True);
      end;
      dbTextChange(nil);
    end;
    key := 0;
  end
  else
  if ((key = 8) or (key = 46)) then
  begin
    dbTextChange(nil);
  end
  else
  if ((key = Ord('S')) and (Shift = [ssMeta])) then
  begin
    if miFileSave.Enabled = False then
    begin
      key := 0;
    end;
  end
  else
  // the key changes the selection of the link, so...
  if ((key = Ord('R')) and (Shift = [ssMeta, ssAlt, ssShift])) then
  begin
    miEditEncodeLinksClick(nil);
    key := 0;
  end
  else
  if key = 13 then
  begin
    if ((dbText.SelStart = StrToNSString(dbText.Text, True).length) and
      ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 2) = '* ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 2) = '• ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 2) = '- ') or
      (UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 2) = '+ ') or
      (TryStrToInt(UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1,
      UTF8CocoaPos('. ', dbText.Lines[dbText.CaretPos.Y - 1]) - 1), iNum) = True)))
    then
    begin
      InsText(LineEnding);
      dbText.SelStart := dbText.SelStart - 1;
    end;
    if ((dbText.Lines[dbText.CaretPos.Y] = '* ') or
      (dbText.Lines[dbText.CaretPos.Y] = '• ') or
      (dbText.Lines[dbText.CaretPos.Y] = '- ') or
      (dbText.Lines[dbText.CaretPos.Y] = '+ ')) then
    begin
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        selectParagraph(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        Delete(nil);
      InsText(LineEnding);
      Key := 0;
    end
    else
    if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2) = '* ') and
      (StrToNSString(dbText.Lines[dbText.CaretPos.Y], True).length > 2) and
      (UTF8Copy(dbText.Text, dbText.SelStart + 1, 2) <> '* ')) then
    begin
      if dbText.SelStart = StrToNSString(dbText.Text, True).length then
      begin
        InsText(LineEnding + '* ' + LineEnding);
        dbText.SelStart := dbText.SelStart - UTF8Length(LineEnding);
      end
      else
      begin
        InsText(LineEnding + '* ');
      end;
      Key := 0;
    end
    else
    if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2) = '• ') and
      (StrToNSString(dbText.Lines[dbText.CaretPos.Y], True).length > 2) and
      (UTF8Copy(dbText.Text, dbText.SelStart + 1, 2) <> '• ')) then
    begin
      if dbText.SelStart = StrToNSString(dbText.Text, True).length then
      begin
        InsText(LineEnding + '• ' + LineEnding);
        dbText.SelStart := dbText.SelStart - UTF8Length(LineEnding);
      end
      else
      begin
        InsText(LineEnding + '• ');
      end;
      Key := 0;
    end
    else
    if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2) = '- ') and
      (StrToNSString(dbText.Lines[dbText.CaretPos.Y], True).length > 2) and
      (UTF8Copy(dbText.Text, dbText.SelStart + 1, 2) <> '- ')) then
    begin
      if dbText.SelStart = StrToNSString(dbText.Text, True).length then
      begin
        InsText(LineEnding + '- ' + LineEnding);
        dbText.SelStart := dbText.SelStart - UTF8Length(LineEnding);
      end
      else
      begin
        InsText(LineEnding + '- ');
      end;
      Key := 0;
    end
    else
    if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2) = '+ ') and
      (StrToNSString(dbText.Lines[dbText.CaretPos.Y], True).length > 2) and
      (UTF8Copy(dbText.Text, dbText.SelStart + 1, 2) <> '+ ')) then
    begin
      if dbText.SelStart = StrToNSString(dbText.Text, True).length then
      begin
        InsText(LineEnding + '+ ' + LineEnding);
        dbText.SelStart := dbText.SelStart - UTF8Length(LineEnding);
      end
      else
      begin
        InsText(LineEnding + '+ ');
      end;
      Key := 0;
    end
    else
    if ((TryStrToInt(UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1,
      UTF8CocoaPos('. ', dbText.Lines[dbText.CaretPos.Y]) - 1), iNum) = True) and
      (dbText.Lines[dbText.CaretPos.Y] = IntToStr(iNum) + '. ')) then
    begin
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        selectParagraph(nil);
      TCocoaTextView(NSScrollView(dbText.Handle).documentView).
        Delete(nil);
      InsText(LineEnding);
      Key := 0;
    end
    else
    if (TryStrToInt(UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1,
      UTF8CocoaPos('. ', dbText.Lines[dbText.CaretPos.Y]) - 1), iNum) =
      True and (UTF8Copy(dbText.Text, dbText.SelStart + 1, UTF8Length(IntToStr(iNum))) <>
      IntToStr(iNum))) then
    begin
      if dbText.SelStart = StrToNSString(dbText.Text, True).length then
      begin
        InsText(LineEnding + IntToStr(iNum + 1) + '. ' + LineEnding);
        dbText.SelStart := dbText.SelStart - UTF8Length(LineEnding);
      end
      else
      begin
        InsText(LineEnding + IntToStr(iNum + 1) + '. ');
      end;
      myRect := TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
        visibleRect;
      RenumberList(False);
      TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
        scrollRectToVisible(myRect);
      Key := 0;
    end;
  end;
end;

procedure TfmMain.dbTextKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
var
  rng: NSRange;
begin
  if key in [16, 17, 18, 20, 27, 33, 34, 35, 36, 37, 38, 39, 40, 45, 91, 234] then
  begin
    Exit;
  end
  else
  if ((key = Ord('R')) and (Shift = [ssMeta])) then
  begin
    Exit;
  end
  else
  // To avoid the text copied to be in clTitle
  if ((key = Ord('C')) and (Shift = [ssMeta])) then
  begin
    Exit;
  end
  else
  if ((key = 13) and
    (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 1) = '#') and
    (dbText.Lines[dbText.CaretPos.Y - 1] = '')) then
  begin
    dbText.SelStart := dbText.SelStart - 1;
    InsText(' ');
    rng := TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      textStorage.string_.paragraphRangeForRange(TCocoaTextView(
      NSScrollView(fmMain.dbText.Handle).documentView).selectedRange);
    TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      setTextColor_range(ColorToNSColor(dbText.Font.Color), rng);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      deleteBackward(nil);
    dbText.SelStart := dbText.SelStart + 1;
  end
  else
  if ((key = 13) and
    (dbText.SelStart = StrToNSString(dbText.Text, True).length)) then
  begin
    InsText(' ');
    rng := TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      textStorage.string_.paragraphRangeForRange(TCocoaTextView(
      NSScrollView(fmMain.dbText.Handle).documentView).selectedRange);
    TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      setTextColor_range(ColorToNSColor(dbText.Font.Color), rng);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      deleteBackward(nil);
  end
  else
  if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 2) = '# ') or
    ((dbText.SelStart = StrToNSString(dbText.Text, True).length) and
    ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 2) = '# ')))) then
  begin
    rng := TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      textStorage.string_.paragraphRangeForRange(TCocoaTextView(
      NSScrollView(fmMain.dbText.Handle).documentView).selectedRange);
    TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      setTextColor_range(ColorToNSColor(clTitle1), rng);
    dbText.SelStart := dbText.SelStart - 1;
    dbText.SelStart := dbText.SelStart + 1;
    tmTitlesTimer.AutoEnabled := True;
  end
  else
  if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 3) = '## ') or
    ((dbText.SelStart = StrToNSString(dbText.Text, True).length) and
    ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 3) = '## ')))) then
  begin
    rng := TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      textStorage.string_.paragraphRangeForRange(TCocoaTextView(
      NSScrollView(fmMain.dbText.Handle).documentView).selectedRange);
    TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      setTextColor_range(ColorToNSColor(clTitle2), rng);
    dbText.SelStart := dbText.SelStart - 1;
    dbText.SelStart := dbText.SelStart + 1;
    tmTitlesTimer.AutoEnabled := True;
  end
  else
  if ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 4) = '### ') or
    (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 5) = '#### ') or
    (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 6) = '##### ') or
    (UTF8Copy(dbText.Lines[dbText.CaretPos.Y], 1, 7) = '###### ') or
    ((dbText.SelStart = StrToNSString(dbText.Text, True).length) and
    ((UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 4) = '### ') or
    (UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 5) = '#### ') or
    (UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 6) = '##### ') or
    (UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 7) = '###### ')))) then
  begin
    rng := TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      textStorage.string_.paragraphRangeForRange(TCocoaTextView(
      NSScrollView(fmMain.dbText.Handle).documentView).selectedRange);
    TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      setTextColor_range(ColorToNSColor(clTitle3), rng);
    dbText.SelStart := dbText.SelStart - 1;
    dbText.SelStart := dbText.SelStart + 1;
    tmTitlesTimer.AutoEnabled := True;
  end
  else
  if ((dbText.CaretPos.Y < iEndHeading) and
    (UTF8CocoaPos(':', dbText.Lines[dbText.CaretPos.Y]) > 0)) then
  begin
    rng := TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      textStorage.string_.paragraphRangeForRange(TCocoaTextView(
      NSScrollView(fmMain.dbText.Handle).documentView).selectedRange);
    TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      setTextColor_range(ColorToNSColor(dbText.Font.Color), rng);
    rng.length := UTF8CocoaPos(':', dbText.Lines[dbText.CaretPos.Y]);
    TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      setTextColor_range(ColorToNSColor(clTitle1), rng);
  end
  else
  begin
    rng := TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      textStorage.string_.paragraphRangeForRange(TCocoaTextView(
      NSScrollView(fmMain.dbText.Handle).documentView).selectedRange);
    TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      setTextColor_range(ColorToNSColor(dbText.Font.Color), rng);
    if UTF8Copy(dbText.Lines[dbText.CaretPos.Y - 1], 1, 1) = '#' then
    begin
      dbText.SelStart := dbText.SelStart - 1;
      dbText.SelStart := dbText.SelStart + 1;
    end;
  end;
  UpdateInfo;
end;

procedure TfmMain.sgTitlesClick(Sender: TObject);
begin
  SelectTitle;
end;

procedure TfmMain.sgTitlesDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
begin
  if UTF8Copy(sgTitles.Cells[0, aRow], 1, 6) = '      ' then
  begin
    sgTitles.Canvas.Font.Color := clTitle3;
  end
  else
  if UTF8Copy(sgTitles.Cells[0, aRow], 1, 3) = '   ' then
  begin
    sgTitles.Canvas.Font.Color := clTitle2;
  end
  else
  begin
    sgTitles.Canvas.Font.Color := clTitle1;
  end;
  sgTitles.canvas.FillRect(aRect);
  sgTitles.Canvas.TextOut(aRect.Left + 2, aRect.Top + 2,
    sgTitles.Cells[aCol, aRow]);
end;

procedure TfmMain.sgTitlesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((key = Ord('C')) and (Shift = [ssMeta])) then
  begin
    miEditCopyClick(nil);
  end;
  key := 0;
end;

procedure TfmMain.sgTitlesMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
var
  Row: integer;
  Col: integer;
begin
  sgTitles.MouseToCell(X, Y, Col, Row);
  if ((Row >= 0) and (Col >= 0) and
    (sgTitles.Canvas.TextWidth(sgTitles.Cells[Col, Row]) > sgTitles.Width)) then
  begin
    sgTitles.Hint := sgTitles.Cells[Col, Row];
  end;
end;

procedure TfmMain.grTasksDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if zqTasks.FieldByName('DONE').AsInteger = 1 then
  begin
    grTasks.Canvas.Font.Color := clTaskGreen;
  end
  else if ((zqTasks.FieldByName('END_DATE').IsNull = False) and
    (zqTasks.FieldByName('END_DATE').AsDateTime < Date)) then
  begin
    grTasks.canvas.Font.Color := clRed;
  end
  else if ((zqTasks.FieldByName('START_DATE').IsNull = False) and
    (zqTasks.FieldByName('START_DATE').AsDateTime <= Date)) then
  begin
    grTasks.canvas.Font.Color := clTaskBlue;
  end;
  grTasks.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfmMain.grTasksGetCellHint(Sender: TObject; Column: TColumn;
  var AText: string);
var
  myDate: TDate;
begin
  if ((Column.DesignIndex = 1) or (Column.DesignIndex = 2)) then
  begin
    if TryStrToDate(Column.Field.AsString, myDate) = True then
    begin
      if grTasks.Canvas.TextWidth(FormatDateTime('dddd mmmm d yyyy', myDate)) >
        Column.Width then
      begin
        if dateformat = 'en' then
        begin
          AText := FormatDateTime('dddd mmmm d yyyy', myDate);
        end
        else
        begin
          AText := FormatDateTime('dddd d mmmm yyyy', myDate);
        end;
      end;
    end;
  end
  else
  begin
    if grTasks.Canvas.TextWidth(Column.Field.AsString) > Column.Width then
    begin
      AText := Column.Field.AsString;
    end;
  end;
end;

procedure TfmMain.grAttachmentsDblClick(Sender: TObject);
begin
  if zqAttachments.RecordCount > 0 then
  begin
    miNotesAttachmentsOpenClick(nil);
  end;
end;

procedure TfmMain.grAttachmentsGetCellHint(Sender: TObject; Column: TColumn;
  var AText: string);
begin
  if grAttachments.Canvas.TextWidth(Column.Field.AsString) > grAttachments.Width then
  begin
    AText := Column.Field.AsString;
  end;
end;

procedure TfmMain.grFindDblClick(Sender: TObject);
var
  rng: NSRange;
begin
  if zqFind.Active = False then
  begin
    Exit;
  end;
  if zqFind.RecordCount > 0 then
  begin
    blLoadNotes := False;
    zqNotebooks.Locate('ID', zqFindIDNOTEBOOKS.Value, []);
    zqSections.Locate('ID', zqFindIDSECTIONS.Value, []);
    zqNotes.Locate('ID', zqFindIDNOTES.Value, []);
    blLoadNotes := True;
    zqNotesAfterScroll(nil);
    if cbFields.ItemIndex = 1 then
    begin
      dbText.SelStart := UTF8CocoaPos(UTF8LowerCase(edFind.Text),
        UTF8LowerCase(dbText.Text)) - 1;
      Application.ProcessMessages;
      rng.location := UTF8CocoaPos(UTF8LowerCase(edFind.Text),
        UTF8LowerCase(dbText.Text)) - 1;
      rng.length := StrToNSString(edFind.Text, True).length;
      TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
        showFindIndicatorForRange(rng);
    end;
    if cbFields.ItemIndex = 5 then
    begin
      pcPageControl.ActivePageIndex := 1;
      try
        zqTasks.DisableControls;
        zqTasks.First;
        while zqTasks.EOF = False do
        begin
          if UTF8CocoaPos(UTF8LowerCase(edFind.Text),
            UTF8LowerCase(zqTasksTITLE.Value)) > 0 then
          begin
            Break;
          end;
          zqTasks.Next;
        end;
      finally
        zqTasks.EnableControls;
      end;
    end
    else
    begin
      pcPageControl.ActivePageIndex := 0;
    end;
  end;
end;

procedure TfmMain.grFindKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    key := 0;
    grFindDblClick(nil);
  end;
end;

procedure TfmMain.grTasksKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
var
  idxPriority: integer;
begin
  if zqTasks.RecordCount = 0 then
    Exit;
  if grTasks.SelectedColumn.FieldName = 'START_DATE' then
  begin
    if key = 32 then
    begin
      zqTasks.Edit;
      zqTasksSTART_DATE.Value := Date;
      zqTasksEND_DATE.Value := Date + 7;
      zqTasks.Post;
      key := 0;
    end
    else if ((key = 37) and (Shift = [ssShift])) then
    begin
      zqTasks.Edit;
      zqTasksSTART_DATE.Value := zqTasksSTART_DATE.Value - 1;
      zqTasks.Post;
      key := 0;
    end
    else if ((key = 39) and (Shift = [ssShift])) then
    begin
      zqTasks.Edit;
      zqTasksSTART_DATE.Value := zqTasksSTART_DATE.Value + 1;
      zqTasks.Post;
      key := 0;
    end;
  end
  else
  if grTasks.SelectedColumn.FieldName = 'END_DATE' then
  begin
    if key = 32 then
    begin
      zqTasks.Edit;
      zqTasksSTART_DATE.Value := Date;
      zqTasksEND_DATE.Value := Date + 7;
      zqTasks.Post;
      key := 0;
    end
    else if ((key = 37) and (Shift = [ssShift])) then
    begin
      zqTasks.Edit;
      zqTasksEND_DATE.Value := zqTasksEND_DATE.Value - 1;
      zqTasks.Post;
      key := 0;
    end
    else if ((key = 39) and (Shift = [ssShift])) then
    begin
      zqTasks.Edit;
      zqTasksEND_DATE.Value := zqTasksEND_DATE.Value + 1;
      zqTasks.Post;
      key := 0;
    end;
  end
  else
  if grTasks.SelectedColumn.FieldName = 'PRIORITY' then
  begin
    if key = 32 then
    begin
      zqTasks.Edit;
      idxPriority := grTasks.Columns[4].PickList.IndexOf(
        grTasks.Columns[4].Field.AsString);
      if idxPriority < 4 then
      begin
        grTasks.Columns[4].Field.AsString :=
          grTasks.Columns[4].PickList[idxPriority + 1];
      end
      else
      begin
        grTasks.Columns[4].Field.AsString :=
          grTasks.Columns[4].PickList[0];
      end;
      zqTasks.Post;
      key := 0;
    end;
  end;
end;

procedure TfmMain.grTasksUserCheckboxState(Sender: TObject; Column: TColumn;
  var AState: TCheckboxState);
begin
  grTasks.Refresh;
end;

procedure TfmMain.edFindKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if ((key = 13) and (Shift = [])) then
  begin
    key := 0;
    FindNotes;
  end;
end;

procedure TfmMain.bnFindClick(Sender: TObject);
begin
  FindNotes;
end;

procedure TfmMain.dbTasksChange(Sender: TObject);
begin
  if dbTasks.Text <> '' then
  begin
    TCocoaTextView(NSScrollView(dbTasks.Handle).documentView).
      checkTextInDocument(nil);
  end;
end;

procedure TfmMain.dbTextChange(Sender: TObject);
begin
  if blModNote = False then
  begin
    if blChangedText = False then
    begin
      if zqNotes.RecordCount > 0 then
      begin
        zqNotes.Edit;
      end
      else
      begin
        zqNotes.Insert;
        zqNotes.Edit;
      end;
      // The only edit is not enough
      zqNotesMODIFICATION_DATE.Value := Now;
    end;
    blChangedText := True;
    UpdateInfo;
  end;
end;

procedure TfmMain.dbTitleKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if ((key = 13) and (Shift = [ssMeta])) then
  begin
    key := 0;
    if dbText.Lines[1] = 'title: ' then
    begin
      dbText.Lines[1] := 'title: ' + dbTitle.Text;
      dbText.SelStart := StrToNSString(dbText.Lines[0], True).length +
        StrToNSString(dbText.Lines[1], True).length +
        StrToNSString(dbText.Lines[2], True).length + 2;
    end
    else
    if UTF8Copy(dbText.Lines[1], 1, 7) = 'title: ' then
    begin
      dbText.Lines[1] := 'title: ' + dbTitle.Text;
      dbText.SelStart := UTF8CocoaPos('---', dbText.Text, 4) + 3;
    end;
    pcPageControl.ActivePageIndex := 0;
    if dbText.Visible = True then
    begin
      dbText.SetFocus;
    end;
    FormatListTitles(False, True);
  end
  else
  if key = 13 then
  begin
    key := 0;
    pcPageControl.ActivePageIndex := 0;
    if dbText.Visible = True then
    begin
      dbText.SetFocus;
    end;
  end;
end;

procedure TfmMain.grNotebooksDblClick(Sender: TObject);
begin
  miNotebooksCommentsClick(nil);
end;

procedure TfmMain.grNotebooksGetCellHint(Sender: TObject; Column: TColumn;
  var AText: string);
begin
  if grNotebooks.Canvas.TextWidth(Column.Field.AsString) > grNotebooks.Width then
  begin
    AText := Column.Field.AsString;
  end;
end;

procedure TfmMain.grSectionsDblClick(Sender: TObject);
begin
  miSectionsCommentsClick(nil);
end;

procedure TfmMain.grSectionsGetCellHint(Sender: TObject; Column: TColumn;
  var AText: string);
begin
  if grSections.Canvas.TextWidth(Column.Field.AsString) > grSections.Width then
  begin
    AText := Column.Field.AsString;
  end;
end;

procedure TfmMain.grNotesGetCellHint(Sender: TObject; Column: TColumn;
  var AText: string);
begin
  if grNotes.Canvas.TextWidth(Column.Field.AsString) > grNotes.Width then
  begin
    AText := Column.Field.AsString;
  end;
end;

procedure TfmMain.grTagsGetCellHint(Sender: TObject; Column: TColumn;
  var AText: string);
begin
  if grTags.Canvas.TextWidth(Column.Field.AsString) > grTags.Width then
  begin
    AText := Column.Field.AsString;
  end;
end;

procedure TfmMain.grTagsListDblClick(Sender: TObject);
begin
  cbFields.ItemIndex := 3;
  if ((edFind.Text <> zqTagsListTAG.Value) and
    (UTF8CocoaPos(zqTagsListTAG.Value, ', ' + edFind.Text + ', ') < 1) and
    (UTF8Copy(edFind.Text, StrToNSString(edFind.Text, True).length -
    StrToNSString(zqTagsListTAG.Value, True).length,
    StrToNSString(edFind.Text, True).length) <> zqTagsListTAG.Value)) then
  begin
    if edFind.Text = '' then
    begin
      edFind.Text := zqTagsListTAG.Value;
    end
    else
    begin
      edFind.Text := edFind.Text + ', ' + zqTagsListTAG.Value;
    end;
  end;
end;

procedure TfmMain.grTagsListGetCellHint(Sender: TObject; Column: TColumn;
  var AText: string);
begin
  if grTagsList.Canvas.TextWidth(Column.Field.AsString) > grTagsList.Width then
  begin
    AText := Column.Field.AsString;
  end;
end;

procedure TfmMain.grTagsListKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    key := 0;
    grTagsListDblClick(nil);
  end
  else
  if zqTagsList.RecordCount > 0 then
  begin
    zqTagsList.Locate('TAG', Chr(Key), [loCaseInsensitive, loPartialKey]);
  end;
end;

procedure TfmMain.grLinksDblClick(Sender: TObject);
begin
  if zqLinks.RecordCount > 0 then
  begin
    miNotesLinksLocateClick(nil);
  end;
end;

procedure TfmMain.grLinksGetCellHint(Sender: TObject; Column: TColumn;
  var AText: string);
var
  myDataset: TZQuery;
begin
  if ((zqLinks.RecordCount > 0) and (zqLinksLINK_NOTE.IsNull = False)) then
    try
      myDataset := TZQuery.Create(Self);
      myDataset.Connection := fmMain.zqNotebooks.Connection;
      myDataset.SQL.Add('Select Notebooks.ID as IDNotebooks,');
      myDataset.SQL.Add('Sections.ID as IDSections,');
      myDataset.SQL.Add('Notes.ID as IDNotes,');
      myDataset.SQL.Add('Notebooks.Title as TitleNotebooks,');
      myDataset.SQL.Add('Sections.Title as TitleSections,');
      myDataset.SQL.Add('Notes.Title as TitleNotes');
      myDataset.SQL.Add('from Notebooks, Sections, Notes');
      myDataset.SQL.Add('where Notebooks.ID = Sections.ID_Notebooks');
      myDataset.SQL.Add('and Sections.ID = Notes.ID_Sections');
      myDataset.SQL.Add('and Notes.ID = ' + zqLinksLINK_NOTE.AsString);
      myDataSet.Open;
      if myDataSet.RecordCount > 0 then
      begin
        AText := Column.Field.AsString + LineEnding + LineEnding +
          myDataset.FieldByName('TitleNotebooks').Value + ' ••• ' +
          myDataset.FieldByName('TitleSections').Value;
      end
      else
      begin
        AText := Column.Field.AsString;
      end;
      myDataset.Close;
    finally
      myDataset.Free;
    end;
end;

procedure TfmMain.itTimeTimer(Sender: TObject);
begin
  if dateformat = 'en' then
  begin
    lbTime.Caption := FormatDateTime('dddd mmmm d yyyy', Now()) +
      '   •••   ' + FormatDateTime('hh.nn am/pm', Now());
  end
  else
  begin
    lbTime.Caption := FormatDateTime('dddd d mmmm yyyy', Now()) +
      '   •••   ' + FormatDateTime('hh.nn', Now());
  end;
  // To get text change by dictation of drag and drop
  if zqNotes.Active = True then
  begin
    if zqNotes.RecordCount > 0 then
    begin
      if zqNotesTEXT.Value <> dbText.Text then
      begin
        dbTextChange(nil);
      end;
    end;
  end;
end;

procedure TfmMain.tmTitlesTimerTimer(Sender: TObject);
begin
  FormatListTitles(True, False);
  tmTitlesTimer.AutoEnabled := False;
  tmTitlesTimer.Enabled := False;
end;

procedure TfmMain.tmAutosaveTimerTimer(Sender: TObject);
begin
  if miFileSave.Enabled = True then
  begin
    SaveAll;
  end;
end;

// *****************************************************
// ****************** Menu procedures ******************
// *****************************************************

procedure TfmMain.miFileSaveClick(Sender: TObject);
begin
  SaveAll;
end;

procedure TfmMain.miFileUndoClick(Sender: TObject);
begin
  ResetChanges;
end;

procedure TfmMain.miFileRefreshClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TfmMain.miFileExportClick(Sender: TObject);
var
  myFile: TextFile;
  stText, stAttFile: string;
  myGUID: TGuid;
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  sdSaveDialog.FileName := '';
  sdSaveDialog.DefaultExt := '*.sna';
  sdSaveDialog.Filter := fileext003;
  if sdSaveDialog.Execute then
    try
      try
        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;
        if DirectoryExistsUTF8(LazfileUtils.ExtractFileNameWithoutExt(
          sdSaveDialog.FileName)) = True then
        begin
          DeleteDirectory(LazfileUtils.ExtractFileNameWithoutExt(
            sdSaveDialog.FileName), False);
        end;
        AssignFile(myFile, sdSaveDialog.FileName);
        Rewrite(myFile);
        zqImpExpNotes.Open;
        zqImpExpAttachments.Open;
        zqImpExpTags.Open;
        zqImpExpTasks.Open;
        WriteLn(myFile, 'File exported by pgNotex');
        if zqImpExpNotes.RecordCount > 0 then
        begin
          while zqImpExpNotes.EOF = False do
          begin
            WriteLn(myFile, '<title>');
            WriteLn(myFile, zqImpExpNotesTITLE.Value);
            WriteLn(myFile, '</title>');
            WriteLn(myFile, '<text>');
            stText := zqImpExpNotesTEXT.AsString;
            stText := StringReplace(stText, '<', '&lt;', [rfReplaceAll]);
            stText := StringReplace(stText, '>', '&gt;', [rfReplaceAll]);
            stText := StringReplace(stText, LineEnding, '<p>', [rfReplaceAll]);
            stText := StringReplace(stText, #0, '', [rfReplaceAll]);
            WriteLn(myFile, stText);
            WriteLn(myFile, '</text>');
            if zqImpExpAttachments.RecordCount > 0 then
            begin
              while zqImpExpAttachments.EOF = False do
              begin
                WriteLn(myFile, '<attachment>');
                WriteLn(myFile, zqImpExpAttachmentsTITLE.Value);
                CreateGUID(myGUID);
                stAttFile := UTF8copy(GUIDToString(myGUID), 2,
                  UTF8Length(GUIDToString(myGUID)) - 2);
                if DirectoryExistsUTF8(LazfileUtils.ExtractFileNameWithoutExt(
                  sdSaveDialog.FileName)) = False then
                begin
                  CreateDirUTF8(LazfileUtils.ExtractFileNameWithoutExt(
                    sdSaveDialog.FileName));
                end;
                zqImpExpAttachmentsATTACHMENT.SaveToFile(
                  LazfileUtils.ExtractFileNameWithoutExt(sdSaveDialog.FileName) +
                  DirectorySeparator + stAttFile);
                WriteLn(myFile, stAttFile);
                WriteLn(myFile, '</attachment>');
                zqImpExpAttachments.Next;
              end;
            end;
            if zqImpExpTags.RecordCount > 0 then
            begin
              while zqImpExpTags.EOF = False do
              begin
                WriteLn(myFile, '<tag>');
                WriteLn(myFile, zqImpExpTagsTAG.Value);
                WriteLn(myFile, '</tag>');
                zqImpExpTags.Next;
              end;
            end;
            if zqImpExpTasks.RecordCount > 0 then
            begin
              while zqImpExpTasks.EOF = False do
              begin
                WriteLn(myFile, '<task>');
                WriteLn(myFile,
                  zqImpExpTasksTITLE.AsString + #9 +
                  zqImpExpTasksSTART_DATE.AsString + #9 +
                  zqImpExpTasksEND_DATE.AsString + #9 +
                  zqImpExpTasksDONE.AsString + #9 +
                  zqImpExpTasksPRIORITY.AsString + #9 +
                  zqImpExpTasksRESOURCES.AsString + #9 +
                  StringReplace(zqImpExpTasksCOMMENTS.AsString, LineEnding,
                  '<p>', [rfReplaceAll]));
                WriteLn(myFile, '</task>');
                zqImpExpTasks.Next;
              end;
            end;
            zqImpExpNotes.Next;
          end;
        end;
      finally
        CloseFile(myFile);
        zqImpExpNotes.Close;
        zqImpExpAttachments.Close;
        zqImpExpTags.Close;
        zqImpExpTasks.Close;
        Screen.Cursor := crDefault;
      end;
    except;
      MessageDlg(msg045, mtError, [mbOK], 0);
    end;
end;

procedure TfmMain.miFileImportClick(Sender: TObject);
var
  myFile: TextFile;
  stLine, stField: string;
  iField: smallint;
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  odOpenDialog.Filter := fileext003;
  if odOpenDialog.Execute then
    try
      try
        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;
        AssignFile(myFile, odOpenDialog.FileName);
        Reset(myFile);
        ReadLn(myFile, stLine);
        if stLine <> 'File exported by pgNotex' then
        begin
          MessageDlg(msg047, mtWarning, [mbOK], 0);
          Abort;
        end;
        zqImpExpNotes.Open;
        zqImpExpAttachments.Open;
        zqImpExpTags.Open;
        zqImpExpTasks.Open;
        while not EOF(myFile) do
        begin
          ReadLn(myFile, stLine);
          if stLine = '<title>' then
          begin
            iField := 0;
            zqImpExpNotes.Append;
            zqImpExpNotesORD.Value := zqImpExpNotesID.Value;
            zqImpExpNotesID_SECTIONS.Value :=
              zqSectionsID.Value;
            zqImpExpNotes.Post;
            zqImpExpNotes.ApplyUpdates;
            zqImpExpNotes.Edit;
          end
          else
          if stLine = '</title>' then
          begin
            iField := 0;
          end
          else
          if stLine = '<text>' then
          begin
            iField := 1;
          end
          else
          if stLine = '</text>' then
          begin
            iField := 1;
            zqImpExpNotes.Post;
            zqImpExpNotes.ApplyUpdates;
          end
          else
          if stLine = '<attachment>' then
          begin
            iField := 2;
            zqImpExpAttachments.Append;
            zqImpExpAttachmentsORD.Value := zqImpExpAttachmentsID.Value;
            zqImpExpAttachmentsID_NOTES.Value :=
              zqImpExpNotesID.Value;
            zqImpExpAttachments.Post;
            zqImpExpAttachments.ApplyUpdates;
            zqImpExpAttachments.Edit;
          end
          else
          if stLine = '</attachment>' then
          begin
            iField := 2;
            zqImpExpAttachments.Post;
            zqImpExpAttachments.ApplyUpdates;
          end
          else
          if stLine = '<tag>' then
          begin
            iField := 3;
            zqImpExpTags.Append;
            zqImpExpTagsID_NOTES.Value := zqImpExpNotesID.Value;
            zqImpExpTags.Post;
            zqImpExpTags.ApplyUpdates;
            zqImpExpTags.Edit;
          end
          else
          if stLine = '</tag>' then
          begin
            iField := 3;
            zqImpExpTags.Post;
            zqImpExpTags.ApplyUpdates;
          end
          else
          if stLine = '<task>' then
          begin
            iField := 4;
            zqImpExpTasks.Append;
            zqImpExpTasksID_NOTES.Value := zqImpExpNotesID.Value;
            zqImpExpTasks.Post;
            zqImpExpTasks.ApplyUpdates;
            zqImpExpTasks.Edit;
          end
          else
          if stLine = '</task>' then
          begin
            iField := 4;
            zqImpExpTasks.Post;
            zqImpExpTasks.ApplyUpdates;
          end
          else
          begin
            if iField = 0 then
            begin
              zqImpExpNotesTITLE.Value := stLine;
            end
            else
            if iField = 1 then
            begin
              stLine := StringReplace(stLine, '<p>', LineEnding, [rfReplaceAll]);
              stLine := StringReplace(stLine, '&lt;', '<', [rfReplaceAll]);
              stLine := StringReplace(stLine, '&gt;', '>', [rfReplaceAll]);
              zqImpExpNotesTEXT.Value := stLine;
            end
            else
            if iField = 2 then
            begin
              zqImpExpAttachmentsTITLE.Value := stLine;
              ReadLn(myFile, stLine);
              if FileExists(LazfileUtils.ExtractFileNameWithoutExt(
                odOpenDialog.FileName) + DirectorySeparator + stLine) = True then
              begin
                zqImpExpAttachmentsATTACHMENT.LoadFromFile(
                  LazfileUtils.ExtractFileNameWithoutExt(odOpenDialog.FileName) +
                  DirectorySeparator + stLine);
              end;
            end
            else
            if iField = 3 then
            begin
              zqImpExpTagsTAG.Value := stLine;
            end
            else
            if iField = 4 then
            begin
              stField := stLine;
              zqImpExpTasksTITLE.AsString :=
                UTF8Copy(stField, 1, UTF8CocoaPos(#9, stField) - 1);
              stField := UTF8Copy(stField, UTF8CocoaPos(#9, stField) +
                1, StrToNSString(stField, True).length);
              zqImpExpTasksSTART_DATE.AsString :=
                UTF8Copy(stField, 1, UTF8CocoaPos(#9, stField) - 1);
              stField := UTF8Copy(stField, UTF8CocoaPos(#9, stField) +
                1, StrToNSString(stField, True).length);
              zqImpExpTasksEND_DATE.AsString :=
                UTF8Copy(stField, 1, UTF8CocoaPos(#9, stField) - 1);
              stField := UTF8Copy(stField, UTF8CocoaPos(#9, stField) +
                1, StrToNSString(stField, True).length);
              zqImpExpTasksDONE.AsString :=
                UTF8Copy(stField, 1, UTF8CocoaPos(#9, stField) - 1);
              stField := UTF8Copy(stField, UTF8CocoaPos(#9, stField) +
                1, StrToNSString(stField, True).length);
              zqImpExpTasksPRIORITY.AsString :=
                UTF8Copy(stField, 1, UTF8CocoaPos(#9, stField) - 1);
              stField := UTF8Copy(stField, UTF8CocoaPos(#9, stField) +
                1, StrToNSString(stField, True).length);
              zqImpExpTasksRESOURCES.AsString :=
                UTF8Copy(stField, 1, UTF8CocoaPos(#9, stField) - 1);
              stField := UTF8Copy(stField, UTF8CocoaPos(#9, stField) +
                1, StrToNSString(stField, True).length);
              zqImpExpTasksCOMMENTS.AsString :=
                StringReplace(stField, '<p>', LineEnding, [rfReplaceAll]);
            end;
          end;
        end;
      finally
        CloseFile(myFile);
        zqImpExpNotes.Close;
        zqImpExpAttachments.Close;
        zqImpExpTags.Close;
        zqImpExpTasks.Close;
        RefreshData;
        Screen.Cursor := crDefault;
      end;
    except
      MessageDlg(msg046, mtError, [mbOK], 0);
    end;
end;

procedure TfmMain.miFileCloseClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  SaveAll;
  Disconnect;
  if edPassword.Visible = True then
  begin
    edPassword.SetFocus;
  end;
end;

procedure TfmMain.miEditCutClick(Sender: TObject);
begin
  if dbText.Visible = True then
  begin
    pcPageControl.PageIndex := 0;
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      cut(nil);
  end;
end;

procedure TfmMain.miEditCopyClick(Sender: TObject);
begin
  if dbText.Visible = True then
  begin
    pcPageControl.PageIndex := 0;
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      copy_(nil);
  end;
end;

procedure TfmMain.miEditPasteClick(Sender: TObject);
begin
  if dbText.Visible = True then
  begin
    pcPageControl.PageIndex := 0;
    Clipboard.AsText := StringReplace(Clipboard.AsText, #13, '', [rfReplaceAll]);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      pasteAsPlainText(nil);
    FormatListTitles(True, True);
  end;
end;

procedure TfmMain.miEditSelectAllClick(Sender: TObject);
begin
  if dbText.Visible = True then
  begin
    pcPageControl.PageIndex := 0;
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      selectAll(nil);
  end;
end;

procedure TfmMain.miEditFormatTitlesClick(Sender: TObject);
begin
  FormatListTitles(True, True);
end;

procedure TfmMain.miEditCleanClick(Sender: TObject);
var
  iPos: integer;
  stText: string;
begin
  if zqNotes.RecordCount = 0 then
  begin
    Exit;
  end;
  iPos := dbText.SelStart;
  stText := dbText.Text;
  stText := StringReplace(stText, #226#128#168, LineEnding, [rfReplaceAll]);
  stText := StringReplace(stText, #226#128#169, LineEnding, [rfReplaceAll]);
  stText := StringReplace(stText, #226#128#139, ' ', [rfReplaceAll]);
  stText := StringReplace(stText, #13, '', [rfReplaceAll]);
  dbText.Text := stText;
  RenumberFootnotes;
  RenumberList(True);
  FormatListTitles(True, True);
  dbText.SelStart := iPos;
  // This menu item can be called outside dbText, so...
  if blChangedText = False then
  begin
    zqNotes.Edit;
    // The only edit is not enough
    zqNotesMODIFICATION_DATE.Value := Now;
  end;
  blChangedText := True;
end;

procedure TfmMain.miEditEncodeLinksClick(Sender: TObject);
var
  stLine: string;
begin
  if dbText.SelLength > 0 then
  begin
    stLine := dbText.SelText;
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      Delete(nil);
    stLine := StringReplace(stLine, '(', '%28', [rfReplaceAll]);
    stLine := StringReplace(stLine, ')', '%29', [rfReplaceAll]);
    stLine := StringReplace(stLine, ' ', '%20', [rfReplaceAll]);
    InsText(stLine);
  end;
end;

procedure TfmMain.miEditPrevPicClick(Sender: TObject);
var
  iStart, iEnd: integer;
  stFileName: string;
begin
  if ((dbText.Text = '') or (zqAttachments.RecordCount = 0) or
    (dbText.Focused = False)) then
  begin
    Exit;
  end;
  iStart := dbText.SelStart;
  while ((UTF8Copy(dbText.Text, iStart, 1) <> '(') and
      (UTF8Copy(dbText.Text, iStart, 1) <> LineEnding) and (iStart > 0)) do
  begin
    Dec(iStart);
  end;
  if UTF8Copy(dbText.Text, iStart, 1) <> '(' then
  begin
    Exit;
  end;
  iEnd := dbText.SelStart;
  while ((UTF8Copy(dbText.Text, iEnd, 1) <> ')') and
      (UTF8Copy(dbText.Text, iEnd, 1) <> LineEnding) and
      (iEnd < StrToNSString(dbText.Text, True).length)) do
  begin
    Inc(iEnd);
  end;
  if UTF8Copy(dbText.Text, iEnd, 1) <> ')' then
  begin
    Exit;
  end;
  stFileName := UTF8Copy(dbText.Text, iStart + 1, iEnd - iStart - 1);
  stFileName := StringReplace(stFileName, '%28', '(', [rfReplaceAll]);
  stFileName := StringReplace(stFileName, '%29', ')', [rfReplaceAll]);
  if ((UTF8UpperCase(ExtractFileExt(stFileName)) <> '.JPG') and
    (UTF8UpperCase(ExtractFileExt(stFileName)) <> '.JPEG') and
    (UTF8UpperCase(ExtractFileExt(stFileName)) <> '.PNG') and
    (UTF8UpperCase(ExtractFileExt(stFileName)) <> '.BNP') and
    (UTF8UpperCase(ExtractFileExt(stFileName)) <> '.TIFF') and
    (UTF8UpperCase(ExtractFileExt(stFileName)) <> '.TIF') and
    (UTF8UpperCase(ExtractFileExt(stFileName)) <> '.GIF')) then
  begin
    Exit;
  end;
  zqAttachments.First;
  while zqAttachments.EOF = False do
  begin
    if zqAttachmentsTITLE.Value = stFileName then
      try
        zqAttachmentsATTACHMENT.
          SaveToFile(GetNotexTempDir + zqAttachmentsTITLE.Value);
        fmPicture.imPicture.Picture.LoadFromFile(GetNotexTempDir +
          zqAttachmentsTITLE.Value);
        fmPicture.Top := fmMain.Top + 160;
        fmPicture.Left := fmMain.dbText.Left + fmMain.pcPageControl.Left +
          fmMain.Left + (fmMain.dbText.Width - fmPicture.Width) div 2;
        fmPicture.Show;
        Break;
      except
      end;
    zqAttachments.Next;
  end;
  zqAttachments.First;
end;

procedure TfmMain.miEditPandocClick(Sender: TObject);
var
  stArgument, stInput, stOutput, stDone: string;
  slText: TStringList;
  i: integer;
  blAddLineEnd: boolean;
begin
  if dbText.Text = '' then
  begin
    Exit;
  end;
  SaveAll;
  stInput := GetUserDir + '/Downloads/' + dbTitle.Text + '.md';
  stOutput := GetUserDir + '/Downloads/' + dbTitle.Text + pandocOutput;
  stInput := StringReplace(stInput, '"', #39, [rfReplaceAll]);
  stOutput := StringReplace(stOutput, '"', #39, [rfReplaceAll]);
  try
    slText := TStringList.Create;
    blAddLineEnd := True;
    for i := 0 to dbText.Lines.Count - 1 do
    begin
      if UTF8Copy((dbText.Lines[i]), 1, 2) = '• ' then
      begin
        slText.Add('* ' + UTF8Copy(dbText.Lines[i], 3,
          StrToNSString(dbText.Lines[i], True).length));
      end
      else
      begin
        slText.Add(dbText.Lines[i]);
      end;
      if dbText.Lines[i] = '---' then
      begin
        blAddLineEnd := not blAddLineEnd;
      end;
      if ((blAddLineEnd = True) and (dbText.Lines[i] <> '')) then
      begin
        slText.Add('');
      end;
    end;
    if zqTasks.RecordCount > 0 then
    begin
      slText.Add('# ' + sb003);
      slText.Add('| ' + ts001 + ' | ' + ts002 + ' | ' + ts003 + ' | ' +
        ts004 + ' | ' + ts005 + ' | ' + ts006 + ' | ');
      slText.Add('|:-:|-|-|-|-|-|-|');
      zqTasks.First;
      for i := 0 to zqTasks.RecordCount - 1 do
      begin
        if zqTasksDONE.Value = 1 then
        begin
          stDone := '•';
        end
        else
        begin
          stDone := '';
        end;
        slText.Add('| ' + stDone + ' | ' + zqTasksTITLE.AsString +
          ' | ' + zqTasksSTART_DATE.AsString + ' | ' +
          zqTasksEND_DATE.AsString + ' | ' + zqTasksPRIORITY.AsString +
          ' | ' + zqTasksRESOURCES.AsString + ' | ');
        zqTasks.Next;
      end;
      zqTasks.First;
      for i := 0 to zqTasks.RecordCount - 1 do
      begin
        if zqTasksCOMMENTS.AsString <> '' then
        begin
          slText.Add('### ' + zqTasksTITLE.AsString);
          slText.Add(zqTasksCOMMENTS.AsString + LineEnding);
        end;
        zqTasks.Next;
      end;
      zqTasks.First;
    end;
    slText.SaveToFile(stInput);
  finally
    slText.Free;
  end;
  if zqAttachments.RecordCount > 0 then
  begin
    zqAttachments.First;
    for i := 0 to zqAttachments.RecordCount - 1 do
    begin
      zqAttachmentsATTACHMENT.SaveToFile(GetUserDir + '/Downloads/' +
        zqAttachmentsTITLE.AsString);
      zqAttachments.Next;
    end;
    zqAttachments.First;
  end;
  if FileExistsUTF8(pandocTemplate) then
  begin
    stArgument := pandocPath + 'pandoc ' + '--from markdown' +
      pandocOptions + ' -s "' + stInput + '" -o "' + stOutput +
      '" --reference-doc "' + pandocTemplate + '" --resource-path=' +
      GetUserDir + '/Downloads && open "' + stOutput + '"';
  end
  else
  begin
    stArgument := pandocPath + 'pandoc ' + '--from markdown' +
      pandocOptions + ' -s "' + stInput + '" -o "' + stOutput +
      '" --resource-path=' + GetUserDir + '/Downloads && open "' + stOutput + '"';
  end;
  try
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    Unix.fpSystem(stArgument);
    DeleteFileUTF8(stInput);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmMain.miEditBookmarksClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if fmBookmarks.ShowModal = mrOk then
  begin
    SaveAll;
    blLoadNotes := False;
    zqNotebooks.Locate('ID', fmBookmarks.sgBookmarks.Cells[1,
      fmBookmarks.sgBookmarks.Row], []);
    zqSections.Locate('ID', fmBookmarks.sgBookmarks.Cells[2,
      fmBookmarks.sgBookmarks.Row], []);
    blLoadNotes := True;
    if zqNotes.Locate('ID', fmBookmarks.sgBookmarks.Cells[3,
      fmBookmarks.sgBookmarks.Row], []) = False then
    begin
      dsNotesDataChange(nil, nil);
      MessageDlg(msg048, mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfmMain.miNotebooksNewClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  zqNotebooks.Append;
  fmNotebooks.ShowModal;
end;

procedure TfmMain.miNotebooksSortbyCustomClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  blSortCustomNotebooks := True;
  miNotebooksMoveUp.Enabled := blSortCustomNotebooks;
  miNotebooksMoveDown.Enabled := blSortCustomNotebooks;
  with zqNotebooks do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Notebooks order by Ord');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotebooksSortbyTitleClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  blSortCustomNotebooks := False;
  miNotebooksMoveUp.Enabled := blSortCustomNotebooks;
  miNotebooksMoveDown.Enabled := blSortCustomNotebooks;
  with zqNotebooks do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Notebooks order by Title');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotebooksMoveUpClick(Sender: TObject);
var
  OldOrd, NewOrd, OldID, NewID: integer;
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if blSortCustomNotebooks = False then
    Exit;
  with zqNotebooks do
    try
      DisableControls;
      OldOrd := zqNotebooksORD.Value;
      OldID := zqNotebooksID.Value;
      Prior;
      NewOrd := zqNotebooksORD.Value;
      NewID := zqNotebooksID.Value;
      if OldID <> NewID then
      begin
        Edit;
        zqNotebooksORD.Value := OldOrd;
        Post;
        Next;
        Edit;
        zqNotebooksORD.Value := NewOrd;
        Post;
        ApplyUpdates;
        Refresh;
      end;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotebooksMoveDownClick(Sender: TObject);
var
  OldOrd, NewOrd, OldID, NewID: integer;
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if blSortCustomNotebooks = False then
    Exit;
  with zqNotebooks do
    try
      DisableControls;
      OldOrd := zqNotebooksORD.Value;
      OldID := zqNotebooksID.Value;
      Next;
      NewOrd := zqNotebooksORD.Value;
      NewID := zqNotebooksID.Value;
      if OldID <> NewID then
      begin
        Edit;
        zqNotebooksORD.Value := OldOrd;
        Post;
        Prior;
        Edit;
        zqNotebooksORD.Value := NewOrd;
        Post;
        ApplyUpdates;
        Refresh;
      end;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotebooksDeleteClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  zqNotebooks.Delete;
end;

procedure TfmMain.miNotebooksCommentsClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  fmNotebooks.ShowModal;
end;

procedure TfmMain.miNotebooksCopyIDClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  Clipboard.AsText := zqNotebooksID.AsString;
end;

procedure TfmMain.miSectionsNewClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  zqSections.Append;
  fmSections.ShowModal;
end;

procedure TfmMain.miSectionsDeleteClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  zqSections.Delete;
end;

procedure TfmMain.miSectionsSortbyCustomClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  blSortCustomSections := True;
  miSectionsMoveUp.Enabled := blSortCustomSections;
  miSectionsMoveDown.Enabled := blSortCustomSections;
  with zqSections do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Sections order by Ord');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miSectionsSortbyTitleClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  blSortCustomSections := False;
  miSectionsMoveUp.Enabled := blSortCustomSections;
  miSectionsMoveDown.Enabled := blSortCustomSections;
  with zqSections do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Sections order by Title');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miSectionsMoveUpClick(Sender: TObject);
var
  OldOrd, NewOrd, OldID, NewID: integer;
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if blSortCustomSections = False then
    Exit;
  with zqSections do
    try
      DisableControls;
      OldOrd := zqSectionsORD.Value;
      OldID := zqSectionsID.Value;
      Prior;
      NewOrd := zqSectionsORD.Value;
      NewID := zqSectionsID.Value;
      if OldID <> NewID then
      begin
        Edit;
        zqSectionsORD.Value := OldOrd;
        Post;
        Next;
        Edit;
        zqSectionsORD.Value := NewOrd;
        Post;
        ApplyUpdates;
        Refresh;
      end;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miSectionsMoveDownClick(Sender: TObject);
var
  OldOrd, NewOrd, OldID, NewID: integer;
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if blSortCustomSections = False then
    Exit;
  with zqSections do
    try
      DisableControls;
      OldOrd := zqSectionsORD.Value;
      OldID := zqSectionsID.Value;
      Next;
      NewOrd := zqSectionsORD.Value;
      NewID := zqSectionsID.Value;
      if OldID <> NewID then
      begin
        Edit;
        zqSectionsORD.Value := OldOrd;
        Post;
        Prior;
        Edit;
        zqSectionsORD.Value := NewOrd;
        Post;
        ApplyUpdates;
        Refresh;
      end;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miSectionsCommentsClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  fmSections.ShowModal;
end;

procedure TfmMain.miSectionsChangeNotebookClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if zqSections.RecordCount = 0 then
  begin
    Exit;
  end;
  pcPageControl.PageIndex := 0;
  fmInsertID.Caption := msg035;
  fmInsertID.lbIDKind.Caption := msg036;
  if blChangeIDSectionNote <> 0 then
  begin
    fmInsertID.edID.Clear;
    fmInsertID.lbTitle.Caption := '';
    blChangeIDSectionNote := 0;
  end;
  fmInsertID.iNoteSect := 0;
  if fmInsertID.ShowModal = mrOk then
  begin
    if fmInsertID.edID.Text <> '' then
    begin
      if fmInsertID.edID.Text = zqSectionsID_NOTEBOOKS.AsString then
      begin
        MessageDlg(msg003, mtWarning, [mbOK], 0);
        Exit;
      end
      else
        zqCheckID.SQL.Clear;
      zqCheckID.SQL.Add('Select ID from Notebooks where ID = ' +
        fmInsertID.edID.Text);
      zqCheckID.Open;
      if zqCheckID.RecordCount = 0 then
      begin
        zqCheckID.Close;
        MessageDlg(msg003, mtWarning, [mbOK], 0);
      end
      else
        try
          zqCheckID.Close;
          zqSections.Edit;
          zqSectionsID_NOTEBOOKS.Value := StrToInt(fmInsertID.edID.Text);
          zqSections.Post;
          zqSections.ApplyUpdates;
          blLoadNotes := True;
          zqNotesAfterScroll(nil);
        except
          zqSections.CancelUpdates;
          MessageDlg(msg003, mtWarning, [mbOK], 0);
        end;
    end;
  end;
end;

procedure TfmMain.miSectionsCopyIDClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  Clipboard.AsText := zqSectionsID.AsString;
end;

procedure TfmMain.miNotesNewClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  pcPageControl.PageIndex := 0;
  zqNotes.Append;
  pcPageControl.ActivePageIndex := 0;
  if dbTitle.Visible = True then
  begin
    dbTitle.SetFocus;
  end;
end;

procedure TfmMain.miNotesDeleteClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  pcPageControl.PageIndex := 0;
  if zqNotes.RecordCount > 0 then
  begin
    zqNotes.Delete;
  end;
end;

procedure TfmMain.miNotesSortByCustomClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  pcPageControl.PageIndex := 0;
  blSortCustomNotes := True;
  miNotesMoveUp.Enabled := blSortCustomNotes;
  miNotesMoveDown.Enabled := blSortCustomNotes;
  with zqNotes do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Notes order by Ord');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotesSortByTitleClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  pcPageControl.PageIndex := 0;
  blSortCustomNotes := False;
  miNotesMoveUp.Enabled := blSortCustomNotes;
  miNotesMoveDown.Enabled := blSortCustomNotes;
  with zqNotes do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Notes order by Title');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotesSortByModificationDateClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  pcPageControl.PageIndex := 0;
  blSortCustomNotes := False;
  miNotesMoveUp.Enabled := blSortCustomNotes;
  miNotesMoveDown.Enabled := blSortCustomNotes;
  with zqNotes do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Notes order by Modification_Date');
      Open;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotesMoveUpClick(Sender: TObject);
var
  OldOrd, NewOrd, OldID, NewID: integer;
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  pcPageControl.PageIndex := 0;
  if blSortCustomNotes = False then
    Exit;
  with zqNotes do
    try
      DisableControls;
      OldOrd := zqNotesORD.Value;
      OldID := zqNotesID.Value;
      Prior;
      NewOrd := zqNotesORD.Value;
      NewID := zqNotesID.Value;
      if OldID <> NewID then
      begin
        Edit;
        zqNotesORD.Value := OldOrd;
        Post;
        Next;
        Edit;
        zqNotesORD.Value := NewOrd;
        Post;
        ApplyUpdates;
        Refresh;
      end;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotesMoveDownClick(Sender: TObject);
var
  OldOrd, NewOrd, OldID, NewID: integer;
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  pcPageControl.PageIndex := 0;
  if blSortCustomNotes = False then
    Exit;
  with zqNotes do
    try
      DisableControls;
      OldOrd := zqNotesORD.Value;
      OldID := zqNotesID.Value;
      Next;
      NewOrd := zqNotesORD.Value;
      NewID := zqNotesID.Value;
      if OldID <> NewID then
      begin
        Edit;
        zqNotesORD.Value := OldOrd;
        Post;
        Prior;
        Edit;
        zqNotesORD.Value := NewOrd;
        Post;
        ApplyUpdates;
        Refresh;
      end;
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotesAttachmentsNewClick(Sender: TObject);
var
  i: integer;
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  odOpenDialog.Filter := fileext002;
  if zqNotes.RecordCount > 0 then
  begin
    if odOpenDialog.Execute then
    begin
      for i := 0 to odOpenDialog.Files.Count - 1 do
      begin
        zqAttachments.Append;
        zqAttachments.Edit;
        zqAttachmentsATTACHMENT.LoadFromFile(odOpenDialog.Files[i]);
        zqAttachmentsTITLE.Value :=
          StringReplace(ExtractFileName(odOpenDialog.Files[i]),
          #39, '', [rfReplaceAll]);
        zqAttachments.Post;
      end;
    end;
  end
  else
  begin
    MessageDlg(msg004, mtWarning, [mbOK], 0);
  end;
end;

procedure TfmMain.miNotesAttachmentsDeleteClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if zqAttachments.RecordCount > 0 then
  begin
    zqAttachments.Delete;
  end;
end;

procedure TfmMain.miNotesAttachmentsOpenClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if zqAttachments.RecordCount > 0 then
  begin
    zqAttachmentsATTACHMENT.SaveToFile(GetNotexTempDir + zqAttachmentsTITLE.Value);
    OpenDocument(GetNotexTempDir + zqAttachmentsTITLE.Value);
  end;
end;

procedure TfmMain.miNotesAttachmentsSaveAsClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if zqAttachments.RecordCount > 0 then
  begin
    sdSaveDialog.DefaultExt := '';
    sdSaveDialog.Filter := fileext002;
    sdSaveDialog.FileName := zqAttachmentsTITLE.Value;
    if sdSaveDialog.Execute then
    begin
      zqAttachmentsATTACHMENT.SaveToFile(sdSaveDialog.FileName);
    end;
  end;
end;

procedure TfmMain.miNotesAttachmentsSaveDownloadsClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if zqAttachments.RecordCount > 0 then
  begin
    zqAttachmentsATTACHMENT.SaveToFile(GetUserDir + 'Downloads/' +
      zqAttachmentsTITLE.Value);
    OpenDocument(GetUserDir + 'Downloads/' + zqAttachmentsTITLE.Value);
  end;
end;

procedure TfmMain.miNotesAttachmentsLoadDownloadsClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if zqAttachments.RecordCount > 0 then
  begin
    if FileExistsUTF8(GetUserDir + 'Downloads/' + zqAttachmentsTITLE.Value) then
    begin
      zqAttachments.Edit;
      zqAttachmentsATTACHMENT.LoadFromFile(GetUserDir + 'Downloads/' +
        zqAttachmentsTITLE.Value);
      zqAttachments.Post;
      MessageDlg(msg055, mtInformation, [mbOK], 0);
    end
    else
    begin
      MessageDlg(msg056, mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfmMain.miNotesAttachmentsInsertAsClick(Sender: TObject);
var
  stFileName: string;
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if zqAttachments.RecordCount > 0 then
  begin
    stFileName := zqAttachmentsTITLE.AsString;
    stFileName := StringReplace(stFileName, '(', '%28', [rfReplaceAll]);
    stFileName := StringReplace(stFileName, ')', '%29', [rfReplaceAll]);
    if ((UTF8UpperCase(ExtractFileExt(stFileName)) <> '.JPG') and
      (UTF8UpperCase(ExtractFileExt(stFileName)) <> '.JPEG') and
      (UTF8UpperCase(ExtractFileExt(stFileName)) <> '.PNG') and
      (UTF8UpperCase(ExtractFileExt(stFileName)) <> '.BNP') and
      (UTF8UpperCase(ExtractFileExt(stFileName)) <> '.TIFF') and
      (UTF8UpperCase(ExtractFileExt(stFileName)) <> '.TIF') and
      (UTF8UpperCase(ExtractFileExt(stFileName)) <> '.GIF')) then
    begin
      InsText('[](' + stFileName + ')');
    end
    else
    begin
      InsText('![](' + stFileName + ')');
    end;
    dbText.SelStart := dbText.SelStart - StrToNSString('](' + stFileName +
      ')', True).length;
    dbText.SetFocus;
  end;
end;

procedure TfmMain.miNotesTagsNewClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if ((miNotesFind.Checked = True) and (zqTagsList.RecordCount > 0) and
    (zqNotes.RecordCount > 0) and (grTagsList.Focused = True)) then
  begin
    if zqTags.Locate('Tag', zqTagsListTAG.Value, []) = True then
    begin
      MessageDlg(msg054, mtWarning, [mbOK], 0);
    end
    else
    begin
      zqTags.Append;
      zqTags.Edit;
      zqTagsTAG.Value := zqTagsListTAG.Value;
      zqTags.Post;
      zqTags.ApplyUpdates;
    end;
  end
  else
  begin
    zqTags.Append;
    grTags.EditorMode := True;
    grTags.SetFocus;
  end;
end;

procedure TfmMain.miNotesTagsDeleteClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if zqTags.RecordCount > 0 then
  begin
    zqTags.Delete;
  end;
end;

procedure TfmMain.miNotesTagsRenameClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if ((grTags.Focused = True) and (zqTags.RecordCount > 0)) then
  begin
    fmRenameTags.edOldTag.Text := zqTagsTAG.Value;
  end
  else
  begin
    fmRenameTags.edOldTag.Text := '';
  end;
  fmRenameTags.edNewTag.Text := '';
  if fmRenameTags.ShowModal = mrOk then
  begin
    if ((fmRenameTags.edOldTag.Text <> '') and (fmRenameTags.edNewTag.Text <> '')) then
    begin
      with zqRenameTags do
      begin
        SQL.Clear;
        SQL.Add('Select * from Tags where Tag = ' + #39 +
          fmRenameTags.edOldTag.Text + #39);
        Open;
        while not zqRenameTags.EOF do
        begin
          Edit;
          zqRenameTags.FieldByName('Tag').AsString := fmRenameTags.edNewTag.Text;
          Post;
          Next;
        end;
        ApplyUpdates;
        Close;
      end;
      zqTags.Refresh;
    end;
  end;
end;

procedure TfmMain.miNotesTagsDeleteEmptyClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  with zqRenameTags do
  begin
    SQL.Clear;
    SQL.Add('Select * from Tags where COALESCE(Tag, ' + #39#39 + ') = ' + #39#39);
    Open;
    while zqRenameTags.RecordCount > 0 do
    begin
      Delete;
    end;
    ApplyUpdates;
    Close;
  end;
  zqTags.Refresh;
end;

procedure TfmMain.miNotesLinksNewClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if zqNotes.RecordCount = 0 then
  begin
    MessageDlg(msg004, mtWarning, [mbOK], 0);
    Exit;
  end;
  pcPageControl.PageIndex := 0;
  fmInsertID.Caption := msg052;
  fmInsertID.lbIDKind.Caption := msg037;
  if blChangeIDSectionNote <> 2 then
  begin
    fmInsertID.edID.Clear;
    fmInsertID.lbTitle.Caption := '';
    blChangeIDSectionNote := 2;
  end;
  fmInsertID.iNoteSect := 2;
  if fmInsertID.ShowModal = mrOk then
  begin
    if fmInsertID.edID.Text <> '' then
      try
        if fmInsertID.edID.Text = zqNotesID.AsString then
        begin
          MessageDlg(msg003, mtWarning, [mbOK], 0);
          Exit;
        end
        else
        if zqLinks.Locate('Link_Note', fmInsertID.edID.Text, []) = True then
        begin
          MessageDlg(msg053, mtWarning, [mbOK], 0);
          Exit;
        end;
        zqLinks.Append;
        zqLinks.Edit;
        zqLinksLINK_NOTE.Value := StrToInt(fmInsertID.edID.Text);
        zqLinks.Post;
        zqLinks.ApplyUpdates;
        zqLinks.Append;
        zqLinks.Edit;
        zqLinksID_NOTES.Value := StrToInt(fmInsertID.edID.Text);
        zqLinksLINK_NOTE.Value := zqNotesID.Value;
        zqLinks.Post;
        zqLinks.ApplyUpdates;
        zqLinks.Refresh;
      except
        zqLinks.CancelUpdates;
        MessageDlg(msg003, mtWarning, [mbOK], 0);
      end;
  end;
end;

procedure TfmMain.miNotesLinksDeleteClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if zqLinks.RecordCount > 0 then
  begin
    zqLinks.Delete;
  end;
end;

procedure TfmMain.miNotesLinksLocateClick(Sender: TObject);
var
  iNotebook, iSection, iNote: integer;
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if zqLinks.RecordCount > 0 then
  begin
    with zqGetLink do
    begin
      iNote := zqLinksLINK_NOTE.Value;
      SQL.Clear;
      SQL.Add('Select ID_SECTIONS from Notes where ID = ' + IntToStr(iNote));
      Open;
      iSection := zqGetLink.FieldByName('ID_SECTIONS').AsInteger;
      Close;
      SQL.Clear;
      SQL.Add('Select ID_NOTEBOOKS from Sections where ID = ' +
        IntToStr(iSection));
      Open;
      iNotebook := zqGetLink.FieldByName('ID_NOTEBOOKS').AsInteger;
      Close;
      blLoadNotes := False;
      zqNotebooks.Locate('ID', IntToStr(iNotebook), []);
      zqSections.Locate('ID', IntToStr(iSection), []);
      zqNotes.Locate('ID', IntToStr(iNote), []);
      blLoadNotes := True;
      zqNotesAfterScroll(nil);
    end;
  end;
end;

procedure TfmMain.miNotesTasksNewClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if pcPageControl.PageIndex = 0 then
  begin
    if MessageDlg(msg057, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
    begin
      Exit;
    end;
  end;
  pcPageControl.PageIndex := 1;
  grTasks.SetFocus;
  grTasks.SelectedField := zqTasksTITLE;
  zqTasks.Append;
  grTasks.EditorMode := True;
end;

procedure TfmMain.miNotesTasksDeleteClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  pcPageControl.PageIndex := 1;
  if zqTasks.RecordCount > 0 then
  begin
    zqTasks.Delete;
  end;
end;

procedure TfmMain.miNotesTasksRefreshClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  zqTasks.Refresh;
end;

procedure TfmMain.miNotesTasksHideClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  pcPageControl.PageIndex := 1;
  miNotesTasksHide.Checked := not miNotesTasksHide.Checked;
  with zqTasks do
    try
      DisableControls;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Tasks where  ID_Notes = :ID');
      if miNotesTasksHide.Checked = True then
      begin
        SQL.Add('and DONE = 0');
      end;
      SQL.Add('order by END_DATE, START_DATE');
      Open
    finally
      EnableControls;
    end;
end;

procedure TfmMain.miNotesShowAllTasksClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  SaveAll;
  zqAllTasks.Open;
  fmShowAllTasks.ShowModal;
  if zqAllTasks.UpdatesPending = True then
  begin
    zqAllTasks.ApplyUpdates;
  end;
  zqAllTasks.Close;
  zqTasks.Refresh;
end;

procedure TfmMain.miNotesImportClick(Sender: TObject);
var
  myZip: TUnZipper;
  myList, stFileOrig: TStringList;
  i, iFile: integer;
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  pcPageControl.PageIndex := 0;
  if zqSections.RecordCount = 0 then
  begin
    MessageDlg(msg018, mtWarning, [mbOK], 0);
    Exit;
  end;
  odOpenDialog.Filter := fileext001;
  if odOpenDialog.Execute then
    try
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      for iFile := 0 to odOpenDialog.Files.Count - 1 do
        try
          zqNotes.Append;
          if ((UTF8LowerCase(ExtractFileExt(odOpenDialog.Files[iFile])) = '.txt') or
            (UTF8LowerCase(ExtractFileExt(odOpenDialog.Files[iFile])) = '')) then
          begin
            zqNotes.Edit;
            dbText.Lines.LoadFromFile(odOpenDialog.Files[iFile]);
            blChangedText := True;
            zqNotesTITLE.Value :=
              ExtractFileName(LazFileUtils.ExtractFileNameWithoutExt(
              odOpenDialog.Files[iFile]));
            zqNotes.Post;
            zqNotes.ApplyUpdates;
          end
          else if UTF8LowerCase(ExtractFileExt(odOpenDialog.Files[iFile])) = '.odt' then
          begin
            try
              myZip := TUnZipper.Create;
              myList := TStringList.Create;
              stFileOrig := TStringList.Create;
              myList.Add('content.xml');
              myZip.OutputPath := GetNotexTempDir;
              myZip.FileName := odOpenDialog.Files[iFile];
              myZip.UnZipFiles(myList);
              stFileOrig.LoadFromFile(GetNotexTempDir + DirectorySeparator +
                'content.xml');
              stFileOrig.Text :=
                StringReplace(stFileOrig.Text, '<text:note-citation>',
                ' [^', [rfReplaceAll]);
              stFileOrig.Text :=
                StringReplace(stFileOrig.Text, '</text:p></text:note-body></text:note>',
                ']', [rfReplaceAll]);
              stFileOrig.Text :=
                StringReplace(stFileOrig.Text, '<text:note-body>', ': ', [rfReplaceAll]);
              stFileOrig.Text :=
                StringReplace(stFileOrig.Text, '</text:h>', LineEnding +
                LineEnding, [rfReplaceAll]);
              stFileOrig.Text :=
                StringReplace(stFileOrig.Text, '</text:p>', LineEnding, [rfReplaceAll]);
              stFileOrig.Text :=
                StringReplace(stFileOrig.Text, '&apos;', #39, [rfReplaceAll]);
              zqNotes.Edit;
              blChangedText := True;
              dbText.Text := CleanXML(stFileOrig.Text);
              dbText.Text := StringReplace(dbText.Text, #226#128#168,
                LineEnding, [rfReplaceAll]);
              dbText.Text := StringReplace(dbText.Text, #226#128#169,
                LineEnding, [rfReplaceAll]);
              dbText.Text := StringReplace(dbText.Text, #226#128#139,
                ' ', [rfReplaceAll]);
              dbText.Text := StringReplace(dbText.Text, 'title: ',
                'title: ' + ExtractFileName(LazFileUtils.ExtractFileNameWithoutExt(
                odOpenDialog.Files[iFile])), []);
              zqNotesTITLE.Value :=
                ExtractFileName(LazFileUtils.ExtractFileNameWithoutExt(
                odOpenDialog.Files[iFile]));
              zqNotes.Post;
              zqNotes.ApplyUpdates;
              DeleteFileUTF8(GetNotexTempDir + DirectorySeparator + 'content.xml');
              zqAttachments.Append;
              zqAttachments.Edit;
              zqAttachmentsATTACHMENT.LoadFromFile(odOpenDialog.Files[iFile]);
              zqAttachmentsTITLE.Value :=
                StringReplace(ExtractFileName(odOpenDialog.Files[iFile]),
                #39, '', [rfReplaceAll]);
              zqAttachments.Post;
              zqAttachments.ApplyUpdates;
            finally
              myZip.Free;
              myList.Free;
              stFileOrig.Free;
            end;
          end
          else
          if UTF8LowerCase(ExtractFileExt(odOpenDialog.Files[iFile])) = '.docx' then
          begin
            try
              zqNotes.Edit;
              blChangedText := True;
              myZip := TUnZipper.Create;
              myList := TStringList.Create;
              stFileOrig := TStringList.Create;
              myZip.OutputPath := GetNotexTempDir;
              myZip.FileName := odOpenDialog.Files[iFile];
              myZip.UnZipAllFiles;
              if FileExistsUTF8(GetNotexTempDir + 'word/document.xml') = True then
              begin
                stFileOrig.LoadFromFile(GetNotexTempDir + 'word/document.xml');
                stFileOrig.Text :=
                  StringReplace(stFileOrig.Text, '</w:p>', LineEnding, [rfReplaceAll]);
                i := 0;
                while Pos('<w:footnoteReference w:id="', stFileOrig.Text) > 0 do
                begin
                  Inc(i);
                  stFileOrig.Text :=
                    StringReplace(stFileOrig.Text, '<w:footnoteReference w:id="',
                    '[^' + IntToStr(i) + ']<', []);
                end;
                i := 0;
                while Pos('<w:endnoteReference w:id="', stFileOrig.Text) > 0 do
                begin
                  Inc(i);
                  stFileOrig.Text :=
                    StringReplace(stFileOrig.Text, '<w:endnoteReference w:id="',
                    '[^endnote' + IntToStr(i) + ']<', []);
                end;
                dbText.Text := dbText.Text + CleanXML(stFileOrig.Text) + LineEnding;
              end;
              if FileExistsUTF8(GetNotexTempDir + 'word/footnotes.xml') = True then
              begin
                stFileOrig.LoadFromFile(GetNotexTempDir + 'word/footnotes.xml');
                stFileOrig.Text :=
                  StringReplace(stFileOrig.Text, '</w:p>', LineEnding, [rfReplaceAll]);
                i := 0;
                while Pos('<w:footnoteRef/>', stFileOrig.Text) > 0 do
                begin
                  Inc(i);
                  stFileOrig.Text :=
                    StringReplace(stFileOrig.Text, '<w:footnoteRef/>',
                    '>[^' + IntToStr(i) + ']: ', []);
                end;
                dbText.Text := dbText.Text + CleanXML(stFileOrig.Text) + LineEnding;
              end;
              if FileExistsUTF8(GetNotexTempDir + 'word/endnotes.xml') = True then
              begin
                stFileOrig.LoadFromFile(GetNotexTempDir + 'word/endnotes.xml');
                stFileOrig.Text :=
                  StringReplace(stFileOrig.Text, '</w:p>', LineEnding, [rfReplaceAll]);
                i := 0;
                while Pos('<w:endnoteRef/>', stFileOrig.Text) > 0 do
                begin
                  Inc(i);
                  stFileOrig.Text :=
                    StringReplace(stFileOrig.Text, '<w:endnoteRef/>',
                    '>[^endnote: ' + IntToStr(i) + ']: ', []);
                end;
                dbText.Text := dbText.Text + CleanXML(stFileOrig.Text) + LineEnding;
              end;
              if DirectoryExistsUTF8(GetNotexTempDir + 'word') = True then
              begin
                DeleteDirectory(GetNotexTempDir + 'word', True);
                RemoveDirUTF8(GetNotexTempDir + 'word');
              end;
              zqNotesTITLE.Value :=
                ExtractFileName(LazFileUtils.ExtractFileNameWithoutExt(
                odOpenDialog.Files[iFile]));
              dbText.Text := StringReplace(dbText.Text, #226#128#168,
                LineEnding, [rfReplaceAll]);
              dbText.Text := StringReplace(dbText.Text, #226#128#169,
                LineEnding, [rfReplaceAll]);
              dbText.Text := StringReplace(dbText.Text, #226#128#139,
                ' ', [rfReplaceAll]);
              dbText.Text := StringReplace(dbText.Text, 'title: ',
                'title: ' + ExtractFileName(LazFileUtils.ExtractFileNameWithoutExt(
                odOpenDialog.Files[iFile])), []);
              zqNotes.Post;
              zqNotes.ApplyUpdates;
              zqAttachments.Append;
              zqAttachments.Edit;
              zqAttachmentsATTACHMENT.LoadFromFile(odOpenDialog.Files[iFile]);
              zqAttachmentsTITLE.Value :=
                StringReplace(ExtractFileName(odOpenDialog.Files[iFile]),
                #39, '', [rfReplaceAll]);
              zqAttachments.Post;
              zqAttachments.ApplyUpdates;
            finally
              myZip.Free;
              myList.Free;
              stFileOrig.Free;
            end;
          end;
        except
          zqAttachments.CancelUpdates;
          zqNotes.CancelUpdates;
          MessageDlg(msg042 + ' ' + odOpenDialog.Files[iFile] + '.',
            mtWarning, [mbOK], 0);
        end;
    finally
      Screen.Cursor := crDefault;
    end;
  FormatListTitles(True, True);
end;

procedure TfmMain.miNoteschangeSectionClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  if zqNotes.RecordCount = 0 then
  begin
    Exit;
  end;
  pcPageControl.PageIndex := 0;
  fmInsertID.Caption := msg038;
  fmInsertID.lbIDKind.Caption := msg039;
  if blChangeIDSectionNote <> 1 then
  begin
    fmInsertID.edID.Clear;
    fmInsertID.lbTitle.Caption := '';
    blChangeIDSectionNote := 1;
  end;
  fmInsertID.iNoteSect := 1;
  if fmInsertID.ShowModal = mrOk then
  begin
    if fmInsertID.edID.Text <> '' then
    begin
      if fmInsertID.edID.Text = zqNotesID_SECTIONS.AsString then
      begin
        MessageDlg(msg003, mtWarning, [mbOK], 0);
        Exit;
      end
      else
        zqCheckID.SQL.Clear;
      zqCheckID.SQL.Add('Select ID from Sections where ID = ' +
        fmInsertID.edID.Text);
      zqCheckID.Open;
      if zqCheckID.RecordCount = 0 then
      begin
        zqCheckID.Close;
        MessageDlg(msg003, mtWarning, [mbOK], 0);
      end
      else
        try
          zqCheckID.Close;
          zqNotes.Edit;
          zqNotesID_SECTIONS.Value := StrToInt(fmInsertID.edID.Text);
          zqNotes.Post;
          zqNotes.ApplyUpdates;
          blLoadNotes := True;
          zqNotesAfterScroll(nil);
        except
          zqNotes.CancelUpdates;
          MessageDlg(msg003, mtWarning, [mbOK], 0);
        end;
    end;
  end;
end;

procedure TfmMain.miNotesCopyIDClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  Clipboard.AsText := zqNotesID.AsString;
end;

procedure TfmMain.miNotesSearchClick(Sender: TObject);
begin
  pcPageControl.PageIndex := 0;
  if ((miNotesFind.Checked = True) and (cbFields.ItemIndex = 1) and
    (edFind.Text <> '')) then
  begin
    fmSearch.edFind.Text := edFind.Text;
  end;
  fmSearch.Show;
end;

procedure TfmMain.miNotesFindClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  pcPageControl.PageIndex := 0;
  miNotesFind.Checked := not miNotesFind.Checked;
  if miNotesFind.Checked = True then
  begin
    pnBottom.Visible := True;
    spBottom.Visible := True;
    zqTagsList.Refresh;
    edFind.SetFocus;
  end
  else
  begin
    spBottom.Visible := False;
    pnBottom.Visible := False;
  end;
end;

procedure TfmMain.miToolsShowEditorClick(Sender: TObject);
begin
  pcPageControl.PageIndex := 0;
  miToolsShowEditor.Checked := not miToolsShowEditor.Checked;
  if miNotesFind.Checked = True then
  begin
    miNotesFindClick(nil);
  end;
  if miToolsShowEditor.Checked = True then
  begin
    pnLeft.Visible := False;
    pnRight.Visible := False;
    pnTitle.Visible := False;
    pcPageControl.ShowTabs := False;
    sgTitles.Width := 300;
    pcPageControl.ActivePageIndex := 0;
    if dbText.Visible = True then
    begin
      dbText.SetFocus;
    end;
  end
  else
  begin
    pnLeft.Visible := True;
    pnRight.Visible := True;
    pnTitle.Visible := True;
    pcPageControl.ShowTabs := True;
    sgTitles.Width := 200;
    pcPageControl.ActivePageIndex := 0;
    if dbText.Visible = True then
    begin
      dbText.SetFocus;
    end;
  end;
end;

procedure TfmMain.miToolsFullScreenClick(Sender: TObject);
begin
  if fmMain.WindowState = wsFullScreen then
  begin
    fmMain.WindowState := wsNormal;
  end
  else
  begin
    fmMain.WindowState := wsFullScreen;
  end;
end;

procedure TfmMain.miToolsTrans1Click(Sender: TObject);
begin
  if Sender = miToolsTrans0 then
  begin
    fmMain.AlphaBlend := False;
    fmMain.AlphaBlendValue := 255;
    miToolsTrans0.Checked := True;
  end
  else
  if Sender = miToolsTrans1 then
  begin
    fmMain.AlphaBlend := True;
    fmMain.AlphaBlendValue := 140;
    miToolsTrans1.Checked := True;
  end
  else
  if Sender = miToolsTrans2 then
  begin
    fmMain.AlphaBlend := True;
    fmMain.AlphaBlendValue := 180;
    miToolsTrans2.Checked := True;
  end
  else
  if Sender = miToolsTrans3 then
  begin
    fmMain.AlphaBlend := True;
    fmMain.AlphaBlendValue := 220;
    miToolsTrans3.Checked := True;
  end;
end;

procedure TfmMain.miToolsOptionsClick(Sender: TObject);
begin
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  fmOptions.ShowModal;
end;

procedure TfmMain.miPGManualClick(Sender: TObject);
var
  stPath: string;
begin
  stPath := ExtractFilePath(Application.ExeName);
  stPath := StringReplace(stPath, 'MacOS', 'Resources', []);
  OpenDocument(stPath + pdfmanual);
end;

procedure TfmMain.miPGCopyrightClick(Sender: TObject);
begin
  fmCopyright.ShowModal;
end;

procedure TfmMain.pmInsertTagClick(Sender: TObject);
begin
  if ((miNotesFind.Checked = True) and (zqTagsList.RecordCount > 0) and
    (zqNotes.RecordCount > 0)) then
  begin
    if zqTags.Locate('Tag', zqTagsListTAG.Value, []) = True then
    begin
      MessageDlg(msg054, mtWarning, [mbOK], 0);
    end
    else
    begin
      zqTags.Append;
      zqTags.Edit;
      zqTagsTAG.Value := zqTagsListTAG.Value;
      zqTags.Post;
      zqTags.ApplyUpdates;
    end;
  end;
end;

procedure TfmMain.pmUpdateTagsClick(Sender: TObject);
begin
  zqTagsList.Refresh;
end;

// *****************************************************
// ************** Data access procedures ***************
// *****************************************************

procedure TfmMain.StateChange(Sender: TObject);
begin
  if ((dsNotebooks.State in [dsInsert, dsEdit]) or
    (dsSections.State in [dsInsert, dsEdit]) or (dsNotes.State in
    [dsInsert, dsEdit]) or (dsAttachments.State in [dsInsert, dsEdit]) or
    (dsTags.State in [dsInsert, dsEdit]) or (dsLinks.State in [dsInsert, dsEdit]) or
    (dsTasks.State in [dsInsert, dsEdit])) then
  begin
    miFileSave.Enabled := True;
    miFileUndo.Enabled := True;
    shSave.Brush.Color := clRed;
  end
  else
  begin
    miFileSave.Enabled := False;
    miFileUndo.Enabled := False;
    shSave.Brush.Color := TColor($76CF76);
  end;
end;

// ******************** Notebooks ********************

procedure TfmMain.zqNotebooksAfterInsert(DataSet: TDataSet);
begin
  zqNotebooksORD.Value := 0;
  zqNotebooks.Post;
  zqNotebooks.ApplyUpdates;
  zqNotebooks.Edit;
  zqNotebooksORD.Value := zqNotebooksID.Value;
  zqNotebooks.Post;
  zqNotebooks.ApplyUpdates;
  zqNotesAfterScroll(nil);
end;

procedure TfmMain.zqNotebooksAfterScroll(DataSet: TDataSet);
begin
  if zqNotes.Active = True then
  begin
    if blLoadNotes = True then
    begin
      zqNotesAfterScroll(nil);
    end;
  end;
  grNotebooks.Columns[0].Title.Caption :=
    lbNotebooks + '  •••  ' + IntToStr(zqNotebooks.RecordCount);
end;

procedure TfmMain.zqNotebooksBeforeDelete(DataSet: TDataSet);
begin
  if zqNotebooks.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg015, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end;
end;

procedure TfmMain.zqNotebooksAfterDelete(DataSet: TDataSet);
begin
  zqNotebooks.ApplyUpdates;
end;

// ******************** Sections ********************

procedure TfmMain.zqSectionsBeforeInsert(DataSet: TDataSet);
begin
  if zqNotebooks.RecordCount = 0 then
  begin
    MessageDlg(msg016, mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfmMain.zqSectionsAfterInsert(DataSet: TDataSet);
begin
  zqSectionsID_NOTEBOOKS.AsInteger :=
    zqNotebooksID.AsInteger;
  zqSectionsORD.Value := 0;
  zqSections.Post;
  zqSections.ApplyUpdates;
  zqSections.Edit;
  zqSectionsORD.Value := zqSectionsID.Value;
  zqSections.Post;
  zqSections.ApplyUpdates;
  zqNotesAfterScroll(nil);
end;

procedure TfmMain.zqSectionsAfterScroll(DataSet: TDataSet);
begin
  if zqNotes.Active = True then
  begin
    if blLoadNotes = True then
    begin
      zqNotesAfterScroll(nil);
    end;
  end;
  grSections.Columns[0].Title.Caption :=
    lbSections + '  •••  ' + IntToStr(zqSections.RecordCount);
end;

procedure TfmMain.zqSectionsBeforeDelete(DataSet: TDataSet);
begin
  if zqSections.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg017, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end;
end;

procedure TfmMain.zqSectionsAfterDelete(DataSet: TDataSet);
begin
  zqSections.ApplyUpdates;
end;

// ******************** Notes ********************

procedure TfmMain.zqNotesBeforeInsert(DataSet: TDataSet);
begin
  if zqSections.RecordCount = 0 then
  begin
    MessageDlg(msg018, mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfmMain.zqNotesBeforePost(DataSet: TDataSet);
begin
  if blChangedText = True then
  begin
    zqNotesTEXT.Value := dbText.Text;
    blChangedText := False;
  end;
  zqNotesMODIFICATION_DATE.Value := Now;
end;

procedure TfmMain.zqNotesAfterInsert(DataSet: TDataSet);
var
  stDate: string;
begin
  if dateformat = 'en' then
  begin
    stDate := formatDateTime('mmmm d yyyy', Now());
  end
  else
  begin
    stDate := formatDateTime('d mmmm yyyy', Now());
  end;
  zqNotesID_SECTIONS.Value :=
    zqSectionsID.Value;
  zqNotesORD.Value := 0;
  zqNotes.Post;
  zqNotes.ApplyUpdates;
  zqNotes.Edit;
  zqNotesORD.Value := zqNotesID.Value;
  zqNotesTEXT.Value := '---' + LineEnding + 'title: ' + LineEnding +
    'subtitle: ' + LineEnding + 'date: ' + stDate + LineEnding +
    'abstract: ' + LineEnding + '---' + LineEnding + LineEnding;
  zqNotes.Post;
  zqNotes.ApplyUpdates;
end;

procedure TfmMain.zqNotesAfterScroll(DataSet: TDataSet);
begin
  blModNote := True;
  if zqNotes.RecordCount > 0 then
  begin
    dbText.Text := zqNotesTEXT.Value;
    if ((UTF8Length(dbText.Text) > 4) and (UTF8CocoaPos('---', dbText.Text, 4) > 0) and
      (UTF8CocoaPos('---', dbText.Text, 4) + 3 < UTF8Length(dbText.Text))) then
    begin
      dbText.SelStart := UTF8CocoaPos('---', dbText.Text, 4) + 4;
    end
    else
    begin
      dbText.SelStart := 0;
    end;
  end
  else
  begin
    dbText.Text := '';
    sgTitles.Clear;
  end;
  UpdateInfo;
  FormatListTitles(True, True);
  blModNote := False;
  grNotes.Columns[0].Title.Caption :=
    lbNotes + '  •••  ' + IntToStr(zqNotes.RecordCount);
end;

procedure TfmMain.zqNotesBeforeDelete(DataSet: TDataSet);
begin
  if zqNotes.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg019, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end;
end;

procedure TfmMain.zqNotesAfterDelete(DataSet: TDataSet);
begin
  zqNotes.ApplyUpdates;
end;

procedure TfmMain.dsNotesDataChange(Sender: TObject; Field: TField);
begin
  UpdateInfo;
end;

procedure TfmMain.dsTasksDataChange(Sender: TObject; Field: TField);
begin
  if zqTasks.RecordCount > 0 then
  begin
    tsTasks.Caption := sb003 + '  •••  ' + IntToStr(zqTasks.RecordCount);
  end
  else
  begin
    tsTasks.Caption := sb003;
  end;
end;

// ********************** Attachments ************************//

procedure TfmMain.zqAttachmentsBeforeInsert(DataSet: TDataSet);
begin
  if zqNotes.RecordCount = 0 then
  begin
    MessageDlg(msg020, mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfmMain.zqAttachmentsAfterInsert(DataSet: TDataSet);
begin
  zqAttachmentsORD.Value := zqAttachmentsID.Value;
  zqAttachmentsID_NOTES.Value :=
    zqNotesID.Value;
  zqAttachments.Post;
  zqAttachments.ApplyUpdates;
end;

procedure TfmMain.zqAttachmentsAfterScroll(DataSet: TDataSet);
begin
  grAttachments.Columns[0].Title.Caption :=
    lbAttachments + '  •••  ' + IntToStr(zqAttachments.RecordCount);
end;

procedure TfmMain.zqAttachmentsBeforeDelete(DataSet: TDataSet);
begin
  if zqAttachments.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg021, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end;
end;

procedure TfmMain.zqAttachmentsAfterDelete(DataSet: TDataSet);
begin
  zqAttachments.ApplyUpdates;
end;

procedure TfmMain.dsAttachmentsDataChange(Sender: TObject; Field: TField);
begin
  if zqAttachments.RecordCount > 0 then
  begin
    grAttachments.Options := grAttachments.Options + [dgEditing];
  end
  else
  begin
    grAttachments.Options := grAttachments.Options - [dgEditing];
  end;
end;

// ******************** Tags ********************

procedure TfmMain.zqTagsBeforeInsert(DataSet: TDataSet);
begin
  if zqNotes.RecordCount = 0 then
  begin
    MessageDlg(msg022, mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfmMain.zqTagsAfterInsert(DataSet: TDataSet);
begin
  zqTagsID_NOTES.Value := zqNotesID.Value;
  zqTags.Post;
  zqTags.ApplyUpdates;
end;

procedure TfmMain.zqTagsAfterScroll(DataSet: TDataSet);
begin
  grTags.Columns[0].Title.Caption :=
    lbTags + '  •••  ' + IntToStr(zqTags.RecordCount);
end;

procedure TfmMain.zqTagsBeforeDelete(DataSet: TDataSet);
begin
  if zqTags.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg023, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end;
end;

procedure TfmMain.zqTagsAfterDelete(DataSet: TDataSet);
begin
  zqTags.ApplyUpdates;
end;

procedure TfmMain.dsTagsDataChange(Sender: TObject; Field: TField);
begin
  if zqTags.RecordCount > 0 then
  begin
    grTags.Options := grTags.Options + [dgEditing];
  end
  else
  begin
    grTags.Options := grTags.Options - [dgEditing];
  end;
end;

procedure TfmMain.zqTagsListAfterScroll(DataSet: TDataSet);
begin
  grTagsList.Columns[0].Title.Caption :=
    lbTagsList + '  •••  ' + IntToStr(zqTagsList.RecordCount);
end;

// ******************** Links ********************

procedure TfmMain.zqLinksBeforeInsert(DataSet: TDataSet);
begin
  if zqNotes.RecordCount = 0 then
  begin
    MessageDlg(msg024, mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfmMain.zqLinksAfterInsert(DataSet: TDataSet);
begin
  zqLinksID_NOTES.Value := zqNotesID.Value;
  zqLinks.Post;
  zqLinks.ApplyUpdates;
end;

procedure TfmMain.zqLinksAfterScroll(DataSet: TDataSet);
begin
  grLinks.Columns[0].Title.Caption :=
    lbLinks + '  •••  ' + IntToStr(zqLinks.RecordCount);
end;

procedure TfmMain.zqLinksBeforeDelete(DataSet: TDataSet);
var
  myDataset: TZQuery;
begin
  if zqLinks.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg025, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end
  else
    try
      myDataset := TZQuery.Create(Self);
      myDataset.Connection := fmMain.zqNotebooks.Connection;
      myDataset.Sql.Add('Select Links.ID from Links');
      myDataset.Sql.Add('where Links.ID_Notes = ' + zqLinksLINK_NOTE.AsString);
      myDataset.Sql.Add('and Links.Link_Note = ' + zqNotesID.AsString);
      myDataSet.Open;
      if myDataset.RecordCount > 0 then
      begin
        myDataset.Delete;
        myDataset.ApplyUpdates;
      end;
      myDataset.Close;
    finally
      myDataset.Free;
    end;
end;

procedure TfmMain.zqLinksAfterDelete(DataSet: TDataSet);
begin
  zqLinks.ApplyUpdates;
end;

// ******************** Tasks ********************

procedure TfmMain.zqTasksBeforeInsert(DataSet: TDataSet);
begin
  if zqNotes.RecordCount = 0 then
  begin
    MessageDlg(msg026, mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfmMain.zqTasksAfterInsert(DataSet: TDataSet);
begin
  zqTasksID_NOTES.Value := zqNotesID.Value;
  zqTasksDONE.Value := 0;
  zqTasksPRIORITY.Value := prior4;
  zqTasks.Post;
  zqTasks.ApplyUpdates;
end;

procedure TfmMain.zqTasksAfterPost(DataSet: TDataSet);
begin
  if ((zqTasksSTART_DATE.IsNull = False) and (zqTasksEND_DATE.IsNull = False) and
    (zqTasksSTART_DATE.Value > zqTasksEND_DATE.Value)) then
  begin
    zqTasks.Edit;
    zqTasksEND_DATE.Value := zqTasksSTART_DATE.Value;
    zqTasks.Post;
  end;
end;

procedure TfmMain.zqTasksBeforeDelete(DataSet: TDataSet);
begin
  if zqTasks.RecordCount = 0 then
  begin
    Abort;
  end
  else
  if MessageDlg(msg027, mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
  begin
    Abort;
  end;
end;

procedure TfmMain.zqTasksAfterDelete(DataSet: TDataSet);
begin
  zqTasks.ApplyUpdates;
end;


// *****************************************************
// ***************** Common procedures *****************
// *****************************************************

procedure TfmMain.Disconnect;
begin
  if zcConnection.Connected = True then
  begin
    iLastNotebook := zqNotebooksID.Value;
    iLastSection := zqSectionsID.Value;
    iLastNote := zqNotesID.Value;
    zcConnection.Disconnect;
  end;
  if fmBookmarks <> nil then
    try
      fmBookmarks.stDbName := StringReplace(dbName, ' ', '', [rfReplaceAll]);
      fmBookmarks.sgBookmarks.SaveOptions := [soContent];
      fmBookmarks.sgBookmarks.SaveToFile(myHomeDir + 'pgnotex-' +
        fmBookmarks.stDbName + '-bookmarks');
    except
    end;
  edPassword.Clear;
  edFind.Clear;
  miFileSave.Enabled := False;
  miFileUndo.Enabled := False;
  miFileRefresh.Enabled := False;
  miFileExport.Enabled := False;
  miFileImport.Enabled := False;
  miFileClose.Enabled := False;
  miEditCut.Enabled := False;
  miEditCopy.Enabled := False;
  miEditPaste.Enabled := False;
  miEditSelectAll.Enabled := False;
  miEditFormatTitles.Enabled := False;
  miEditClean.Enabled := False;
  miEditEncodeLinks.Enabled := False;
  miEditPrevPic.Enabled := False;
  miEditPandoc.Enabled := False;
  miEditBookmarks.Enabled := False;
  miNotebooksNew.Enabled := False;
  miNotebooksDelete.Enabled := False;
  miNotebooksSortby.Enabled := False;
  miNotebooksSortbyCustom.Enabled := False;
  miNotebooksSortbyTitle.Enabled := False;
  miNotebooksMove.Enabled := False;
  miNotebooksMoveUp.Enabled := False;
  miNotebooksMoveDown.Enabled := False;
  miNotebooksComments.Enabled := False;
  miNotebooksCopyID.Enabled := False;
  miSectionsNew.Enabled := False;
  miSectionsDelete.Enabled := False;
  miSectionsSortby.Enabled := False;
  miSectionsSortbyCustom.Enabled := False;
  miSectionsSortbyTitle.Enabled := False;
  miSectionsMove.Enabled := False;
  miSectionsMoveUp.Enabled := False;
  miSectionsMoveDown.Enabled := False;
  miSectionsComments.Enabled := False;
  miSectionsChangeNotebook.Enabled := False;
  miSectionsCopyID.Enabled := False;
  miNotesNew.Enabled := False;
  miNotesDelete.Enabled := False;
  miNotesSortBy.Enabled := False;
  miNotesSortByCustom.Enabled := False;
  miNotesSortByTitle.Enabled := False;
  miNotesSortByModificationDate.Enabled := False;
  miNotesMove.Enabled := False;
  miNotesMoveUp.Enabled := False;
  miNotesMoveDown.Enabled := False;
  miNotesAttachments.Enabled := False;
  miNotesAttachmentsNew.Enabled := False;
  miNotesAttachmentsDelete.Enabled := False;
  miNotesAttachmentsOpen.Enabled := False;
  miNotesAttachmentsSaveAs.Enabled := False;
  miNotesAttachmentsSaveDownloads.Enabled := False;
  miNotesAttachmentsLoadDownloads.Enabled := False;
  miNotesAttachmentsInsertAs.Enabled := False;
  miNotesTags.Enabled := False;
  miNotesTagsNew.Enabled := False;
  miNotesTagsDelete.Enabled := False;
  miNotesTagsRename.Enabled := False;
  miNotesTagsDeleteEmpty.Enabled := False;
  miNotesLinks.Enabled := False;
  miNotesLinksNew.Enabled := False;
  miNotesLinksDelete.Enabled := False;
  miNotesLinksLocate.Enabled := False;
  miNotesTasks.Enabled := False;
  miNotesTasksNew.Enabled := False;
  miNotesTasksDelete.Enabled := False;
  miNotesTasksRefresh.Enabled := False;
  miNotesTasksHide.Enabled := False;
  miNotesShowAllTasks.Enabled := False;
  miNotesImport.Enabled := False;
  miNoteschangeSection.Enabled := False;
  miNotesCopyID.Enabled := False;
  miNotesSearch.Enabled := False;
  miNotesFind.Enabled := False;
  miToolsShowEditor.Enabled := False;
  lbFound.Caption := msg041 + ' 0';
  fmMain.KeyPreview := False;
  shSave.Brush.Color := clForm;
  if miToolsShowEditor.Checked = True then
  begin
    miToolsShowEditorClick(nil);
  end;
  pnMain.Visible := False;
  if fmMain.WindowState = wsMaximized then
  begin
    pnlogin.Left := (Screen.Width - pnLogin.Width) div 2;
    pnLogin.Top := (Screen.Height - PnLogin.Height) div 2;
  end
  else
  begin
    pnlogin.Left := (fmMain.Width - pnLogin.Width) div 2;
    pnLogin.Top := (fmMain.Height - PnLogin.Height) div 2;
  end;
  pnLogin.Visible := True;
  lbInfo.Caption := '';
  lbTime.Visible := False;
end;

procedure TfmMain.Connect;
begin
  zcConnection.User := edUserName.Text;
  zcConnection.Password := edPassword.Text;
  zcConnection.Database := edDbName.Text;
  dbname := edDbName.Text;
  fmBookmarks.stDbName := StringReplace(dbName, ' ', '', [rfReplaceAll]);
  if FileExistsUTF8(myHomeDir + 'pgnotex-' + fmBookmarks.stDbName + '-bookmarks') then
  begin
    fmBookmarks.sgBookmarks.LoadFromFile(myHomeDir + 'pgnotex-' +
      fmBookmarks.stDbName + '-bookmarks');
  end;
  try
    zcConnection.Connect;
  except
    MessageDlg(msg028, mtWarning, [mbOK], 0);
    edPassword.Clear;
    edPassword.SetFocus;
    Exit;
  end;
  edPassword.Clear;
  pnMain.Visible := True;
  pnLogin.Visible := False;
  zqNotebooks.Open;
  zqSections.Open;
  zqNotes.Open;
  zqAttachments.Open;
  zqTags.Open;
  zqTagsList.Open;
  zqLinks.Open;
  zqTasks.Open;
  miFileSave.Enabled := False;
  miFileUndo.Enabled := False;
  miFileRefresh.Enabled := True;
  miFileExport.Enabled := True;
  miFileImport.Enabled := True;
  miFileClose.Enabled := True;
  miEditCut.Enabled := True;
  miEditCopy.Enabled := True;
  miEditPaste.Enabled := True;
  miEditSelectAll.Enabled := True;
  miEditFormatTitles.Enabled := True;
  miEditClean.Enabled := True;
  miEditEncodeLinks.Enabled := True;
  miEditPrevPic.Enabled := True;
  miEditPandoc.Enabled := True;
  miEditBookmarks.Enabled := True;
  miNotebooksNew.Enabled := True;
  miNotebooksDelete.Enabled := True;
  miNotebooksSortby.Enabled := True;
  miNotebooksSortbyCustom.Enabled := True;
  miNotebooksSortbyTitle.Enabled := True;
  miNotebooksMove.Enabled := True;
  miNotebooksMoveUp.Enabled := miNotebooksSortbyCustom.Checked;
  miNotebooksMoveDown.Enabled := miNotebooksSortbyCustom.Checked;
  miNotebooksComments.Enabled := True;
  miNotebooksCopyID.Enabled := True;
  miSectionsNew.Enabled := True;
  miSectionsDelete.Enabled := True;
  miSectionsSortby.Enabled := True;
  miSectionsSortbyCustom.Enabled := True;
  miSectionsSortbyTitle.Enabled := True;
  miSectionsMove.Enabled := True;
  miSectionsMoveUp.Enabled := miSectionsSortbyCustom.Checked;
  miSectionsMoveDown.Enabled := miSectionsSortbyCustom.Checked;
  miSectionsComments.Enabled := True;
  miSectionsChangeNotebook.Enabled := True;
  miSectionsCopyID.Enabled := True;
  miNotesNew.Enabled := True;
  miNotesDelete.Enabled := True;
  miNotesSortBy.Enabled := True;
  miNotesSortByCustom.Enabled := True;
  miNotesSortByTitle.Enabled := True;
  miNotesSortByModificationDate.Enabled := True;
  miNotesMove.Enabled := True;
  miNotesMoveUp.Enabled := miNotesSortByCustom.Checked;
  miNotesMoveDown.Enabled := miNotesSortByCustom.Checked;
  miNotesAttachments.Enabled := True;
  miNotesAttachmentsNew.Enabled := True;
  miNotesAttachmentsDelete.Enabled := True;
  miNotesAttachmentsOpen.Enabled := True;
  miNotesAttachmentsSaveAs.Enabled := True;
  miNotesAttachmentsSaveDownloads.Enabled := True;
  miNotesAttachmentsLoadDownloads.Enabled := True;
  miNotesAttachmentsInsertAs.Enabled := True;
  miNotesTags.Enabled := True;
  miNotesTagsNew.Enabled := True;
  miNotesTagsDelete.Enabled := True;
  miNotesTagsRename.Enabled := True;
  miNotesTagsDeleteEmpty.Enabled := True;
  miNotesLinks.Enabled := True;
  miNotesLinksNew.Enabled := True;
  miNotesLinksDelete.Enabled := True;
  miNotesLinksLocate.Enabled := True;
  miNotesTasks.Enabled := True;
  miNotesTasksNew.Enabled := True;
  miNotesTasksDelete.Enabled := True;
  miNotesTasksRefresh.Enabled := True;
  miNotesTasksHide.Enabled := True;
  miNotesShowAllTasks.Enabled := True;
  miNotesImport.Enabled := True;
  miNoteschangeSection.Enabled := True;
  miNotesCopyID.Enabled := True;
  miNotesSearch.Enabled := True;
  miNotesFind.Enabled := True;
  miToolsShowEditor.Enabled := True;
  blLoadNotes := False;
  zqNotebooks.Locate('ID', iLastNotebook, []);
  zqSections.Locate('ID', iLastSection, []);
  zqNotes.Locate('ID', iLastNote, []);
  blLoadNotes := True;
  zqNotesAfterScroll(nil);
  pcPageControl.ActivePageIndex := 0;
  shSave.Brush.Color := TColor($76CF76);
  fmMain.KeyPreview := True;
  lbTime.Visible := True;
end;

procedure TfmMain.SaveAll;
begin
  try
    if dsNotebooks.State in [dsEdit, dsInsert] then
    begin
      zqNotebooks.Post;
    end;
    if zqNotebooks.UpdatesPending = True then
    begin
      zqNotebooks.ApplyUpdates;
    end;
    if dsSections.State in [dsEdit, dsInsert] then
    begin
      zqSections.Post;
    end;
    if zqSections.UpdatesPending = True then
    begin
      zqSections.ApplyUpdates;
    end;
    if dsNotes.State in [dsEdit, dsInsert] then
    begin
      zqNotes.Post;
    end;
    if zqNotes.UpdatesPending = True then
    begin
      zqNotes.ApplyUpdates;
    end;
    if dsAttachments.State in [dsEdit, dsInsert] then
    begin
      zqAttachments.Post;
    end;
    if zqAttachments.UpdatesPending = True then
    begin
      zqAttachments.ApplyUpdates;
    end;
    if dsTags.State in [dsEdit, dsInsert] then
    begin
      zqTags.Post;
    end;
    if zqTags.UpdatesPending = True then
    begin
      zqTags.ApplyUpdates;
    end;
    if dsLinks.State in [dsEdit, dsInsert] then
    begin
      zqLinks.Post;
    end;
    if zqLinks.UpdatesPending = True then
    begin
      zqLinks.ApplyUpdates;
    end;
    if dsTasks.State in [dsEdit, dsInsert] then
    begin
      zqTasks.Post;
    end;
    if zqTasks.UpdatesPending = True then
    begin
      zqTasks.ApplyUpdates;
    end;
  except
    MessageDlg(msg029, mtWarning, [mbOK], 0);
  end;
end;

procedure TfmMain.ResetChanges;
begin
  if MessageDlg(msg030, mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
    try
      if dsNotebooks.State in [dsEdit, dsInsert] then
      begin
        zqNotebooks.CancelUpdates;
      end;
      if dsSections.State in [dsEdit, dsInsert] then
      begin
        zqSections.CancelUpdates;
      end;
      if dsNotes.State in [dsEdit, dsInsert] then
      begin
        zqNotes.CancelUpdates;
      end;
      if dsAttachments.State in [dsEdit, dsInsert] then
      begin
        zqAttachments.CancelUpdates;
      end;
      if dsTags.State in [dsEdit, dsInsert] then
      begin
        zqTags.CancelUpdates;
      end;
      if dsLinks.State in [dsEdit, dsInsert] then
      begin
        zqLinks.CancelUpdates;
      end;
      if dsTasks.State in [dsEdit, dsInsert] then
      begin
        zqTasks.CancelUpdates;
      end;
      zqNotesAfterScroll(nil);
    except
      MessageDlg(msg031, mtError, [mbOK], 0);
    end;
end;

procedure TfmMain.RefreshData;
begin
  try
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    try
      zqNotebooks.Refresh;
      zqSections.Refresh;
      zqNotes.Refresh;
      zqAttachments.Refresh;
      zqTags.Refresh;
      zqTagsList.Refresh;
      zqLinks.Refresh;
      zqTasks.Refresh;
      zqNotesAfterScroll(nil);
    except
      MessageDlg(msg032, mtWarning, [mbOK], 0);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmMain.FindNotes;
var
  stDateIni, stDateEnd, stTags, stText, stCapVal: string;
  dtDate: TDate;
  myDateFormat: TFormatSettings;
begin
  SaveAll;
  if edFind.Text <> '' then
  begin
    lbFound.Caption := msg041 + ' 0';
    if cbFields.ItemIndex < 6 then
    begin
      stText := StringReplace(edFind.Text, #39, #39#39, [rfReplaceAll]);
    end
    else
    begin
      stText := edFind.Text;
    end;
    stCapVal := UTF8UpperString(UTF8Copy(stText, 1, 1)) +
      UTF8Copy(stText, 2, StrToNSString(stText, True).length);
    if cbFields.ItemIndex < 3 then
    begin
      zqFind.Close;
      zqFind.Sql.Clear;
      zqFind.SQL.Add('Select Notebooks.ID as IDNotebooks,');
      zqFind.SQL.Add('Sections.ID as IDSections,');
      zqFind.SQL.Add('Notes.ID as IDNotes,');
      zqFind.SQL.Add('Notebooks.Title as TitleNotebooks,');
      zqFind.SQL.Add('Sections.Title as TitleSections,');
      zqFind.SQL.Add('Notes.Title as TitleNotes');
      zqFind.SQL.Add('from Notebooks, Sections, Notes');
      zqFind.SQL.Add('where Notebooks.ID = Sections.ID_Notebooks');
      zqFind.SQL.Add('and Sections.ID = Notes.ID_Sections');
      if cbSearchRange.ItemIndex = 1 then
      begin
        zqFind.SQL.Add('and Notebooks.ID = ' + zqNotebooksID.AsString);
      end
      else
      if cbSearchRange.ItemIndex = 2 then
      begin
        zqFind.SQL.Add('and Sections.ID = ' + zqSectionsID.AsString);
      end;
      if cbFields.ItemIndex = 0 then
      begin
        zqFind.SQL.Add('and ' + '((Notes.Title like ' + #39 +
          '%' + stText + '%' + #39 + ')' + ' or ' + '(Notes.Title like ' +
          #39 + '%' + stCapVal + '%' + #39 + '))');
      end
      else if cbFields.ItemIndex = 1 then
      begin
        zqFind.SQL.Add('and ' + '((Notes.Text like ' + #39 + '%' +
          stText + '%' + #39 + ')' + ' or ' + '(Notes.Text like ' +
          #39 + '%' + stCapVal + '%' + #39 + '))');
      end
      else if cbFields.ItemIndex = 2 then
      begin
        myDateFormat.ShortDateFormat := 'yyyy-mm-dd';
        if UpperCase(stText) = 'TODAY' then
        begin
          zqFind.SQL.Add('and Notes.Modification_Date >= ' + #39 +
            DateToStr(Date, myDateFormat) + #39);
        end
        else
        if UpperCase(stText) = 'YESTERDAY' then
        begin
          zqFind.SQL.Add('and Notes.Modification_Date >= ' + #39 +
            DateToStr(Date - 1, myDateFormat) + #39);
          zqFind.SQL.Add('and Notes.Modification_Date < ' + #39 +
            DateToStr(Date, myDateFormat) + #39);
        end
        else
        begin
          stDateIni := Copy(stText, 1, Pos(' - ', stText) - 1);
          if TryStrToDate(stDateIni, dtDate) = False then
          begin
            MessageDlg(msg033, mtWarning, [mbOK], 0);
            Exit;
          end;
          stDateIni := #39 + DateToStr(dtDate, myDateFormat) + #39;
          stDateEnd := Copy(stText, Pos(' - ', stText) + 3, Length(stText));
          if TryStrToDate(stDateEnd, dtDate) = False then
          begin
            MessageDlg(msg034, mtWarning, [mbOK], 0);
            Exit;
          end;
          stDateEnd := #39 + DateToStr(dtDate, myDateFormat) + #39;
          zqFind.SQL.Add('and Notes.Modification_Date >= ' + stDateIni);
          zqFind.SQL.Add('and Notes.Modification_Date <= ' + stDateEnd);
        end;
      end;
      zqFind.SQL.Add('order by Notes.Title');
      zqFind.Open;
    end
    else
    if cbFields.ItemIndex = 3 then
    begin
      stTags := #39 + stText + #39;
      stTags := StringReplace(stTags, '  ', ' ', [rfReplaceAll]);
      stTags := StringReplace(stTags, ', ', #39 + ', ' + #39, [rfReplaceAll]);
      zqFind.Close;
      zqFind.Sql.Clear;
      zqFind.SQL.Add('Select distinct Notebooks.ID as IDNotebooks,');
      zqFind.SQL.Add('Sections.ID as IDSections,');
      zqFind.SQL.Add('Notes.ID as IDNotes,');
      zqFind.SQL.Add('Notebooks.Title as TitleNotebooks,');
      zqFind.SQL.Add('Sections.Title as TitleSections,');
      zqFind.SQL.Add('Notebooks.Ord as OrdNotebooks,');
      zqFind.SQL.Add('Sections.Ord as OrdSections,');
      zqFind.SQL.Add('Notes.Ord as OrdNotes,');
      zqFind.SQL.Add('Notes.Title as TitleNotes');
      zqFind.SQL.Add('from Notebooks, Sections, Notes, Tags');
      zqFind.SQL.Add('where Notebooks.ID = Sections.ID_Notebooks');
      zqFind.SQL.Add('and Sections.ID = Notes.ID_Sections');
      zqFind.SQL.Add('and Notes.ID = Tags.ID_Notes');
      if cbSearchRange.ItemIndex = 1 then
      begin
        zqFind.SQL.Add('and Notebooks.ID = ' + zqNotebooksID.AsString);
      end
      else
      if cbSearchRange.ItemIndex = 2 then
      begin
        zqFind.SQL.Add('and Sections.ID = ' + zqSectionsID.AsString);
      end;
      zqFind.SQL.Add('and Tags.Tag in (' + stTags + ')');
      zqFind.SQL.Add('order by Notes.Title');
      zqFind.Open;
    end
    else
    if cbFields.ItemIndex = 4 then
    begin
      zqFind.Close;
      zqFind.Sql.Clear;
      zqFind.SQL.Add('Select distinct Notebooks.ID as IDNotebooks,');
      zqFind.SQL.Add('Sections.ID as IDSections,');
      zqFind.SQL.Add('Notes.ID as IDNotes,');
      zqFind.SQL.Add('Notebooks.Title as TitleNotebooks,');
      zqFind.SQL.Add('Sections.Title as TitleSections,');
      zqFind.SQL.Add('Notebooks.Ord as OrdNotebooks,');
      zqFind.SQL.Add('Sections.Ord as OrdSections,');
      zqFind.SQL.Add('Notes.Ord as OrdNotes,');
      zqFind.SQL.Add('Notes.Title as TitleNotes');
      zqFind.SQL.Add('from Notebooks, Sections, Notes, Attachments');
      zqFind.SQL.Add('where Notebooks.ID = Sections.ID_Notebooks');
      zqFind.SQL.Add('and Sections.ID = Notes.ID_Sections');
      zqFind.SQL.Add('and Notes.ID = Attachments.ID_Notes');
      if cbSearchRange.ItemIndex = 1 then
      begin
        zqFind.SQL.Add('and Notebooks.ID = ' + zqNotebooksID.AsString);
      end
      else
      if cbSearchRange.ItemIndex = 2 then
      begin
        zqFind.SQL.Add('and Sections.ID = ' + zqSectionsID.AsString);
      end;
      zqFind.SQL.Add('and ' + '((Attachments.Title like ' + #39 +
        '%' + stText + '%' + #39 + ')' + ' or ' + '(Attachments.Title like ' +
        #39 + '%' + stCapVal + '%' + #39 + '))');
      zqFind.SQL.Add('order by Notes.Title');
      zqFind.Open;
    end
    else
    if cbFields.ItemIndex = 5 then
    begin
      zqFind.Close;
      zqFind.Sql.Clear;
      zqFind.SQL.Add('Select distinct Notebooks.ID as IDNotebooks,');
      zqFind.SQL.Add('Sections.ID as IDSections,');
      zqFind.SQL.Add('Notes.ID as IDNotes,');
      zqFind.SQL.Add('Notebooks.Title as TitleNotebooks,');
      zqFind.SQL.Add('Sections.Title as TitleSections,');
      zqFind.SQL.Add('Notebooks.Ord as OrdNotebooks,');
      zqFind.SQL.Add('Sections.Ord as OrdSections,');
      zqFind.SQL.Add('Notes.Ord as OrdNotes,');
      zqFind.SQL.Add('Notes.Title as TitleNotes');
      zqFind.SQL.Add('from Notebooks, Sections, Notes, Tasks');
      zqFind.SQL.Add('where Notebooks.ID = Sections.ID_Notebooks');
      zqFind.SQL.Add('and Sections.ID = Notes.ID_Sections');
      zqFind.SQL.Add('and Notes.ID = Tasks.ID_Notes');
      if cbSearchRange.ItemIndex = 1 then
      begin
        zqFind.SQL.Add('and Notebooks.ID = ' + zqNotebooksID.AsString);
      end
      else
      if cbSearchRange.ItemIndex = 2 then
      begin
        zqFind.SQL.Add('and Sections.ID = ' + zqSectionsID.AsString);
      end;
      zqFind.SQL.Add('and ' + '((Tasks.Title like ' + #39 + '%' +
        stText + '%' + #39 + ')' + ' or ' + '(tasks.Title like ' +
        #39 + '%' + stCapVal + '%' + #39 + '))');
      zqFind.SQL.Add('order by Notes.Title');
      zqFind.Open;
    end
    else
    if cbFields.ItemIndex = 6 then
    begin
      zqFind.Close;
      zqFind.Sql.Clear;
      zqFind.SQL.Add('Select distinct Notebooks.ID as IDNotebooks,');
      zqFind.SQL.Add('Sections.ID as IDSections,');
      zqFind.SQL.Add('Notes.ID as IDNotes,');
      zqFind.SQL.Add('Notebooks.Title as TitleNotebooks,');
      zqFind.SQL.Add('Sections.Title as TitleSections,');
      zqFind.SQL.Add('Notebooks.Ord as OrdNotebooks,');
      zqFind.SQL.Add('Sections.Ord as OrdSections,');
      zqFind.SQL.Add('Notes.Ord as OrdNotes,');
      zqFind.SQL.Add('Notes.Title as TitleNotes');
      zqFind.SQL.Add('from Notebooks, Sections, Notes');
      zqFind.SQL.Add('left join Attachments on Attachments.ID_Notes = Notes.ID');
      zqFind.SQL.Add('left join Tags on Tags.ID_Notes = Notes.ID');
      zqFind.SQL.Add('left join Tasks on Tasks.ID_Notes = Notes.ID');
      zqFind.SQL.Add('where Notebooks.ID = Sections.ID_Notebooks');
      zqFind.SQL.Add('and Sections.ID = Notes.ID_Sections');
      if cbSearchRange.ItemIndex = 1 then
      begin
        zqFind.SQL.Add('and Notebooks.ID = ' + zqNotebooksID.AsString);
      end
      else
      if cbSearchRange.ItemIndex = 2 then
      begin
        zqFind.SQL.Add('and Sections.ID = ' + zqSectionsID.AsString);
      end;
      zqFind.SQL.Add('and (' + stText + ')');
      zqFind.SQL.Add('order by Notes.Title');
      try
        zqFind.Open;
      except
        MessageDlg(msg043, mtError, [mbOK], 0);
        Exit;
      end;
    end;
    lbFound.Caption := msg041 + ' ' + FormatFloat('#,##0',
      zqFind.RecordCount);
    if grFind.Visible = True then
    begin
      grFind.SetFocus;
    end;
  end
  else
  begin
    zqFind.Close;
    zqFind.Sql.Clear;
    lbFound.Caption := msg041 + ' 0';
  end;
end;

procedure TfmMain.FormatListTitles(ListTitles: boolean; FormatText: boolean);
var
  i, iPos, iTit1, iTit2, iTit3, iTit4, iTit5, iTit6, iFontSize: integer;
  stTit: string = '';
  rng: NSRange;
  fd: NSFontDescriptor;
  myFont: NSFont;
  dict: NSDictionary;
  par: NSMutableParagraphStyle;
begin
  if ((zqNotes.RecordCount = 0) or (dbText.Text = '')) then
  begin
    sgTitles.RowCount := 0;
    Exit;
  end;
  if FormatText = True then
  begin
    iFontSize := -dbText.font.Height;
    rng.location := 0;
    rng.length := StrToNSString(dbText.Text, True).length;
    dict := GetDict(TCocoaTextView(NSScrollView(dbText.Handle).documentView).
         textStorage, rng.location);
    par := GetWritePara(TCocoaTextView(
      NSScrollView(dbText.Handle).documentView).textStorage, 1);
    par.setLineSpacing(iLineSpacing);
    par.setParagraphSpacing(iParSpacing);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      textStorage.addAttribute_value_range(NSParagraphStyleAttributeName,
      par, rng);
    myFont := dict.objectForKey(NSFontAttributeName);
     fd := FindFont(dbText.Font.Name, 0);
     myFont := NSFont.fontWithDescriptor_size(fd,  iFontSize);
     TCocoaTextView(NSScrollView(dbText.Handle).documentView).textStorage.
       addAttribute_value_range(NSFontAttributeName, myFont, rng);
     TCocoaTextView(NSScrollView(dbText.Handle).documentView).textStorage.
       removeAttribute_range(NSUnderlineStyleAttributeName, rng);
     TCocoaTextView(NSScrollView(dbText.Handle).documentView).textStorage.
       removeAttribute_range(NSStrikethroughStyleAttributeName, rng);
     TCocoaTextView(NSScrollView(dbText.Handle).documentView).textStorage.
       removeAttribute_range(NSStrokeWidthAttributeName, rng);
     TCocoaTextView(NSScrollView(dbText.Handle).documentView).textStorage.
       removeAttribute_range(NSBackgroundColorAttributeName, rng);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      setTextColor_range(ColorToNSColor(dbText.Font.Color), rng);
    TCocoaTextView(NSScrollView(dbText.Handle).documentView).
      checkTextInDocument(nil);
  end;
  if ((dbText.Text = '') or (StrToNSString(dbText.Text, True).length > iMaxSize)) then
  begin
    if ListTitles = True then
    begin
      sgTitles.RowCount := 0;
    end;
  end
  else
  begin
    iTit1 := 0;
    iTit2 := 0;
    iTit3 := 0;
    iTit4 := 0;
    iTit5 := 0;
    iTit6 := 0;
    if ListTitles = True then
    begin
      sgTitles.RowCount := 0;
    end;
    if dbText.Lines[0] = '---' then
    begin
      if FormatText = True then
      begin
        rng.location := 0;
        rng.length := 3;
        TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
          setTextColor_range(ColorToNSColor(clTitle1), rng);
      end;
      iPos := 4;
      for i := 1 to dbText.Lines.Count - 1 do
      begin
        if i = 10 then
        begin
          iEndHeading := i;
          Break;
        end;
        if dbText.Lines[i] = '---' then
        begin
          if FormatText = True then
          begin
            rng.location := iPos;
            rng.length := StrToNSString(dbText.Lines[i], True).length;
            TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
              setTextColor_range(ColorToNSColor(clTitle1), rng);
          end;
          iEndHeading := i;
          Break;
        end;
        if FormatText = True then
        begin
          rng.location := iPos;
          rng.length := UTF8CocoaPos(':', dbText.Lines[i]);
          TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
            setTextColor_range(ColorToNSColor(clTitle1), rng);
        end;
        iPos := iPos + StrToNSString(dbText.Lines[i], True).length +
          UTF8Length(LineEnding);
      end;
    end;
    iPos := 0;
    for i := 0 to dbText.Lines.Count - 1 do
    begin
      if UTF8Copy(dbText.Lines[i], 1, 1) <> '#' then
      begin
        iPos := iPos + StrToNSString(dbText.Lines[i], True).length +
          UTF8Length(LineEnding);
        Continue;
      end;
      if UTF8Copy(dbText.Lines[i], 1, 2) = '# ' then
      begin
        if FormatText = True then
        begin
          rng.location := iPos;
          rng.length := StrToNSString(dbText.Lines[i], True).length;
          TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
            setTextColor_range(ColorToNSColor(clTitle1), rng);
        end;
        if ListTitles = True then
        begin
          if blNumTitles = True then
          begin
            Inc(iTit1);
            iTit2 := 0;
            iTit3 := 0;
            iTit4 := 0;
            iTit5 := 0;
            iTit6 := 0;
            stTit := IntToStr(iTit1) + '. ';
          end;
          sgTitles.RowCount := sgTitles.RowCount + 1;
          sgTitles.Cells[0, sgTitles.RowCount - 1] :=
            stTit + UTF8Copy(dbText.Lines[i], 3,
            StrToNSString(dbText.Lines[i], True).length);
        end;
      end
      else
      if UTF8Copy(dbText.Lines[i], 1, 3) = '## ' then
      begin
        if FormatText = True then
        begin
          rng.location := iPos;
          rng.length := StrToNSString(dbText.Lines[i], True).length;
          TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
            setTextColor_range(ColorToNSColor(clTitle2), rng);
        end;
        if ListTitles = True then
        begin
          if blNumTitles = True then
          begin
            Inc(iTit2);
            iTit3 := 0;
            iTit4 := 0;
            iTit5 := 0;
            iTit6 := 0;
            stTit := IntToStr(iTit1) + '.' + IntToStr(iTit2) + '. ';
          end;
          sgTitles.RowCount := sgTitles.RowCount + 1;
          sgTitles.Cells[0, sgTitles.RowCount - 1] :=
            Space(3) + stTit + UTF8Copy(dbText.Lines[i], 4,
            StrToNSString(dbText.Lines[i], True).length);
        end;
      end
      else
      if UTF8Copy(dbText.Lines[i], 1, 4) = '### ' then
      begin
        if FormatText = True then
        begin
          rng.location := iPos;
          rng.length := StrToNSString(dbText.Lines[i], True).length;
          TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
            setTextColor_range(ColorToNSColor(clTitle3), rng);
        end;
        if ListTitles = True then
        begin
          if blNumTitles = True then
          begin
            Inc(iTit3);
            iTit4 := 0;
            iTit5 := 0;
            iTit6 := 0;
            stTit := IntToStr(iTit1) + '.' + IntToStr(iTit2) + '.' +
              IntToStr(iTit3) + '. ';
          end;
          sgTitles.RowCount := sgTitles.RowCount + 1;
          sgTitles.Cells[0, sgTitles.RowCount - 1] :=
            Space(6) + stTit + UTF8Copy(dbText.Lines[i], 5,
            StrToNSString(dbText.Lines[i], True).length);
        end;
      end
      else
      if UTF8Copy(dbText.Lines[i], 1, 5) = '#### ' then
      begin
        if FormatText = True then
        begin
          rng.location := iPos;
          rng.length := StrToNSString(dbText.Lines[i], True).length;
          TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
            setTextColor_range(ColorToNSColor(clTitle3), rng);
        end;
        if ListTitles = True then
        begin
          if blNumTitles = True then
          begin
            Inc(iTit4);
            iTit5 := 0;
            iTit6 := 0;
            stTit := IntToStr(iTit1) + '.' + IntToStr(iTit2) + '.' +
              IntToStr(iTit3) + '.' + IntToStr(iTit4) + '. ';
          end;
          sgTitles.RowCount := sgTitles.RowCount + 1;
          sgTitles.Cells[0, sgTitles.RowCount - 1] :=
            Space(9) + stTit + UTF8Copy(dbText.Lines[i], 6,
            StrToNSString(dbText.Lines[i], True).length);
        end;
      end
      else
      if UTF8Copy(dbText.Lines[i], 1, 6) = '##### ' then
      begin
        if FormatText = True then
        begin
          rng.location := iPos;
          rng.length := StrToNSString(dbText.Lines[i], True).length;
          TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
            setTextColor_range(ColorToNSColor(clTitle3), rng);
        end;
        if ListTitles = True then
        begin
          if blNumTitles = True then
          begin
            Inc(iTit5);
            iTit6 := 0;
            stTit := IntToStr(iTit1) + '.' + IntToStr(iTit2) + '.' +
              IntToStr(iTit3) + '.' + IntToStr(iTit4) + '.' +
              IntToStr(iTit5) + '. ';
          end;
          sgTitles.RowCount := sgTitles.RowCount + 1;
          sgTitles.Cells[0, sgTitles.RowCount - 1] :=
            Space(12) + stTit + UTF8Copy(dbText.Lines[i], 7,
            StrToNSString(dbText.Lines[i], True).length);
        end;
      end
      else
      if UTF8Copy(dbText.Lines[i], 1, 7) = '###### ' then
      begin
        if FormatText = True then
        begin
          rng.location := iPos;
          rng.length := StrToNSString(dbText.Lines[i], True).length;
          TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
            setTextColor_range(ColorToNSColor(clTitle3), rng);
        end;
        if ListTitles = True then
        begin
          if blNumTitles = True then
          begin
            Inc(iTit6);
            stTit := IntToStr(iTit1) + '.' + IntToStr(iTit2) + '.' +
              IntToStr(iTit3) + '.' + IntToStr(iTit4) + '.' +
              IntToStr(iTit5) + '.' + IntToStr(iTit6) + '. ';
          end;
          sgTitles.RowCount := sgTitles.RowCount + 1;
          sgTitles.Cells[0, sgTitles.RowCount - 1] :=
            Space(15) + stTit + UTF8Copy(dbText.Lines[i], 8,
            StrToNSString(dbText.Lines[i], True).length);
        end;
      end;
      iPos := iPos + StrToNSString(dbText.Lines[i], True).length +
        UTF8Length(LineEnding);
    end;
  end;
  if FormatText = True then
  begin
    dbText.Refresh;
  end;
end;

procedure TfmMain.SelectTitle;
var
  i, iCharCount, iTitleCount, iShift: integer;
  rng: NSRange;
begin
  if ((sgTitles.RowCount = 0) or (dbText.Text = '')) then
    Exit;
  iCharCount := 0;
  iTitlecount := 0;
  for i := 0 to dbText.Lines.Count - 1 do
  begin
    if UTF8Copy(dbText.Lines[i], 1, 1) = '#' then
    begin
      Inc(iTitleCount);
    end;
    if iTitleCount = sgTitles.Row + 1 then
    begin
      Break;
    end;
    iCharCount := iCharCount + StrToNSString(dbText.Lines[i], True).length +
      UTF8Length(LineEnding);
  end;
  dbText.SelStart := iCharCount;
  iShift := UTF8CocoaPos(' ', dbText.Lines[dbText.CaretPos.Y]);
  dbText.SelStart := dbText.SelStart + iShift;
  rng.location := dbText.SelStart;
  if StrToNSString(dbText.Lines[dbText.CaretPos.Y], True).
    length - iShift > 0 then
  begin
    rng.length := StrToNSString(dbText.Lines[dbText.CaretPos.Y], True).
      length - iShift;
  end
  else
  begin
    rng.length := 0;
  end;
  pcPageControl.ActivePageIndex := 0;
  if dbText.Visible = True then
  begin
    dbText.SetFocus;
    dbText.SelStart := rng.location;
    // Necessary to avoid random non-highlights
    Sleep(100);
    Application.ProcessMessages;
    TCocoaTextView(NSScrollView(fmMain.dbText.Handle).documentView).
      showFindIndicatorForRange(rng);
  end;
end;

procedure TfmMain.RenumberList(blAll: boolean);
var
  i, iStart, iEnd, iPos, iNum, iTest: integer;
  rng: NSRange;
begin
  if ((zqNotes.RecordCount = 0) or (dbText.Text = '')) then
  begin
    Exit;
  end;
  iPos := dbText.SelStart;
  if blAll = True then
  begin
    iStart := 0;
    iEnd := StrToNSString(dbText.Text, True).length - 6;
  end
  else
  begin
    // characterAtIndex is 0 based
    iStart := dbText.SelStart - 1;
    while ((iStart >= 0) and (iStart < StrToNSString(dbText.Text, True).length - 3)) do
    begin
      if ((Chr(StrToNSString(dbText.Text, True).characterAtIndex(iStart)) =
        LineEnding) and (Chr(StrToNSString(dbText.Text,
        True).characterAtIndex(iStart + 1)) = LineEnding)) then
      begin
        Break;
      end;
      Dec(iStart);
    end;
    Inc(iStart);
    iEnd := dbText.SelStart - 1;
    while (iEnd < StrToNSString(dbText.Text, True).length - 5) do
    begin
      if ((Chr(StrToNSString(dbText.Text, True).characterAtIndex(iEnd)) =
        LineEnding) and (Chr(StrToNSString(dbText.Text,
        True).characterAtIndex(iEnd + 1)) = LineEnding)) then
      begin
        Break;
      end;
      Inc(iEnd);
    end;
  end;
  iNum := 1;
  for i := iStart to iEnd do
  begin
    if ((i >= iEnd) or (iEnd > StrToNSString(dbText.Text, True).length - 5)) then
    begin
      Continue;
    end;
    if Chr(StrToNSString(dbText.Text, True).characterAtIndex(i)) = LineEnding then
    begin
      if ((TryStrToInt(NSStringToString(StrToNSString(dbText.Text,
        True).substringWithRange(NSMakeRange(i + 1, 1))), iTest) = True) and
        (StrToNSString(dbText.Text, True).substringWithRange(
        NSMakeRange(i + 2, 2)) = NSStringUtf8('. '))) then
      begin
        rng.location := i + 1;
        rng.length := 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          insertText_replacementRange(NSStringUtf8(IntToStr(iNum)), rng);
        iEnd := iEnd + UTF8Length(IntToStr(iNum)) - 1;
        if iPos > i + 1 then
        begin
          iPos := iPos + UTF8Length(IntToStr(iNum)) - 1;
        end;
        Inc(iNum);
      end
      else
      if ((TryStrToInt(NSStringToString(StrToNSString(dbText.Text,
        True).substringWithRange(NSMakeRange(i + 1, 2))), iTest) = True) and
        (StrToNSString(dbText.Text, True).substringWithRange(
        NSMakeRange(i + 3, 2)) = NSStringUtf8('. '))) then
      begin
        rng.location := i + 1;
        rng.length := 2;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          insertText_replacementRange(NSStringUtf8(IntToStr(iNum)), rng);
        iEnd := iEnd + UTF8Length(IntToStr(iNum)) - 2;
        if iPos > i + 1 then
        begin
          iPos := iPos + UTF8Length(IntToStr(iNum)) - 2;
        end;
        Inc(iNum);
      end
      else
      begin
        iNum := 1;
      end;
    end;
  end;
  dbText.SelStart := iPos;
end;

procedure TfmMain.RenumberFootnotes;
var
  iPos, iOld, iNew, iLine, iStart, iNum, i: integer;
  stOld: string;
  slNotesList: TStringList;
begin
  if ((zqNotes.RecordCount = 0) or
   (dbText.Text = '') or
   (dbText.SelStart < 1)) then
  begin
    Exit;
  end;
  iPos := 1;
  while ((iPos < StrToNSString(dbText.Text, True).length) and
      (UTF8CocoaPos('[^', dbText.Text, iPos) > 0)) do
  begin
    iPos := UTF8CocoaPos('[^', dbText.Text, iPos) + 1;
    if ((iPos < 2) or (Chr(StrToNSString(dbText.Text, True).characterAtIndex(
      iPos - 3)) = LineEnding)) then
    begin
      Inc(iPos);
      Continue;
    end;
    stOld := NSStringToString(StrToNSString(dbText.Text,
      True).substringWithRange(NSMakeRange(iPos, UTF8CocoaPos(']',
      dbText.Text, iPos) - iPos - 1)));
    if TryStrToInt(stOld, iOld) = True then
    begin
      dbText.Text := StringReplace(dbText.Text, '[^' + IntToStr(iOld) +
        ']', '[^' + IntToStr(iOld + 10000) + ']', []);
      dbText.Text := StringReplace(dbText.Text, LineEnding + '[^' +
        IntToStr(iOld) + ']:', LineEnding + '[^' + IntToStr(iOld + 10000) + ']:', []);
    end;
  end;
  iNew := 1;
  iPos := 1;
  while UTF8CocoaPos('[^', dbText.Text, iPos) > 0 do
  begin
    iPos := UTF8CocoaPos('[^', dbText.Text, iPos) + 1;
    if ((iPos < 2) or (Chr(StrToNSString(dbText.Text, True).characterAtIndex(
      iPos - 3)) = LineEnding)) then
    begin
      Inc(iPos);
      Continue;
    end;
    stOld := NSStringToString(StrToNSString(dbText.Text,
      True).substringWithRange(NSMakeRange(iPos, UTF8CocoaPos(']',
      dbText.Text, iPos) - iPos - 1)));
    if TryStrToInt(stOld, iOld) = True then
    begin
      dbText.Text := StringReplace(dbText.Text, '[^' + IntToStr(iOld) +
        ']', '[^' + IntToStr(iNew) + ']', []);
      dbText.Text := StringReplace(dbText.Text, LineEnding + '[^' +
        IntToStr(iOld) + ']:', LineEnding + '[^' + IntToStr(iNew) + ']:', []);
      Inc(iNew);
    end;
  end;
  try
    iStart := -1;
    iNum := 0;
    slNotesList := TStringList.Create;
    for iLine := 0 to dbText.Lines.Count - 1 do
    begin
      if ((UTF8Copy(dbText.Lines[iLine], 1, 2) = '[^') and
        (TryStrToInt(UTF8Copy(dbText.Lines[iLine], 3,
        UTF8Pos(':', dbText.Lines[iLine]) - 4), iNum) = True)) then
      begin
        if iStart = -1 then
        begin
          iStart := iLine;
        end;
      end;
      if ((dbText.Lines[iLine] <> '') and (iStart > -1)) then
      begin
        if UTF8Copy(dbText.Lines[iLine], 1, 2) = '[^' then
        begin
          slNotesList.Add(FormatFloat('00000', iNum) + dbText.Lines[iLine]);
        end
        else
        begin
          slNotesList.Add(FormatFloat('00000', iNum) + '…' + dbText.Lines[iLine]);
        end;
      end;
    end;
    if slNotesList.Count > 0 then
    begin
      while dbText.Lines.Count - 1 >= iStart do
      begin
        dbText.Lines.Delete(dbText.Lines.Count - 1);
      end;
      slNotesList.Sort;
      dbText.SelStart := StrToNSString(dbText.Text, True).length;
      for i := 0 to slNotesList.Count - 1 do
      begin
        if UTF8Copy(slNotesList[i], 6, 1) = '…' then
        begin
          InsText(UTF8Copy(slNotesList[i], 7, StrToNSString(
            slNotesList[i], True).length - 6) + LineEnding);
        end
        else
        begin
          InsText(UTF8Copy(slNotesList[i], 6, StrToNSString(
            slNotesList[i], True).length - 5) + LineEnding);
        end;
        if i < slNotesList.Count - 1 then
        begin
          InsText(LineEnding);
        end;
      end;
    end;
  finally
    slNotesList.Free
  end;
end;

procedure TfmMain.SelectInsertFootnote;
var
  i, iPos, iOld, iNew, iStart, iEnd: integer;
  stLine, stOld: string;
begin
  if ((zqNotes.RecordCount = 0) or (dbText.Text = '') or
    (dbText.SelStart < 1)) then
  begin
    Exit;
  end;
  if dbText.SelStart = StrToNSString(dbText.Text, True).length then
  begin
    dbText.Lines.Add('');
    dbText.SelStart := dbText.SelStart - 2;
  end;
  if UTF8Copy(dbText.Lines[dbText.CaretPos.y], 1, 2) = '[^' then
  begin
    iPos := UTF8CocoaPos(']', dbText.Lines[dbText.CaretPos.y]);
    dbText.SelStart := UTF8CocoaPos(UTF8Copy(dbText.Lines[dbText.CaretPos.y], 1, iPos),
      dbText.Text) + iPos - 1;
    if UTF8Copy(dbText.Text, dbText.SelStart + 1, 1) = ' ' then
    begin
      dbText.SelStart := dbText.SelStart + 1;
    end;
  end
  else
  begin
    iStart := dbText.SelStart;
    iEnd := dbText.SelStart;
    if iStart < StrToNSString(dbText.Text, True).length - 2 then
    begin
      while iStart > 0 do
      begin
        if NSStringToString(StrToNSString(dbText.Text,
          True).substringWithRange(NSMakeRange(iStart, 2))) = '[^' then
        begin
          Break;
        end;
        Dec(iStart);
      end;
      while iEnd < StrToNSString(dbText.Text, True).length do
      begin
        if NSStringToString(StrToNSString(dbText.Text,
          True).substringWithRange(NSMakeRange(iEnd, 1))) = ']' then
        begin
          Break;
        end;
        Inc(iEnd);
      end;
    end;
    if ((iEnd > iStart + 2) and
      (TryStrToInt(NSStringToString(StrToNSString(dbText.Text,
      True).substringWithRange(NSMakeRange(iStart + 2, iEnd - iStart - 2))), iNew) =
      True)) then
    begin
      if UTF8CocoaPos('[^' + IntToStr(iNew) + ']:', dbText.Text, iEnd) > 0 then
      begin
        dbText.SelStart := UTF8CocoaPos('[^' + IntToStr(iNew) + ']:',
          dbText.Text, iEnd) + UTF8Length(IntToStr(iNew)) + 4;
      end;
    end
    else
      try
        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;
        iNew := 0;
        for i := 0 to dbText.Lines.Count - 1 do
        begin
          iPos := 1;
          stLine := dbText.Lines[i];
          if stLine = '' then
          begin
            Continue;
          end;
          while UTF8CocoaPos('[^', stLine, iPos) > 0 do
          begin
            iPos := UTF8CocoaPos('[^', stLine, iPos) + 1;
            stOld := NSStringToString(StrToNSString(stLine,
              True).substringWithRange(NSMakeRange(iPos,
              UTF8CocoaPos(']', stLine, iPos) - iPos - 1)));
            if TryStrToInt(stOld, iOld) = True then
            begin
              if iNew < iOld then
              begin
                iNew := iOld;
              end;
            end;
          end;
        end;
        InsText('[^' + IntToStr(iNew + 1) + ']');
        if dbText.Lines[dbText.Lines.Count - 1] <> '' then
        begin
          dbText.Lines.Add('');
        end;
        dbText.Lines.Add('[^' + IntToStr(iNew + 1) + ']: ' + #3);
        dbText.Lines.Add('');
        RenumberFootnotes;
        FormatListTitles(False, True);
        dbText.SelStart := UTF8CocoaPos(#3, dbText.Text) - 1;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          deleteForward(nil);
      finally
        Screen.Cursor := crDefault;
      end;
  end;
end;

procedure TfmMain.SetLists;
var
  i, iNum, iPos, iTest, iHeader: integer;
  stHeader: string;
  rng: NSRange;
begin
  if ((zqNotes.RecordCount = 0) or (dbText.Text = '') or
    // the limit is 2, but since "1. " can be removed, it is increased to 5.
    (UTF8Length(dbText.Text) < 5)) then
  begin
    Exit;
  end;
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    moveToBeginningOfParagraph(nil);
  // characterAtIndex is 0 based
  i := dbText.SelStart - 1;
  if i < StrToNSString(dbText.Text, True).length - 2 then
  begin
    if Chr(StrToNSString(dbText.Text, True).characterAtIndex(i + 1)) =
      LineEnding then
    begin
      Dec(i);
    end;
  end;
  while ((i >= 0) and (i < StrToNSString(dbText.Text, True).length - 3)) do
  begin
    if ((Chr(StrToNSString(dbText.Text, True).characterAtIndex(i)) = LineEnding) and
      (Chr(StrToNSString(dbText.Text, True).characterAtIndex(i + 1)) = LineEnding)) then
    begin
      Break;
    end;
    Dec(i);
  end;
  Inc(i);
  if i > StrToNSString(dbText.Text, True).length - 3 then
  begin
    Exit;
  end;
  if i > 0 then
  begin
    iHeader := StrToNSString(dbText.Text, True).characterAtIndex(i + 1);
  end
  else
  begin
    iHeader := StrToNSString(dbText.Text, True).characterAtIndex(i);
  end;
  iPos := i + 1;
  if iHeader = 42 then // *
  begin
    stHeader := '•';
  end
  else
  if iHeader = 8226 then // •
  begin
    stHeader := '+';
  end
  else
  if iHeader = 43 then // +
  begin
    stHeader := '-';
  end
  else
  if iHeader = 45 then // -
  begin
    stHeader := '1';
  end
  else
  if iHeader = 49 then // 1
  begin
    stHeader := '';
  end
  else
  begin
    stHeader := '*';
  end;
  iNum := 1;
  while i < StrToNSString(dbText.Text, True).length - 4 do
  begin
    if ((Chr(StrToNSString(dbText.Text, True).characterAtIndex(i)) = LineEnding) and
      (Chr(StrToNSString(dbText.Text, True).characterAtIndex(i + 1)) = LineEnding)) then
    begin
      Break;
    end
    else
    if ((Chr(StrToNSString(dbText.Text, True).characterAtIndex(i)) = LineEnding) or
      (i = 0)) then
    begin
      if ((TryStrToInt(NSStringToString(StrToNSString(dbText.Text,
        True).substringWithRange(NSMakeRange(i, 1))), iTest) = True) and
        (StrToNSString(dbText.Text, True).substringWithRange(
        NSMakeRange(i + 1, 2)) = NSStringUtf8('. ')) and (i = 0)) then
      begin
        rng.location := i;
        rng.length := 3;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          insertText_replacementRange(NSStringUtf8(stHeader), rng);
        iNum := 1;
      end
      else
      if ((TryStrToInt(NSStringToString(StrToNSString(dbText.Text,
        True).substringWithRange(NSMakeRange(i, 2))), iTest) = True) and
        (StrToNSString(dbText.Text, True).substringWithRange(
        NSMakeRange(i + 2, 2)) = NSStringUtf8('. ')) and (i = 0)) then
      begin
        rng.location := i;
        rng.length := 4;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          insertText_replacementRange(NSStringUtf8(stHeader), rng);
      end
      else
      if ((TryStrToInt(NSStringToString(StrToNSString(dbText.Text,
        True).substringWithRange(NSMakeRange(i + 1, 1))), iTest) = True) and
        (StrToNSString(dbText.Text, True).substringWithRange(
        NSMakeRange(i + 2, 2)) = NSStringUtf8('. '))) then
      begin
        rng.location := i + 1;
        rng.length := 3;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          insertText_replacementRange(NSStringUtf8(stHeader), rng);
        iNum := 1;
      end
      else
      if ((TryStrToInt(NSStringToString(StrToNSString(dbText.Text,
        True).substringWithRange(NSMakeRange(i + 1, 2))), iTest) = True) and
        (StrToNSString(dbText.Text, True).substringWithRange(
        NSMakeRange(i + 3, 2)) = NSStringUtf8('. '))) then
      begin
        rng.location := i + 1;
        rng.length := 4;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          insertText_replacementRange(NSStringUtf8(stHeader), rng);
      end
      else
      if ((((Chr(StrToNSString(dbText.Text, True).characterAtIndex(i))) = '*') or
        ((StrToNSString(dbText.Text, True).characterAtIndex(i)) = 8226) or // •
        ((Chr(StrToNSString(dbText.Text, True).characterAtIndex(i))) = '-') or
        ((Chr(StrToNSString(dbText.Text, True).characterAtIndex(i))) = '+')) and
        (Chr(StrToNSString(dbText.Text, True).characterAtIndex(i + 1)) = ' ') and
        (i = 0)) then
      begin
        rng.location := i;
        if stHeader = '' then
        begin
          rng.length := 2;
        end
        else
        begin
          rng.length := 1;
        end;
        if stHeader = '1' then
        begin
          TCocoaTextView(NSScrollView(dbText.Handle).documentView).
            insertText_replacementRange(NSStringUtf8(IntToStr(iNum) + '.'), rng);
          Inc(iNum);
        end
        else
        begin
          TCocoaTextView(NSScrollView(dbText.Handle).documentView).
            insertText_replacementRange(NSStringUtf8(stHeader), rng);
          iNum := 1;
        end;
      end
      else
      if ((((Chr(StrToNSString(dbText.Text, True).characterAtIndex(i + 1))) = '*') or
        ((StrToNSString(dbText.Text, True).characterAtIndex(i + 1)) = 8226) or // •
        ((Chr(StrToNSString(dbText.Text, True).characterAtIndex(i + 1))) = '-') or
        ((Chr(StrToNSString(dbText.Text, True).characterAtIndex(i + 1))) = '+')) and
        (Chr(StrToNSString(dbText.Text, True).characterAtIndex(i + 2)) = ' ')) then
      begin
        rng.location := i + 1;
        if stHeader = '' then
        begin
          rng.length := 2;
        end
        else
        begin
          rng.length := 1;
        end;
        if stHeader = '1' then
        begin
          TCocoaTextView(NSScrollView(dbText.Handle).documentView).
            insertText_replacementRange(NSStringUtf8(IntToStr(iNum) + '.'), rng);
          Inc(iNum);
        end
        else
        begin
          TCocoaTextView(NSScrollView(dbText.Handle).documentView).
            insertText_replacementRange(NSStringUtf8(stHeader), rng);
          iNum := 1;
        end;
      end
      else
      begin
        if i > 0 then
        begin
          rng.location := i + 1;
        end;
        rng.length := 0;
        TCocoaTextView(NSScrollView(dbText.Handle).documentView).
          insertText_replacementRange(NSStringUtf8(stHeader + ' '), rng);
        iNum := 1;
      end;
    end;
    Inc(i);
  end;
  dbText.SelStart := iPos;
end;

procedure TfmMain.UpdateInfo;
begin
  if zqNotes.RecordCount > 0 then
  begin
    if dateformat = 'en' then
    begin
      lbInfo.Caption := sb001 + ' ' + FormatDateTime('dddd mmmm d yyyy',
        zqNotesMODIFICATION_DATE.Value) + ' ' + sb002 + ' ' +
        FormatDateTime('hh.nn am/pm', zqNotesMODIFICATION_DATE.Value) +
        '   •••  ' + sb005 + ': ' + FormatFloat('#,##0',
        StrToNSString(dbText.Text, True).length) + '.';
    end
    else
    begin
      lbInfo.Caption := sb001 + ' ' + FormatDateTime('dddd d mmmm yyyy',
        zqNotesMODIFICATION_DATE.Value) + ' ' + sb002 + ' ' +
        FormatDateTime('hh.nn', zqNotesMODIFICATION_DATE.Value) +
        '   •••   ' + sb005 + ': ' + FormatFloat('#,##0',
        StrToNSString(dbText.Text, True).length) + '.';
    end;
  end
  else
  begin
    lbInfo.Caption := msg040;
  end;
end;

procedure TfmMain.InsText(stText: string);
begin
  TCocoaTextView(NSScrollView(dbText.Handle).documentView).
    insertText(NSStringUtf8(stText));
end;

function TfmMain.CleanXML(stXMLText: string): string;
var
  blTag: boolean;
  i: integer;
begin
  blTag := False;
  Result := '';
  for i := 1 to Length(stXMLText) do
  begin
    if Copy(stXMLText, i, 1) = '<' then
    begin
      blTag := True;
    end
    else if Copy(stXMLText, i, 1) = '>' then
    begin
      blTag := False;
    end
    else if blTag = False then
    begin
      Result := Result + Copy(stXMLText, i, 1);
    end;
    Application.ProcessMessages;
  end;
  while Copy(Result, 1, 1) = LineEnding do
  begin
    Result := Copy(Result, 2, Length(Result));
  end;
end;

function TfmMain.GetNotexTempDir: string;
begin
  Result := GetTempDir + 'pgnotex' + DirectorySeparator;
end;

function TfmMain.UTF8CocoaPos(const SearchForText, SearchInText: string;
  StartPos: SizeInt = 1): PtrInt;
var
  iPos: integer = 0;
  stText: string;
begin
  // since rangeOfString_options_range }doesn't work...
  stText := NSStringToString(StrToNSString(SearchInText,
    True).substringFromIndex(StartPos - 1));
  iPos := StrToNSString(stText, True).rangeOfString(
    StrToNSString(SearchForText)).location;
  if ((iPos < 0) or (iPos > stText.length - 1)) then
  begin
    Result := 0;
  end
  else
  begin
    Result := iPos + StartPos;
  end;
end;

function TfmMain.GetPara(txt: NSTextStorage; textOffset: integer;
  isReadOnly, useDefault: boolean): NSParagraphStyle;
var
  dict: NSDictionary;
  op: NSParagraphStyle;
begin
  Result := nil;
  if not Assigned(txt) then
    Exit;
  dict := GetDict(txt, textOffset);
  op := nil;
  if Assigned(dict) then
    op := NSParagraphStyle(dict.objectForKey(NSParagraphStyleAttributeName));
  if not Assigned(op) then
  begin
    if not useDefault then
      Exit;
    op := NSParagraphStyle.defaultParagraphStyle;
  end;
  if isReadOnly then
    Result := op
  else
    Result := op.mutableCopyWithZone(nil);
end;

function TfmMain.GetWritePara(txt: NSTextStorage;
  textOffset: integer): NSMutableParagraphStyle;
begin
  Result := NSMutableParagraphStyle(GetPara(txt, textOffset, False, True));
end;

function TfmMain.GetDict(txt: NSTextStorage; textOffset: integer): NSDictionary;
begin
  if textOffset >= txt.string_.length then
  begin
    textOffset := txt.string_.length - 1;
  end;
  Result := txt.attributesAtIndex_effectiveRange(textOffset, nil);
end;

function TfmMain.FindFont(FamilyName: string; iStyle: smallint): NSFontDescriptor;
var
  fd: NSFontDescriptor;
  fdd: NSFontDescriptor;
  trt: NSFontSymbolicTraits;
  ns: NSString;
begin
  trt := 0;
  ns := NSStringUtf8(FamilyName);
  if iStyle = 1 then
  begin
    trt := trt or NSFontItalicTrait;
  end
  else
  if iStyle = 2 then
  begin
    trt := trt or NSFontBoldTrait;
  end
  else
  if iStyle = 3 then
  begin
    trt := trt or NSFontBoldTrait or NSFontItalicTrait;
  end;
  fd := NSFontDescriptor(NSFontDescriptor.alloc).initWithFontAttributes(nil);
  try
    fd := fd.fontDescriptorWithFamily(ns);
    fd := fd.fontDescriptorWithSymbolicTraits(trt);
    fdd := fd.matchingFontDescriptorWithMandatoryKeys(nil);
    Result := fdd;
  finally
    ns.Release;
  end;
end;

function TfmMain.CanMove(stLine: string; stHeader: string): boolean;
begin
  Result := False;
  if ((stLine = '# ') or
    (stLine = '## ') or
    (stLine = '### ') or
    (stLine = '#### ') or
    (stLine = '##### ') or
    (stLine = '###### ')) then
  begin
    if UTF8Length(stLine) <= UTF8Length(stHeader) then
    begin
      Result := True;
    end;
  end;
end;

end.
