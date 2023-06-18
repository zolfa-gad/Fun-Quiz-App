import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import '../../../widgets/text.dart';

class CongratulationText extends StatelessWidget {
  const CongratulationText({super.key});

  final String congratsText = 'Congratulation';
  final String finishedText = 'You have finished the questions sucessfully.';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return Column(
          children: [
            TextCall(
              text: congratsText,
              size: 50,
              weight: FontWeight.bold,
              color: QuizAppCubit.get(context).appBarColor,
              shadows: [
                Shadow(
                  color: QuizAppCubit.get(context).isDarkModeTheme
                      ? QuizAppCubit.get(context).appBarTextColor
                      : QuizAppCubit.get(context).textColor.withOpacity(0.6),
                  offset: const Offset(8, 8),
                  blurRadius: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextCall(
              text: finishedText,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              size: 22,
              weight: FontWeight.w500,
              color: QuizAppCubit.get(context).textColor,
            ),
          ],
        );
      },
    );
  }
}
