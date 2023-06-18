import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import '../../data/constants/consts.dart';
import 'app_mode.dart';
import 'text.dart';
import 'theme_color.dart';

class AlertDialogCall {
  static show({required BuildContext context}) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (BuildContext context) {
        return BlocBuilder<QuizAppCubit, QuizAppStates>(
          builder: (context, state) {
            return AlertDialog(
              contentPadding: const EdgeInsets.only(
                top: 20,
                bottom: 10,
                left: 24,
                right: 24,
              ),
              title: const TextCall(
                text: 'Settings',
                weight: FontWeight.bold,
                size: 30,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  AppModeElement(),
                  ThemeColorElement(),
                ],
              ),
              actions: [
                TextButton(
                  child: TextCall(
                    text: okButton,
                    color: QuizAppCubit.get(context).themeColor,
                    size: 22,
                    weight: FontWeight.bold,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
