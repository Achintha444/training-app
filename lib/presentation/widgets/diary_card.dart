import 'package:flutter/material.dart';

class DiaryCard extends StatefulWidget {
  final String title;
  final String subTitle;
  final String desc;

  const DiaryCard({Key key, this.title, this.subTitle, this.desc})
      : super(key: key);

  @override
  _DiaryCardState createState() => _DiaryCardState();
}

class _DiaryCardState extends State<DiaryCard> {
  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffB9E9FF),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.widget.title,
            textAlign: TextAlign.justify,
            maxLines: 2,
            style: TextStyle(
              color: Color(0xff181E21),
              fontSize: 24,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.4,
            ),
          ),
          Padding(padding: EdgeInsets.all(2.5)),
          Text(
            this.widget.subTitle,
            textAlign: TextAlign.justify,
            maxLines: 1,
            style: TextStyle(
              color: Color(0xff556B75),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.2,
            ),
          ),
          Padding(padding: EdgeInsets.all(6.5)),
          Text(
            this.widget.desc,
            textAlign: TextAlign.justify,
            maxLines: descTextShowFlag ? 3 : 2,
            style: TextStyle(
              color: Color(0xff181E21),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.15,
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            onPressed: () {
              setState(() {
                descTextShowFlag = !descTextShowFlag;
              });
            },
            child: descTextShowFlag
                ? Text('Show Less'.toUpperCase())
                : Text('Show More'.toUpperCase()),
            padding: EdgeInsets.all(0),
          ),
        ],
      ),
    );
  }
}
