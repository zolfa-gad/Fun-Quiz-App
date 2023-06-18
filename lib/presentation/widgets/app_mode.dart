import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import 'switch.dart';
import 'text.dart';

class AppModeElement extends StatelessWidget {
  const AppModeElement({super.key});

  final String appModeText = 'App Mode';
  final String darkModeText = 'Dark Mode';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextCall(
              text: appModeText,
              textAlign: TextAlign.left,
              weight: FontWeight.bold,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                TextCall(
                  text: darkModeText,
                  textAlign: TextAlign.left,
                ),
                const Spacer(),
                //switch for dark mode
                SwitchCall(
                  value: QuizAppCubit.get(context).isDarkModeTheme,
                  onChanged: (value) {
                    if (value) {
                      QuizAppCubit.get(context).isDarkMode();
                    } else {
                      QuizAppCubit.get(context).isLightMode();
                    }
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
