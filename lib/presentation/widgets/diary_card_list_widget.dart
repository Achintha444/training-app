import 'package:flutter/material.dart';

import 'diary_card.dart';

class DiaryCardListWidget extends StatelessWidget {
  const DiaryCardListWidget({
    Key key,
    @required List<List<String>> diaryCardList,
  })  : _diaryCardList = diaryCardList,
        super(key: key);

  final List<List<String>> _diaryCardList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: this._diaryCardList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            DiaryCard(
              title: this._diaryCardList[index][0],
              subTitle: 'This is the Subtitle',
              desc: this._diaryCardList[index][1],
            ),
            Padding(padding: EdgeInsets.only(top: 5, bottom: 5))
          ],
        );
      },
    );
  }
}
