import 'package:flutter/material.dart';
import 'package:training_app/db/model/diary_entry.dart';

@immutable
class DiaryState {
  final String error;
  final List<DiaryEntry> diaryEntryList;
  final bool loading;

  DiaryState({
    @required this.error,
    @required this.diaryEntryList,
    @required this.loading,
  });

  static DiaryState get initialState => DiaryState(
    error: '',
    diaryEntryList: null,
    loading: false 
  );

  DiaryState clone({
    String error,
    List<DiaryEntry> diaryEntryList,
    bool loading
  }) {
    return DiaryState(
      error: error ?? this.error,
      diaryEntryList: diaryEntryList ?? this.diaryEntryList,
      loading: loading??this.loading
    );
  }
}
