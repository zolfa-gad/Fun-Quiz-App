import 'package:flutter/material.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

class TextFormFieldCall extends StatelessWidget {
  const TextFormFieldCall({
    Key? key,
    required this.controller,
    required this.hint,
    required this.inputType,
    this.validator,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;
  final EdgeInsets padding;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: inputType,
        cursorWidth: 2,
        cursorColor: QuizAppCubit.get(context).appBarColor!,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: QuizAppCubit.get(context).textColor,
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: TextStyle(
            color: QuizAppCubit.get(context).textColor,
            fontSize: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: QuizAppCubit.get(context).appBarColor!,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: QuizAppCubit.get(context).appBarColor!,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
