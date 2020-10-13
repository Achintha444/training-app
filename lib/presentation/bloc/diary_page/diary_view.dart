import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/diary_card_list_widget.dart';
import '../../widgets/diary_form.dart';
import '../../widgets/loading_state_widget.dart';
import 'diary_bloc.dart';
import 'diary_state.dart';

class DiaryView extends StatelessWidget {
  static final log = Log("DiaryView");

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final diaryBloc = BlocProvider.of<DiaryBloc>(context);
    // // ignore: close_sinks
    log.d("Loading Diary View");

    return Column(
      children: [
        DiaryForm(
          blocProvider: diaryBloc,
        ),
        
        BlocBuilder<DiaryBloc, DiaryState>(
          buildWhen: (pre, current) => !identical(
            pre.diaryEntryList,
            current.diaryEntryList,
          ),
          builder: (context, state) {
            print(state.diaryEntryList);
            if (state.diaryEntryList == null) return LoadingStateWidget();
            return DiaryCardListWidget(diaryCardList: state.diaryEntryList);
          },
        ),
      ],
    );
  }
}
