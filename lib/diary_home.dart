import 'package:flutter/material.dart';

class DiaryHome extends StatefulWidget {
  @override
  _DiaryHomeState createState() => _DiaryHomeState();
}

class _DiaryHomeState extends State<DiaryHome> {
  final _formKey = GlobalKey<FormState>();
  bool isExpanded;

  void initState() {
    super.initState();
    isExpanded = true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: isExpanded ? MediaQuery.of(context).size.width :  MediaQuery.of(context).size.width/2,
            child: DiaryTextField(
              maxLines: 1,
              inputDecoration: _signupScreenInputDecoration(
                'Submit New',
                Color(0xff2F9DDC),
                context,
              ),
              onTap: () {
                setState(() {
                  this.isExpanded = true;
                });
              },
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
            height: isExpanded ? MediaQuery.of(context).size.height / 3.45 : 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
                  DiaryTextField(
                    maxLines: 6,
                    inputDecoration: _signupScreenInputDecoration(
                      'Enter Description',
                      Color(0xff15ABDA),
                      context,
                    ),
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
                      onPressed: () {
                        setState(() {
                          this.isExpanded = false;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _signupScreenInputDecoration(
      String labelText, Color color, BuildContext context) {
    return InputDecoration(
      hintText: labelText,
      hintStyle: TextStyle(
        color: Color.fromARGB(100, 0, 0, 0),
        letterSpacing: 1,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 15.0),
      filled: true,
      fillColor: color.withOpacity(0.8),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).errorColor,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}

class DiaryTextField extends StatelessWidget {
  final int maxLines;
  final InputDecoration inputDecoration;
  Function onTap = () {};

  DiaryTextField({
    Key key,
    this.maxLines,
    this.inputDecoration,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: this.maxLines,
      decoration: this.inputDecoration,
      onTap: this.onTap,
      style: TextStyle(
        fontSize: 16,
        letterSpacing: 1,
        color: Color.fromARGB(200, 0, 0, 0),
      ),
    );
  }
}
