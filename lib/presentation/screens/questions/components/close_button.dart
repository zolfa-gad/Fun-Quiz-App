import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import '../../../widgets/circle_button.dart';

class CloseQuestionsButton extends StatelessWidget {
  const CloseQuestionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return CircleButtonCall(
          icon: Icons.close,
          iconColor: QuizAppCubit.get(context).textColor,
          buttonColor: QuizAppCubit.get(context).backgroundColor,
          padding: const EdgeInsets.all(15),
          height: 50,
          width: 50,
          onPressed: () {
            QuizAppCubit.get(context).resetAndCloseQuestions();
          },
        );
      },
    );
  }
}
