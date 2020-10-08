import 'package:flutter/material.dart';

import 'diary_card.dart';

class DiaryCardListWidget extends StatelessWidget {
  const DiaryCardListWidget({
    Key key,
    @required List<DiaryCard> diaryCardList,
  })  : _diaryCardList = diaryCardList,
        super(key: key);

  final List<DiaryCard> _diaryCardList;

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
            this._diaryCardList[index],
            Padding(padding: EdgeInsets.only(top: 5, bottom: 5))
          ],
        );
      },
    );
  }
}
