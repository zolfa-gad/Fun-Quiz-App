import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import '../../../widgets/circle_button.dart';

class NextQuestionButton extends StatelessWidget {
  const NextQuestionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return CircleButtonCall(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 10,
          ),
          icon: Icons.arrow_forward_ios_outlined,
          iconColor: QuizAppCubit.get(context).appBarTextColor,
          buttonColor: QuizAppCubit.get(context).inProcess
              ? null
              : QuizAppCubit.get(context).appBarColor,
          onPressed: QuizAppCubit.get(context).inProcess
              ? null
              : () {
                  if (QuizAppCubit.get(context).quizPinIndex <=
                      QuizAppCubit.get(context).getQuestionIndex()) {
                    QuizAppCubit.get(context).checkSelectedAnswer();
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        QuizAppCubit.get(context).scrollToNextQuestion();
                      },
                    );
                  } else {
                    QuizAppCubit.get(context).scrollToNextQuestion();
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        QuizAppCubit.get(context).checkSelectedAnswer();
                      },
                    );
                  }
                },
        );
      },
    );
  }
}
