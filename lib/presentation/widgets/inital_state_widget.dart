// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:training_app/presentation/bloc/diary_bloc.dart';
// import 'package:training_app/presentation/widgets/loading_state_widget.dart';

// class InitialStateWidget extends StatefulWidget {
//   @override
//   _InitialStateWidgetState createState() =>
//       _InitialStateWidgetState();
// }

// class _InitialStateWidgetState extends State<InitialStateWidget> {

//   @override
//   void initState() {
//     super.initState();
//     this._dispatchEvent(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LoadingStateWidget();
//   }

//   void _dispatchEvent(BuildContext context) {
//     BlocProvider.of<DiaryBloc>(context)
//           .add(InitialEnvent());
//   }
// }
