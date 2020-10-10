import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/cupertino.dart';

import '../model/diary_entry.dart';

class DiaryRepo extends FirebaseRepository<DiaryEntry> {
  final diaryEnteryCollection =
      FirebaseFirestore.instance.collection('DiaryEntry');

  // Future<void> addNewDiaryEntry(DiaryEntryModel diaryEntryModel) {
  //   return diaryEnteryCollection.add(diaryEntryModel.toDocument());
  // }

  @override
  Stream<List<DiaryEntry>> query({
    @required SpecificationI specification,
    String type,
    DocumentReference parent,
  }) {
    return super.query(
      specification: specification,
      type: 'DiaryEntry',
      parent: null,
    );
  }

  @override
  DiaryEntry fromSnapshot(DocumentSnapshot snapshot) {
    if (snapshot == null) return null;
    Map<String, Object> _snapshotList = snapshot.data();
    if (_snapshotList == null) return null;
    print(_snapshotList[DiaryEntry.TITLE_FIELD]);
    return DiaryEntry(
      title: _snapshotList[DiaryEntry.TITLE_FIELD],
      subTitle: _snapshotList[DiaryEntry.SUBTITLE_FIELD],
      desc: _snapshotList[DiaryEntry.DESC_FIELD],
      ref: snapshot.reference,
    );
  }

  @override
  Map<String, dynamic> toMap(DiaryEntry diaryEntry) {
    return {
      DiaryEntry.TITLE_FIELD: diaryEntry.title,
      DiaryEntry.SUBTITLE_FIELD: diaryEntry.subTitle,
      DiaryEntry.DESC_FIELD: diaryEntry.desc
    };
  }

  DiaryEntry toDiaryEvent(String title, String subTitle, String desc) {
    return DiaryEntry(
      title: title,
      subTitle: subTitle,
      desc: desc,
    );
  }

  @override
  Future<DocumentReference> add(
      {@required DiaryEntry item, String type, DocumentReference parent}) {
    return super.add(
      item: item,
      type: 'DiaryEntry',
      parent: null,
    );
  }
}
