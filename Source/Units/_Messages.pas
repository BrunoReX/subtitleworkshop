      // ------------------------ //
      //      Error messages      //
      // ------------------------ //
      ErrorMsg[01] := ReadString('Error messages', '01', 'Could not initialize subtitle API. Please download %s from %s and copy it to the "%s" directory.');
      ErrorMsg[02] := ReadString('Error messages', '02', 'The following error (%s) was derived from object %s (%s):||"%s"||Please write to %s informing what you were doing when this error occurred.||Press Ok to continue, and Cancel to exit the program.');
      ErrorMsg[03] := ReadString('Error messages', '03', 'The file "%s" is a bad subtitle or an unsupported format.');
      ErrorMsg[04] := ReadString('Error messages', '04', 'The file "%s" is not in %s format or is not a valid subtitle file.');
      ErrorMsg[05] := ReadString('Error messages', '05', '"%s" is not a valid video file.');
      ErrorMsg[06] := ReadString('Error messages', '06', 'Not a valid line number.');
      ErrorMsg[07] := ReadString('Error messages', '07', 'Select at least one extension to search for.');
      ErrorMsg[08] := ReadString('Error messages', '08', 'The search path does not exist.');
      ErrorMsg[09] := ReadString('Error messages', '09', 'Item number is not a valid item.');
      ErrorMsg[10] := ReadString('Error messages', '10', 'Please add two subtitles or more.');
      ErrorMsg[11] := ReadString('Error messages', '11', 'Failed to connect to server!.');
      ErrorMsg[12] := ReadString('Error messages', '12', 'Couldn''t remove the read-only attribute from "%s".||Possibly on a write protected drive.');
      ErrorMsg[13] := ReadString('Error messages', '13', 'Error trying to connect to Microsoft Word!.');
      ErrorMsg[14] := ReadString('Error messages', '14', 'Select the video(s) for previous part(s) first!.');
      ErrorMsg[15] := ReadString('Error messages', '15', 'Select a valid output directory.');
      ErrorMsg[16] := ReadString('Error messages', '16', 'Select at least one language to extract.');
      ErrorMsg[17] := ReadString('Error messages', '17', '"%s" is not a valid SAMI file.');
      ErrorMsg[18] := ReadString('Error messages', '18', 'Select a subtitle part in the list.');
      ErrorMsg[19] := ReadString('Error messages', '19', 'If you select a movie fragment for one part of the subtitle you need to select a movie fragment for all parts of the subtitle (except the last part of course).');
      ErrorMsg[20] := ReadString('Error messages', '20', 'You need two or more points.');

      // ------------------------ //
      //    Question messages     //
      // ------------------------ //
      QuestionMsg[01] := ReadString('Question messages', '01', 'File "%s" has changed.||Do you want to save the changes?.');
      QuestionMsg[02] := ReadString('Question messages', '02', 'File "%s" already exists.||Do you want to replace it?.');
      QuestionMsg[03] := ReadString('Question messages', '03', 'Original file ("%s") has changed.||Do you want to save the changes?.');
      QuestionMsg[04] := ReadString('Question messages', '04', 'Translated file ("%s") has changed.||Do you want to save the changes?.');
      QuestionMsg[05] := ReadString('Question messages', '05', 'The selected subtitles are about to be deleted.||Do you want to proceed?.');
      QuestionMsg[06] := ReadString('Question messages', '06', 'Point 1 Subtitle: %s|Point 1 Movie: %s||Point 2 Subtitle: %s|Point 2 Movie: %s||Synchronize subtitle?');
      QuestionMsg[07] := ReadString('Question messages', '07', 'The video player''s exe hasn''t been specified or doesn''t exist.||Do you want to configure external player?.');
      QuestionMsg[08] := ReadString('Question messages', '08', 'A new version %s was found!.||Do you want to see the change list?.');
      QuestionMsg[09] := ReadString('Question messages', '09', 'The file you are trying to save is read-only.||Try to save anyway?.');

      // ------------------------ //
      //   Information messages   //
      // ------------------------ //
      InfoMsg[01] := ReadString('Information messages', '01', 'Could''t find more instances of "%s".');
      InfoMsg[02] := ReadString('Information messages', '02', 'No new version available.');
      InfoMsg[03] := ReadString('Information messages', '03', 'Spell check finished.||%d change(s) made.');
      InfoMsg[04] := ReadString('Information messages', '04', 'Too many parts. Resetting...');
      InfoMsg[05] := ReadString('Information messages', '05', 'Only one language was found.||If the file contains more languages, add the ones you wish manually opening the file in a text editor and searching for the correct class name.');
      InfoMsg[06] := ReadString('Information messages', '06', 'Couldn''t locate "STYLE" start and/or close tag!.||Probably because of that reason, this file doesn''t contain more than one language.|If it does, try to add manually searching for the class name of the desired language(s).');
      InfoMsg[07] := ReadString('Information messages', '07', 'Fittest font size for playback is: %d');
      InfoMsg[08] := ReadString('Information messages', '08', 'Total replacements: %d');
      InfoMsg[09] := ReadString('Information messages', '09', 'File name: %s|Size: %s|FPS: %s|Duration: %s|Total frames: %d|Resolution: %dx%d|FourCC: %s');
      InfoMsg[10] := ReadString('Information messages', '10', 'Some of the streams of the movie could not be rendered correctly.|Probably the audio or video codec is missing.|Error code: %s');
      InfoMsg[11] := ReadString('Information messages', '11', 'It is not necessary to set the movie fragment corresponding to the last subtitle.');
      InfoMsg[12] := ReadString('Information messages', '12', 'Sudden error occured:|"%s"');

      // --------------------------------- //
      //  Information and errors messages  //
      // --------------------------------- //
      IEMsgBoxes[01] := ReadString('Information and errors messages', '01', 'Subtitle number %d is an empty subtitle and is about to be deleted.||Do you want to proceed?.');
      IEMsgBoxes[02] := ReadString('Information and errors messages', '02', 'Subtitle number %d:||"%s" has a prohibited character and is about to be deleted.||Do you want to proceed?.');
      IEMsgBoxes[03] := ReadString('Information and errors messages', '03', 'Subtitle number %d:||"%s" is about to be deleted.||Do you want to proceed?.');
      IEMsgBoxes[04] := ReadString('Information and errors messages', '04', 'Part of subtitle number %d:||"%s" is about to be deleted, so the subtitle will be:||"%s"||Do you want to proceed?.');
      IEMsgBoxes[05] := ReadString('Information and errors messages', '05', 'Subtitle number %d:||"%s" is a one-line subtitle and starts with "-".||Do you want to delete the "-" at the beginning?.');

      // --------------- //
      //  Error reports  //
      // --------------- //
      ErrorReports[01] := ReadString('Information and errors', '16', 'Contains lines without letters');
      ErrorReports[02] := ReadString('Information and errors', '17', 'Empty subtitle');
      // ---
      ErrorReports[03] := ReadString('Information and errors', '18', 'Overlapping with previous subtitle');
      ErrorReports[04] := ReadString('Information and errors', '19', 'Bad values');
      ErrorReports[05] := ReadString('Information and errors', '20', 'Too long duration');
      ErrorReports[06] := ReadString('Information and errors', '21', 'Too short duration');
      ErrorReports[07] := ReadString('Information and errors', '22', 'Too long line(s)');
      ErrorReports[08] := ReadString('Information and errors', '23', 'Over two lines');
      // ---
      ErrorReports[09] := ReadString('Information and errors', '24', 'Hearing impaired');
      ErrorReports[10] := ReadString('Information and errors', '25', 'Has text before colon (":")');
      ErrorReports[11] := ReadString('Information and errors', '26', 'Unnecessary dots');
      ErrorReports[12] := ReadString('Information and errors', '27', 'Contains a prohibited character');
      ErrorReports[13] := ReadString('Information and errors', '28', 'Repeated character');
      ErrorReports[14] := ReadString('Information and errors', '29', 'Repeated subtitle');
      ErrorReports[15] := ReadString('Information and errors', '30', 'OCR error');
      // ---
      ErrorReports[16] := ReadString('Information and errors', '31', 'One line subtitle starts with "-"');
      ErrorReports[17] := ReadString('Information and errors', '32', 'No space after custom character');
      ErrorReports[18] := ReadString('Information and errors', '33', 'No space before custom character');
      ErrorReports[19] := ReadString('Information and errors', '34', 'Unnecessary spaces');
      // ---
      ErrorReports[20] := ReadString('Information and errors', '35', 'Marked subtitle');
      ErrorReports[21] := ReadString('Information and errors', '57', 'Too small CPS');
      ErrorReports[22] := ReadString('Information and errors', '58', 'Too big CPS');

