import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import '../../../widgets/circle_button.dart';

class PreviousQuestionButton extends StatelessWidget {
  const PreviousQuestionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return CircleButtonCall(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 10,
          ),
          icon: Icons.arrow_back_ios_outlined,
          iconColor: QuizAppCubit.get(context).appBarTextColor,
          buttonColor: QuizAppCubit.get(context).getQuestionIndex() == 0
              ? null
              : QuizAppCubit.get(context).appBarColor,
          onPressed: QuizAppCubit.get(context).getQuestionIndex() == 0
              ? null
              : () {
                  QuizAppCubit.get(context).scrollToPreviousQuestion();
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      QuizAppCubit.get(context).checkSelectedAnswer();
                    },
                  );
                },
        );
      },
    );
  }
}
