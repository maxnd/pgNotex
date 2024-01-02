# pgNotex 

Copyright Massimo Nardello, Modena (Italy) 2020-2024.

pgNotex is a free software for macOS to manage a large amount of textual notes in Markdown, tasks and documents on a single computer or in a local network using the open source database PostgreSQL 16. pgNotex is a fork of fbNotex and sqlNotex by the same author.

The notes are divided into notebooks and, within them, in sections, and it is possible to associate to each note a list of activities to be done, a series of attachments (files of any kind), tags and links to other notes. The search function may find the wished notes starting from the title, the text content, the modification date, the tags, the name of the attachments or activities. Files of Microsoft Word (docx), LibreOffice Writer (odt) and in plain text (txt) can be imported as plain text in a new note, while in the first two cases the original file is attached to it. The text of the notes written in Markdown format may be easily converted to other formats using Pandoc, which is fired by a menu item of the software.

pgNotex has been written with Lazarus (www.lazarus-ide.org) and accesses the PostgreSQL database through the Zeos components ([sourceforge.net/projects/zeoslib](sourceforge.net/projects/zeoslib)).

pgNotex is free software, as it is released under the GPL version 3 license or following, available on www.gnu.org/licenses/gpl-3.0.html, which the user must accept in order to use it.

The official website of the software is https://github.com/maxnd/pgnotex.

The software runs in English and Italian. The manuals in PDF format are available within the software. The English manual is available also in https://github.com/maxnd/pgnotex/wiki.

In this website, along with the source code of the software, are also provided two Mac app packages compiled for Intel and Arm (M1/M2) platforms:

- https://github.com/maxnd/pgNotex/raw/main/app/pgNotex-Intel.app.zip

- https://github.com/maxnd/pgNotex/raw/main/app/pgNotex-Arm.app.zip

 The packages are signed by the author. To install them, download the zip file for Intel or Arm platform, unzip it, copy the app file in the Application folder, Ctrl + click on it and select Open.

Before contributing to the development of this software, see [the Contributing file](https://github.com/maxnd/fbnotex/blob/master/CONTRIBUTING.md).
