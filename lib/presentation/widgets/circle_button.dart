import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/quiz_app_cubit.dart';

class CircleButtonCall extends StatelessWidget {
  const CircleButtonCall({
    Key? key,
    this.icon,
    required this.buttonColor,
    this.iconColor,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.height = 70,
    this.width = 70,
    this.borderSide = BorderSide.none,
  }) : super(key: key);

  final IconData? icon;
  final Color? buttonColor;
  final Color? iconColor;
  final VoidCallback? onPressed;
  final EdgeInsets padding;
  final double height;
  final double width;
  final BorderSide borderSide;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return Padding(
          padding: padding,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttonColor),
              fixedSize: MaterialStateProperty.all(
                Size(width, height),
              ),
              shape: MaterialStateProperty.all(
                CircleBorder(
                  side: borderSide,
                ),
              ),
            ),
            child: Center(
              child: Icon(
                icon,
                color: iconColor,
                size: 30,
              ),
            ),
          ),
        );
      },
    );
  }
}
