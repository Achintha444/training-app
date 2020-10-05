import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String desc;

  const DiaryCard({Key key, this.title, this.subTitle, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.8,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffB9E9FF),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.only(top:15,left:15,right: 15, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.title,
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
            this.subTitle,
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
            this.desc,
            textAlign: TextAlign.justify,
            maxLines: 3,
            style: TextStyle(
              color: Color(0xff181E21),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.15,
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          FlatButton(
            onPressed: () {},
            child: Text('Show More'.toUpperCase()),
            padding: EdgeInsets.only(left: 0),
          ),
        ],
      ),
    );
  }
}
