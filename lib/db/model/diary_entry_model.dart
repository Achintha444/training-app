// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'diary_entry.dart';

// class DiaryEntryModel extends DiaryEntry {
//   DiaryEntryModel(
//     String title,
//     String subTitle,
//     String desc,
//     String docId,
//   ) : super(
//           title,
//           subTitle,
//           desc,
//           docId,
//         );

//   static DiaryEntryModel fromJson(Map<String, Object> json) {
//     return DiaryEntryModel(
//       json['title'],
//       json['subTitle'],
//       json['desc'],
//       json['docId'],
//     );
//   }

//   static DiaryEntryModel fromSnapshot(DocumentSnapshot snapshot) {
//     if (snapshot==null) return null;
//     Map<String, Object> _snapshotList = snapshot.data();
//     if (_snapshotList==null) return null;
//     print (snapshot.data()['title']);
//     return DiaryEntryModel(
//       _snapshotList['title'],
//       _snapshotList['subTitle'],
//       _snapshotList['desc'],
//       snapshot.id,
//     );
//   }

//   Map<String, Object> toDocument() {
//     return {
//       "title": this.title,
//       "subTitle": this.subTitle,
//       "desc": this.desc,
//     };
//   }
// }
