import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'diary_event.dart';
part 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  final List<List<String>> _diaryCardDetailsList = [];

  DiaryBloc() : super(DiaryInitial());

  @override
  Stream<DiaryState> mapEventToState(
    DiaryEvent event,
  ) async* {
    if (event is AddDiaryCard) {
      yield DiaryLoading();
      await Future.delayed(Duration(seconds: 2));
      this._diaryCardDetailsList.add([event.title, event.desc]);
      yield DiaryCardAdded(this._diaryCardDetailsList);
    }
  }
}
