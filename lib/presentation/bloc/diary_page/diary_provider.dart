import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_bloc.dart';
import 'diary_view.dart';

class DiaryProvider extends BlocProvider<DiaryBloc> {
  DiaryProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => DiaryBloc(context),
          child: DiaryView(),
        );
}
