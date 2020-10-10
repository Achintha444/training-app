// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// import '../../db/model/diary_entry.dart';
// import '../../db/model/diary_entry_model.dart';
// import '../../db/repo/diary_repo.dart';

// part 'diary_event.dart';
// part 'diary_state.dart';

// class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
//   final DiaryRepo _diaryRepo = new DiaryRepo();
//   List<DiaryEntry> _diaryCardDetailsList = [];

//   DiaryBloc() : super(DiaryInitial());

//   @override
//   Stream<DiaryState> mapEventToState(
//     DiaryEvent event,
//   ) async* {
//     if (event is AddDiaryCard) {
//       yield DiaryLoading();
//       try {
//         var _diaryEntryModel = DiaryEntryModel(
//           event.title,
//           'This is the Subtitle',
//           event.desc,
//           (this._diaryCardDetailsList.length + 1).toString(),
//         );
//         await this._diaryRepo.addNewDiaryEntry(_diaryEntryModel).then((value) {
//           this._diaryCardDetailsList.add(_diaryEntryModel);
//         });
//         yield DiaryCardAdded(this._diaryCardDetailsList);
//       } catch (e) {
//         yield DiaryError('Error in Connecting Try Again!');
//       }
//     }
//     if (event is InitialEnvent) {
//       yield DiaryLoading();
//       try {
//         var _diaryEntryStream = this._diaryRepo.diaryEntries();
//         print('ffff---');
//         this._diaryCardDetailsList =
//             await this._categoryList(_diaryEntryStream);
//         //print ((await _diaryEntryStream.first)[1].title);
//         print("++++");
//         print('aaaxxxxaaa');
//         print(this._diaryCardDetailsList.length);
//         //print (this._diaryCardDetailsList[0][0].subTitle);
//         //yield DiaryCardAdded(_diaryCardDetailsList);
//         yield (DiaryInitialLoaded(_diaryEntryStream));
//       } catch (e) {
//         yield DiaryError('Error in Connecting Try Again!');
//       }
//     }
//   }

//   Future<List<DiaryEntry>> _categoryList(Stream _currentEntries) async {
//     return _currentEntries.first;
//   }
// }
