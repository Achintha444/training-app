import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/presentation/bloc/diary_bloc.dart';
import 'package:training_app/presentation/widgets/diary_card_list_widget.dart';
import 'package:training_app/presentation/widgets/diary_form.dart';
import 'package:training_app/presentation/widgets/inital_state_widget.dart';

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiaryBloc(),
      child: Column(
        children: [
          DiaryForm(),
          Container(
            alignment: Alignment.center,
            child: BlocConsumer<DiaryBloc, DiaryState>(
              listener: (context, state) {
                if (state is DiaryCardAdded) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('New Diary Entry Added'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is DiaryInitial || state is DiaryLoading) {
                  return DiaryInitialStateWidget();
                } else if (state is DiaryCardAdded) {
                  return DiaryCardListWidget(
                    diaryCardList: state.diaryCardDetailsList,
                  );
                } else {
                  return Center(
                    child: Text('Unexpected Error!'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
