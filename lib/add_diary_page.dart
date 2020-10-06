import 'package:flutter/material.dart';

import 'diary_card.dart';
import 'diary_home.dart';

class AddDiaryPage extends StatefulWidget {
  @override
  _AddDiaryPageState createState() => _AddDiaryPageState();
}

class _AddDiaryPageState extends State<AddDiaryPage> {
  List<DiaryCard> _diaryCardList;

  @override
  void initState() {
    this._diaryCardList = [
      DiaryCard(
        title: 'This is the title',
        subTitle:
            'This is the subtitle This is the title This is the title This is the title This is the title This is the title',
        desc:
            'This is the desc This is the desc This is the desc This is the desc This is the desc This is the desc This is the desc',
      ),
       DiaryCard(
        title: 'This is the title',
        subTitle:
            'This is the subtitle This is the title This is the title This is the title This is the title This is the title',
        desc:
            'This is the desc This is the desc This is the desc This is the desc This is the desc This is the desc This is the desc',
      ),
       DiaryCard(
        title: 'This is the title',
        subTitle:
            'This is the subtitle This is the title This is the title This is the title This is the title This is the title',
        desc:
            'This is the desc This is the desc This is the desc This is the desc This is the desc This is the desc This is the desc',
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DiaryHome(),
          // Padding(padding: EdgeInsets.only(top: 7.5, bottom: 7.5)),
          // ListView.builder(
          //   scrollDirection: Axis.vertical,
          //   shrinkWrap: true,
          //   physics: ScrollPhysics(),
          //   itemCount: this._diaryCardList.length,
          //   itemBuilder: (context, index) {
          //     return Column(
          //       children: [
          //         this._diaryCardList[index],
          //         Padding(padding: EdgeInsets.only(top:5,bottom:5))
          //       ],
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
