part of 'diary_bloc.dart';

@immutable
abstract class DiaryEvent {}

class AddDiaryCard extends DiaryEvent {
  final String title;
  final String desc;

  AddDiaryCard(this.title, this.desc);
}
