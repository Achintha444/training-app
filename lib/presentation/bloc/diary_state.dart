part of 'diary_bloc.dart';

@immutable
abstract class DiaryState {}

class DiaryInitial extends DiaryState {}

class DiaryLoading extends DiaryState{}

class DiaryCardAdded extends DiaryState{
  final List<List<String>> diaryCardDetailsList;

  DiaryCardAdded(this.diaryCardDetailsList);
}
