      // --------------- //
      //    Main Menu    //
      // --------------- //

      // Header
      mnuFile.Caption     := ReadString('Main menu header', '01', 'File');
      mnuEdit.Caption     := ReadString('Main menu header', '02', 'Edit');
      mnuSearch.Caption   := ReadString('Main menu header', '03', 'Search');
      mnuTools.Caption    := ReadString('Main menu header', '04', 'Tools');
      mnuMovie.Caption    := ReadString('Main menu header', '05', 'Movie');
      mnuSettings.Caption := ReadString('Main menu header', '06', 'Settings');
      mnuHelp.Caption     := ReadString('Main menu header', '07', 'Help');

      // --------- //
      // File menu //
      // --------- //
      mnuNewSubtitle.Caption  := ReadString('Main menu/File', '01', 'New subtitle...');
      mnuLoadSubtitle.Caption := ReadString('Main menu/File', '02', 'Load subtitle...');
      mnuRecent.Caption       := ReadString('Main menu/File', '03', 'Recent files');
      mnuClearList.Caption    := ReadString('Main menu/File', '04', 'Clear list');
      // Translator mode
      mnuLoad.Caption             := ReadString('Main menu/File', '05', 'Load');
      mnuLoadProject.Caption      := ReadString('Main menu/File', '06', 'Project...');
      mnuLoadOriginal.Caption     := ReadString('Main menu/File', '07', 'Original');
      mnuLoadTranslated.Caption   := ReadString('Main menu/File', '08', 'Translated');
      mnuTranslatorSave.Caption   := ReadString('Main menu/File', '09', 'Save');
      mnuSaveProject.Caption      := mnuLoadProject.Caption;
      mnuSaveOriginal.Caption     := mnuLoadOriginal.Caption;
      mnuSaveTranslated.Caption   := mnuLoadTranslated.Caption;
      mnuSaveOriginalAs.Caption   := ReadString('Main menu/File', '10', 'Original as...');
      mnuSaveTranslatedAs.Caption := ReadString('Main menu/File', '11', 'Translated as...');
      // ------
      mnuSaveFile.Caption   := mnuTranslatorSave.Caption;
      mnuSaveFileAs.Caption := ReadString('Main menu/File', '12', 'Save as...');
      mnuClose.Caption      := ReadString('Main menu/File', '13', 'Close');
      mnuExit.Caption       := ReadString('Main menu/File', '14', 'Exit');

      // --------- //
      // Edit menu //
      // --------- //
      mnuUndo.Caption           := ReadString('Main menu/Edit', '01', 'Undo');
      mnuRedo.Caption           := ReadString('Main menu/Edit', '02', 'Redo');
      mnuInsertSubtitle.Caption := ReadString('Main menu/Edit', '03', 'Insert subtitle');
      mnuInsertBefore.Caption   := ReadString('Main menu/Edit', '04', 'Insert before');
      mnuRemoveSelected.Caption := ReadString('Main menu/Edit', '05', 'Remove selected');
      mnuCut.Caption            := ReadString('Main menu/Edit', '06', 'Cut');
      mnuCopy.Caption           := ReadString('Main menu/Edit', '07', 'Copy');
      mnuPaste.Caption          := ReadString('Main menu/Edit', '08', 'Paste');
      mnuSelectAll.Caption      := ReadString('Main menu/Edit', '09', 'Select all');

      // ------------ //
      // Edit/Timings //
      // ------------ //
      mnuTimings.Caption             := ReadString('Main menu/Edit/Timings', '01', 'Timings');
      mnuSetDurationLimits.Caption   := ReadString('Main menu/Edit/Timings', '02', 'Set duration limits...');
      mnuSetDelay.Caption            := ReadString('Main menu/Edit/Timings', '03', 'Set delay...');
      mnuAdjust.Caption              := ReadString('Main menu/Edit/Timings', '04', 'Adjust');
      mnuAdjustSubtitles.Caption     := ReadString('Main menu/Edit/Timings', '05', 'Adjust subtitles...');
      mnuAdjustToSyncSubs.Caption    := ReadString('Main menu/Edit/Timings', '06', 'Adjust to synchronized subtitles');
      mnuTimeExpanderReducer.Caption := ReadString('Main menu/Edit/Timings', '07', 'Time expander/reducer');
      mnuExtendLength.Caption        := ReadString('Main menu/Edit/Timings', '08', 'Extend length');
      mnuAutomaticDurations.Caption  := ReadString('Main menu/Edit/Timings', '09', 'Automatic durations');
      mnuReadTimesFromFile.Caption   := ReadString('Main menu/Edit/Timings', '10', 'Read timings from file');
      ShiftMS                        := ReadString('Main menu/Edit/Timings', '11', 'Shift %s milliseconds');
      ShiftMSShow                    := ReadString('Main menu/Edit/Timings', '12', 'Show %s milliseconds');
      ShiftMSHide                    := ReadString('Main menu/Edit/Timings', '13', 'Hide %s milliseconds');

      // ---------- //
      // Edit/Texts //
      // ---------- //
      mnuTexts.Caption             := ReadString('Main menu/Edit/Texts', '01', 'Texts');
      mnuSmartLineAdjust.Caption   := ReadString('Main menu/Edit/Texts', '02', 'Smart line adjust');
      mnuConvertCase.Caption       := ReadString('Main menu/Edit/Texts', '03', 'Convert case...');
      mnuUnbreakSubtitles.Caption  := ReadString('Main menu/Edit/Texts', '04', 'Unbreak subtitles');
      mnuDivideLines.Caption       := ReadString('Main menu/Edit/Texts', '05', 'Divide lines...');
      mnuFastDivideLines.Caption   := ReadString('Main menu/Edit/Texts', '06', 'Fast divide lines');
      mnuSetMaxLineLength.Caption  := ReadString('Main menu/Edit/Texts', '07', 'Set maximum line length');
      mnuReadTextsFromFile.Caption := ReadString('Main menu/Edit/Texts', '08', 'Read texts from file');

      mnuSetTagBold.Caption      := ReadString('Main menu/Edit/Texts', '09', 'Set bold tag');
      mnuSetTagItalic.Caption    := ReadString('Main menu/Edit/Texts', '10', 'Set italic tag');
      mnuSetTagUnderline.Caption := ReadString('Main menu/Edit/Texts', '11', 'Set underline tag');
      mnuSetTagColor.Caption     := ReadString('Main menu/Edit/Texts', '12', 'Set color tag');

      // -------------- //
      // Edit/Subtitles //
      // -------------- //
      mnuSubtitles.Caption              := ReadString('Main menu/Edit/Subtitles', '01', 'Subtitles');
      mnuCombineSubtitles.Caption       := ReadString('Main menu/Edit/Subtitles', '02', 'Combine subtitles');
      // ---
      mnuEffects.Caption     := ReadString('Main menu/Edit/Subtitles', '03', 'Effects');
      mnuTypeEffect.Caption  := ReadString('Main menu/Edit/Subtitles', '04', 'Type effect');
      mnuFlash.Caption       := ReadString('Main menu/Edit/Subtitles', '05', 'Flash');
      mnuFastFlash.Caption   := ReadString('Main menu/Edit/Subtitles', '06', 'Fast flash');
      mnuMediumFlash.Caption := ReadString('Main menu/Edit/Subtitles', '07', 'Medium flash');
      mnuSlowFlash.Caption   := ReadString('Main menu/Edit/Subtitles', '08', 'Slow flash');
      // ---
      mnuRightToLeft.Caption            := ReadString('Main menu/Edit/Subtitles', '09', 'Right-to-Left');
      mnuReverseText.Caption            := ReadString('Main menu/Edit/Subtitles', '10', 'Reverse text');
      mnuFixPunctuation.Caption         := ReadString('Main menu/Edit/Subtitles', '11', 'Fix punctuation');
      mnuSort.Caption                   := ReadString('Main menu/Edit/Subtitles', '12', 'Sort');
      mnuDeleteUnnecessaryLinks.Caption := ReadString('Main menu/Edit/Subtitles', '13', 'Delete unnecessary links');
      mnuMarkSelectedSubs.Caption       := ReadString('Main menu/Edit/Subtitles', '14', 'Mark selected subtitles');
      mnuUnmarkSelectedSubs.Caption     := ReadString('Main menu/Edit/Subtitles', '15', 'Unmark selected subtitles');

      // ---------------- //
      // Edit/Translation //
      // ---------------- //
      mnuTranslation.Caption    := ReadString('Main menu/Edit/Translation', '01', 'Translation');
      mnuTranslatorMode.Caption := ReadString('Main menu/Edit/Translation', '02', 'Translator mode');
      mnuSwap.Caption           := ReadString('Main menu/Edit/Translation', '03', 'Swap');

      // ----------- //
      // Search menu //
      // ----------- //
      mnuSubSearch.Caption        := ReadString('Main menu/Search', '01', 'Search...');
      mnuFindNext.Caption         := ReadString('Main menu/Search', '02', 'Find next');
      mnuSearchAndReplace.Caption := ReadString('Main menu/Search', '03', 'Search && Replace...');
      mnuGoToLineNumber.Caption   := ReadString('Main menu/Search', '04', 'Go to line number...');

      // ---------- //
      // Tools menu //
      // ---------- //
      mnuSpellCheck.Caption           := ReadString('Main menu/Tools', '01', 'Spell check');
      mnuBatchConvert.Caption         := ReadString('Main menu/Tools', '02', 'Batch convert...');
      mnuSplitSubtitle.Caption        := ReadString('Main menu/Tools', '03', 'Split subtitle...');
      mnuJoinSubtitle.Caption         := ReadString('Main menu/Tools', '04', 'Join subtitles...');
      mnuInfoErrors.Caption           := ReadString('Main menu/Tools', '05', 'Information and errors');
      mnuInformationAndErrors.Caption := ReadString('Main menu/Tools', '06', 'Information and errors...');
      mnuVariousInformation.Caption   := ReadString('Main menu/Tools', '07', 'Various information...');
      mnuOCRScripts.Caption           := ReadString('Main menu/Tools', '08', 'OCR Scripts');
      mnuShowInMainForm.Caption       := ReadString('Main menu/Tools', '09', 'Show in main form');
      mnuInfoErrorsSettings.Caption   := ReadString('Main menu/Tools', '10', 'Settings...');
      mnuRecheckErrors.Caption        := ReadString('Main menu/Tools', '11', 'Recheck errors');
      mnuFixAllErrors.Caption         := ReadString('Main menu/Tools', '12', 'Fix all errors');
      mnuFixErrorsInSelSubs.Caption   := ReadString('Main menu/Tools', '13', 'Fix errors (selected subtitles)');
      mnuJumpToNextError.Caption      := ReadString('Main menu/Tools', '14', 'Jump to next error');
      mnuAddFPSfromAVI.Caption        := ReadString('Main menu/Tools', '15', 'Add FPS from AVI');
      mnuExternalPreview.Caption      := ReadString('Main menu/Tools', '16', 'External preview');
      mnuSAMILangExtractor.Caption    := ReadString('Main menu/Tools', '17', 'SAMI language extractor');
      mnuPascalScripts.Caption        := ReadString('Main menu/Tools', '18', 'Pascal scripts');

      // ---------- //
      // Movie menu //
      // ---------- //
      mnuOpenMovie.Caption            := ReadString('Main menu/Movie', '01', 'Open...');
      mnuCloseMovie.Caption           := ReadString('Main menu/Movie', '02', 'Close');
      mnuMovieInfo.Caption            := ReadString('Main menu/Movie', '03', 'Information...');
      mnuVideoPreviewMode.Caption     := ReadString('Main menu/Movie', '04', 'Video preview mode');
      mnuShowSubtitles.Caption        := ReadString('Main menu/Movie', '05', 'Show subtitles');
      mnuSaveMediaStartupFile.Caption := ReadString('Main menu/Movie', '06', 'Save media startup file');

      // -------------- //
      // Movie/Playback //
      // -------------- //
      mnuPlayback.Caption     := ReadString('Main menu/Movie/Playback', '01', 'Playback');
      mnuPlayPause.Caption    := ReadString('Main menu/Movie/Playback', '02', 'Play/Pause');
      mnuStop.Caption         := ReadString('Main menu/Movie/Playback', '03', 'Stop');
      mnuRewind.Caption       := ReadString('Main menu/Movie/Playback', '04', 'Rewind');
      mnuForward.Caption      := ReadString('Main menu/Movie/Playback', '05', 'Forward');
      mnuBack5Sec.Caption     := ReadString('Main menu/Movie/Playback', '06', 'Back 5 seconds');
      mnuFwd5Sec.Caption      := ReadString('Main menu/Movie/Playback', '07', 'Forward 5 seconds');
      mnuPlaybackRate.Caption := ReadString('Main menu/Movie/Playback', '08', 'Playback rate');

      // --------------- //
      // Movie/Subtitles //
      // --------------- //
      mnuVidSubtitles.Caption  := ReadString('Main menu/Movie/Subtitles', '01', 'Subtitles');
      mnuMoveSubtitle.Caption  := ReadString('Main menu/Movie/Subtitles', '02', 'Move subtitle');
      mnuSetStartTime.Caption  := ReadString('Main menu/Movie/Subtitles', '03', 'Set start time');
      mnuSetFinalTime.Caption  := ReadString('Main menu/Movie/Subtitles', '04', 'Set final time');
      mnuStartSubtitle.Caption := ReadString('Main menu/Movie/Subtitles', '05', 'Start subtitle');
      mnuEndSubtitle.Caption   := ReadString('Main menu/Movie/Subtitles', '06', 'End subtitle');

      // --------------------- //
      // Movie/Synchronization //
      // --------------------- //
      mnuSynchronization.Caption := ReadString('Main menu/Movie/Synchronization', '01', 'Synchronization');
      mnuFirstSyncPoint.Caption  := ReadString('Main menu/Movie/Synchronization', '02', 'First sync point');
      mnuLastSyncPoint.Caption   := ReadString('Main menu/Movie/Synchronization', '03', 'Last sync point');
      mnuAddSyncPoint.Caption    := ReadString('Main menu/Movie/Synchronization', '04', 'Add synchronization point');

      // ------------- //
      // Movie/Display //
      // ------------- //
      mnuSubtitleToDisplay.Caption  := ReadString('Main menu/Movie/Display', '01', 'Display');
      mnuDisplayOriginal.Caption    := ReadString('Main menu/Movie/Display', '02', 'Original');
      mnuDisplayTranslation.Caption := ReadString('Main menu/Movie/Display', '03', 'Translation');

      // ------------- //
      // Settings menu //
      // ------------- //
      mnuSubSettings.Caption       := mnuInfoErrorsSettings.Caption;
      mnuOutputSettings.Caption    := ReadString('Main menu/Settings', '01', 'Output settings...');
      mnuLanguage.Caption          := ReadString('Main menu/Settings', '02', 'Language');
      mnuShowLeftPanel.Caption     := ReadString('Main menu/Settings', '03', 'Show left panel');
      mnuShowTimeControls.Caption  := ReadString('Main menu/Settings', '04', 'Show time controls');
      mnuUseInPlaceEdition.Caption := ReadString('Main menu/Settings', '05', 'Use in-place edition');

      // --------- //
      // Help menu //
      // --------- //
      mnuHelpOfProgram.Caption         := mnuHelp.Caption;
      mnuAboutSubtitleWorkshop.Caption := Format(ReadString('Main menu/Help', '01', 'About %s...'), [ID_PROGRAM]);
      mnuCheckForNewVersion.Caption    := ReadString('Main menu/Help', '02', 'Check for new version');

      // ---------- //
      // Popup menu //
      // ---------- //
      mnuItalic.Caption          := ReadString('Popup Menu', '01', 'Italic');
      mnuBold.Caption            := ReadString('Popup Menu', '02', 'Bold');
      mnuUnderline.Caption       := ReadString('Popup Menu', '03', 'Underline');
      mnuSetColor.Caption        := ReadString('Popup Menu', '04', 'Set color');
      mnuRemoveColorTags.Caption := ReadString('Popup Menu', '05', 'Remove color tags');

      // ------------------------ //
      //    Video Preview Hints   //
      // ------------------------ //
      btnPlay.Hint               := Format(ReadString('Video preview hints', '01', 'Play/Pause (%s)'), [ShortCutToText(mnuPlayPause.ShortCut)]);
      btnPause.Hint              := btnPlay.Hint;
      btnStop.Hint               := Format(ReadString('Video preview hints', '02', 'Stop (%s)'), [ShortCutToText(mnuStop.ShortCut)]);
      btnScrollList.Hint         := ReadString('Video preview hints', '03', 'Toggle scroll list');
      btnPrevSub.Hint            := ReadString('Video preview hints', '04', 'Jump to previous subtitle');
      btnNextSub.Hint            := ReadString('Video preview hints', '05', 'Jump to next subtitle');
      btnRew.Hint                := Format(ReadString('Video preview hints', '06', 'Rewind (%s)'), [ShortCutToText(mnuRewind.ShortCut)]);
      btnForward.Hint            := Format(ReadString('Video preview hints', '07', 'Forward (%s)'), [ShortCutToText(mnuForward.ShortCut)]);
      btnAlterPlaybackRate.Hint  := ReadString('Video preview hints', '08', 'Alter playback rate');
      btnMoveSubtitle.Hint       := Format(ReadString('Video preview hints', '09', 'Move subtitle (%s)'), [ShortCutToText(mnuMoveSubtitle.ShortCut)]);
      btnSetStartTime.Hint       := Format(ReadString('Video preview hints', '10', 'Set start time (%s)'), [ShortCutToText(mnuSetStartTime.ShortCut)]);
      btnSetFinalTime.Hint       := Format(ReadString('Video preview hints', '11', 'Set final time (%s)'), [ShortCutToText(mnuSetFinalTime.ShortCut)]);
      btnStartSubtitle.Hint      := Format(ReadString('Video preview hints', '12', 'Start subtitle (%s)'), [ShortCutToText(mnuStartSubtitle.ShortCut)]);
      btnEndSubtitle.Hint        := Format(ReadString('Video preview hints', '13', 'End subtitle (%s)'), [ShortCutToText(mnuEndSubtitle.ShortCut)]);
      btnSyncPoint1.Hint         := Format(ReadString('Video preview hints', '14', 'Mark as first sync point (%s)'), [ShortCutToText(mnuFirstSyncPoint.ShortCut)]);
      btnSyncPoint2.Hint         := Format(ReadString('Video preview hints', '15', 'Mark as last sync point (%s)'), [ShortCutToText(mnuLastSyncPoint.ShortCut)]);
      btnAddSyncPoint.Hint       := Format(ReadString('Video preview hints', '16', 'Add subtitle/video synchronization point (%s)'), [ShortCutToText(mnuAddSyncPoint.ShortCut)]);

      // Help file
      HelpFile := ReadString('General', 'Help', 'Manual.html');

      SelectOutputDir := ReadString('Split','19','Output directory:');
