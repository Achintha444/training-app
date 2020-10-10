// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/diary_bloc.dart';
// import '../widgets/diary_card_list_widget.dart';
// import '../widgets/diary_form.dart';
// import '../widgets/error_state_widget.dart';
// import '../widgets/inital_state_widget.dart';
// import '../widgets/initial_loading_state_widget.dart';
// import '../widgets/loading_state_widget.dart';

// class DiaryPage extends StatefulWidget {
//   @override
//   _DiaryPageState createState() => _DiaryPageState();
// }

// class _DiaryPageState extends State<DiaryPage> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Firebase.initializeApp(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return ErrorStateWidget();
//         }
//         if (snapshot.connectionState == ConnectionState.done) {
//           return BlocProvider(
//             create: (context) => DiaryBloc(),
//             child: Column(
//               children: [
//                 DiaryForm(),
//                 Container(
//                   alignment: Alignment.center,
//                   child: BlocConsumer<DiaryBloc, DiaryState>(
//                     listener: (context, state) {
//                       if (state is DiaryCardAdded) {
//                         Scaffold.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('New Diary Entry Added'),
//                           ),
//                         );
//                       }
//                     },
//                     builder: (context, state) {
//                       if (state is DiaryInitial) {
//                         return InitialStateWidget();
//                       } else if (state is DiaryLoading) {
//                         return LoadingStateWidget();
//                       } else if (state is DiaryInitialLoaded) {
//                         return InitialLoadingStateWidget(
//                           diaryEntries: state.diaryEntryStream,
//                         );
//                       } else if (state is DiaryCardAdded) {
//                         return DiaryCardListWidget(
//                           diaryCardList: state.diaryCardDetailsList,
//                         );
//                       } else if(state is DiaryError){
//                         return ErrorStateWidget();
//                       } else {
//                         return Center(
//                           child: Text('Unexpected Error!'),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }

//         print('Error');
//         return LoadingStateWidget();
//       },
//     );
//   }
// }
