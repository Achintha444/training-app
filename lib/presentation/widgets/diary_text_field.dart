import 'package:flutter/material.dart';

class DiaryTextField extends StatelessWidget {
  final int maxLines;
  final String errorText;
  final TextEditingController controller;
  final String labelText;
  final Color color;
  final BuildContext context;
  Function onChange;

  Function onTap = () {};

  DiaryTextField(
      {Key key,
      this.maxLines,
      this.errorText,
      this.controller,
      this.labelText,
      this.color,
      this.context,
      this.onTap,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: this.maxLines,
      decoration: this._signupScreenInputDecoration(labelText, color, context),
      onTap: this.onTap,
      style: TextStyle(
        fontSize: 16,
        letterSpacing: 1,
        color: Color.fromARGB(200, 0, 0, 0),
      ),
      onChanged: this.onChange,
      controller: this.controller,
      validator: (value) {
        if (value.isEmpty) {
          return this.errorText;
        }
        return null;
      },
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