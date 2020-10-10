import 'package:flutter/material.dart';
import 'package:training_app/db/model/diary_entry.dart';

@immutable
abstract class DiaryEvent {}

class ErrorEvent extends DiaryEvent {
  final String error;

  ErrorEvent(this.error);
}

class LoadDiaryEntry extends DiaryEvent {
  final List<DiaryEntry> diaryEntryList;

  LoadDiaryEntry(this.diaryEntryList);
}

class AddDiaryEvent extends DiaryEvent {
  final String title;
  final String desc;
  final String subTitle = 'This is the subtitle';

  AddDiaryEvent(this.title, this.desc);
}
