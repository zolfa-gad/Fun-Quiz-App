import 'package:flutter/material.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

class SwitchCall extends StatelessWidget {
  const SwitchCall({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      activeColor: QuizAppCubit.get(context).themeColor,
      onChanged: onChanged,
    );
  }
}
