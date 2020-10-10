import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/presentation/bloc/root/root_bloc.dart';
import 'package:training_app/presentation/bloc/root/root_state.dart';
import 'package:training_app/presentation/widgets/loading_state_widget.dart';

import 'main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadingScreen = Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
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
            print('check1');
            print(state.initialized);
            if (state.initialized) {
              print('object');
              return MainPage();
            } else{
              return loadingScreen;
            }
            
          },
        ),
      ),
    );
  }
}
