import 'package:flutter/material.dart';

import '../../db/model/diary_entry.dart';
import 'diary_card.dart';

class DiaryCardListWidget extends StatelessWidget {
  const DiaryCardListWidget({
    Key key,
    @required List<DiaryEntry> diaryCardList,
  })  : _diaryCardList = diaryCardList,
        super(key: key);

  final List<DiaryEntry> _diaryCardList;

  @override
  Widget build(BuildContext context) {
    print('checkkk');
    print (this._diaryCardList[0].subTitle);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: this._diaryCardList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            DiaryCard(
              title: this._diaryCardList[index].title,
              subTitle: this._diaryCardList[index].subTitle,
              desc: this._diaryCardList[index].desc,
            ),
            Padding(padding: EdgeInsets.only(top: 5, bottom: 5))
          ],
        );
      },
    );
  }
}
