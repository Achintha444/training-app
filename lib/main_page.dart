import 'package:flutter/material.dart';

import 'presentation/pages/diary_page.dart';


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Color(0xff049CE6), Color(0xff00BBD5)],
            ),
          ),
        ),
        actions: <Widget>[
          Icon(
            Icons.notifications,
            color: Colors.white.withOpacity(0.9),
            size: 40,
          ),
          Padding(padding: EdgeInsets.only(left: 5, right: 5)),
          Padding(
            padding: const EdgeInsets.all(1.5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Container(
                  color: Color(0xff662D91),
                  child: SizedBox(height: 55, width: 55)),
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [Color(0xff049CE6), Color(0xff00BBD5)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15, bottom: 15)),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'You are here: Home',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
              DiaryPage(),
            ]),
          ),
        ),
      ),
    );
  }
}
