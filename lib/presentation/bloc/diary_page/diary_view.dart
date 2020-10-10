import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/presentation/widgets/diary_card_list_widget.dart';
import 'package:training_app/presentation/widgets/diary_form.dart';
import 'package:training_app/presentation/widgets/loading_state_widget.dart';

import 'diary_bloc.dart';
import 'diary_state.dart';

class DiaryView extends StatelessWidget {
  static final log = Log("DiaryView");
  // static final loadingWidget = Center(
  //   child: CircularProgressIndicator(),
  // );

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final diaryBloc = BlocProvider.of<DiaryBloc>(context);
    // // ignore: close_sinks
    // final rootBloc = BlocProvider.of<RootPageBloc>(context);
    log.d("Loading Diary View");

    //CustomSnackBar customSnackBar;
    return Column(children: [
      DiaryForm(
        blocProvider: diaryBloc,
      ),
      BlocBuilder<DiaryBloc, DiaryState>(
        buildWhen: (pre, current) => !identical(
          pre.diaryEntryList,
          current.diaryEntryList,
        ),
        builder: (context, state) {
          print (state.diaryEntryList);
          if (state.diaryEntryList == null) return LoadingStateWidget();
          return DiaryCardListWidget(diaryCardList: state.diaryEntryList);
        },
      ),
    ]);

    // return MultiBlocListener(
    //   listeners: [
    //     BlocListener<DiaryBloc, DiaryState>(
    //       listenWhen: (pre, current) => pre.error != current.error,
    //       listener: (context, state) {
    //         if (state.error?.isNotEmpty ?? false) {
    //           customSnackBar?.showErrorSnackBar(state.error);
    //         } else {
    //           customSnackBar?.hideAll();
    //         }
    //       },
    //     ),
    //   ],
    //   child: scaffold,
    // );
  }
}
