import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/diary_page/diary_provider.dart';
import 'bloc/root/root_bloc.dart';
import 'bloc/root/root_state.dart';
import 'widgets/DiaryAppBar.dart';
import 'widgets/loading_state_widget.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => RootBloc(context),
        child: BlocBuilder<RootBloc, RootState>(
          buildWhen: (pre, current) => pre.initialized != current.initialized,
          builder: (context, state) {
            if (state.initialized) {
              return Scaffold(
                appBar: DiaryAppBar(),
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
                        DiaryProvider(),
                      ]),
                    ),
                  ),
                ),
              );
            } else {
              return LoadingStateWidget();
            }
          },
        ),
      ),
    );
  }
}
