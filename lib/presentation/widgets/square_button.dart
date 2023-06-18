import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import 'text.dart';

class SquareButtonCall extends StatelessWidget {
  const SquareButtonCall({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.height = 70,
    this.width = 200,
    this.borderRadius = 5.0,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final EdgeInsets padding;
  final double height;
  final double width;
  final double borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, _) {
        return Padding(
          padding: padding,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
              ),
            ),
            child: TextCall(
              text: text,
              size: 22,
              weight: FontWeight.bold,
              color: QuizAppCubit.get(context).appBarTextColor,
            ),
          ),
        );
      },
    );
  }
}
