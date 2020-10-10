import 'package:flutter/material.dart';
import 'package:training_app/presentation/widgets/diary_card_list_widget.dart';
import 'package:training_app/presentation/widgets/loading_state_widget.dart';

import '../../db/model/diary_entry.dart';

class InitialLoadingStateWidget extends StatelessWidget {
  final Stream<List<DiaryEntry>> diaryEntries;

  const InitialLoadingStateWidget({Key key, @required this.diaryEntries})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this.diaryEntries);
    return StreamBuilder(
        stream: this.diaryEntries,
        builder: (context, diaryEntries) {
          print('Entered');
          if (!diaryEntries.hasData){
            print ('loading');
            print ('0000');
            return LoadingStateWidget();
          }
          else
            return DiaryCardListWidget(
              diaryCardList: diaryEntries.data,
            );
          // print ('aaaaaaaaaaaaaaaaaa');
          // print (diaryEntries.data);
          // //return DiaryCardListWidget(diaryCardList: diaryEntries.data,);
          //print (diaryEntries.data.title);
          //return Container();
        });
  }
}
