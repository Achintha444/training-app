import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';
import 'package:training_app/db/repo/diary_repo.dart';

import 'diary_event.dart';
import 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  static final log = Log("DiaryBloc");
  final DiaryRepo _diaryRepo = new DiaryRepo();

  DiaryBloc(BuildContext context) : super(DiaryState.initialState) {
    print('check1-1');
    this
        ._diaryRepo
        .query(specification: ComplexSpecification([]))
        .listen((event) => add(LoadDiaryEntry(event)));
  }

  @override
  Stream<DiaryState> mapEventToState(DiaryEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        log.e('Error: $error');
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;

      case LoadDiaryEntry:
        print('check1-2');
        try {
          //yield state.clone(loading: true);
          print('aaaa');
          final _diaryEntryList = (event as LoadDiaryEntry).diaryEntryList;
          print(_diaryEntryList[0].desc);
          yield state.clone(diaryEntryList: _diaryEntryList);
        } catch (e) {
          yield state.clone(error: 'Connection Error Occured!');
        }
        break;

      case AddDiaryEvent:
        try {
          yield state.clone(loading: true);
          await this._diaryRepo.add(
                item: this._diaryRepo.toDiaryEvent(
                      (event as AddDiaryEvent).title,
                      (event as AddDiaryEvent).subTitle,
                      (event as AddDiaryEvent).desc,
                    ),
              );
          this
              ._diaryRepo
              .query(
                specification: ComplexSpecification([]),
              )
              .listen(
                (event) => LoadDiaryEntry(event),
              );
        } catch (e) {
          yield state.clone(error: 'Connection Error Occured!');
        }
        break;
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    log.e('$stacktrace');
    log.e('$error');
    _addErr(error);
    super.onError(error, stacktrace);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _addErr(e) {
    if (e is StateError) {
      return;
    }
    try {
      add(ErrorEvent(
        (e is String)
            ? e
            : (e.message ?? "Something went wrong. Please try again !"),
      ));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again !"));
    }
  }
}
