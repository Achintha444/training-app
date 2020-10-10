import 'package:flutter/material.dart';

import '../bloc/diary_page/diary_bloc.dart';
import '../bloc/diary_page/diary_event.dart';
import '../widgets/diary_text_field.dart';

class DiaryForm extends StatefulWidget {
  final DiaryBloc blocProvider;

  DiaryForm({Key key, this.blocProvider}) : super(key: key);
  @override
  _DiaryFormState createState() => _DiaryFormState();
}

class _DiaryFormState extends State<DiaryForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController controllerTitle = new TextEditingController();
  final TextEditingController controllerDesc = new TextEditingController();
  bool _isExpanded = true;
  String _title = "";
  String _desc = "";

  // void initState() {
  //   super.initState();
  //   _isExpanded = true;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _isExpanded
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width / 2,
                child: DiaryTextField(
                  maxLines: 1,
                  labelText: 'Submit New',
                  color: Color(0xff2F9DDC),
                  context: context,
                  errorText: 'Missing title',
                  onTap: () {
                    setState(() {
                      this._isExpanded = true;
                    });
                  },
                  onChange: (value) {
                    this._title = value;
                  },
                  controller: this.controllerTitle,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
                height:
                    _isExpanded ? MediaQuery.of(context).size.height / 3.15 : 0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
                      DiaryTextField(
                        maxLines: 6,
                        labelText: 'Enter Description',
                        color: Color(0xff15ABDA),
                        context: context,
                        errorText: 'Missing Description',
                        onChange: (value) {
                          this._desc = value;
                        },
                        controller: this.controllerDesc,
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          child: Text(
                            'SUBMIT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15),
                          ),
                          color: Color(0xff1E76F0).withOpacity(0.7),
                          elevation: 0,
                          onPressed: _submitFunction,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 7.5, bottom: 7.5)),
      ],
    );
  }

  void _submitFunction() {
    if (formKey.currentState.validate()) {
      setState(
        () {
          this._isExpanded = false;
        },
      );
      this.controllerTitle.clear();
      this.controllerDesc.clear();
      widget.blocProvider.add(AddDiaryEvent(this._title, this._desc));
      //.dispatch(AddDiaryCard(user: user));
    }
  }
}
