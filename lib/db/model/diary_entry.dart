import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/cupertino.dart';

class DiaryEntry extends DBModel {
  static const TITLE_FIELD = 'title';
  static const SUBTITLE_FIELD = 'subTitle';
  static const DESC_FIELD = 'desc';

  final String title;
  final String subTitle;
  final String desc;

  DiaryEntry({
    @required this.title,
    @required this.subTitle,
    @required this.desc,
    DocumentReference ref,
  }) : super(ref: ref);
}
