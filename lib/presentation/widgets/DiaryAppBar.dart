import 'package:flutter/material.dart';

class DiaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiaryAppBar({
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              child: SizedBox(height: 55, width: 55),
            ),
          ),
        ),
      ],
    );
  }
}