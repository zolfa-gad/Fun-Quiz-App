import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/presentation/widgets/animation.dart';
import 'package:quize_app/presentation/widgets/text.dart';

import '../../../../logic/quiz_app_cubit.dart';

class Question extends StatelessWidget {
  const Question({
    Key? key,
    required this.quizIndex,
  }) : super(key: key);

  final int quizIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return AnimationCall(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 30,
            ),
            child: TextCall(
              text: QuizAppCubit.get(context).questionsList[quizIndex].question,
              size: 23,
              weight: FontWeight.w600,
              color: QuizAppCubit.get(context).textColor,
            ),
          ),
        );
      },
    );
  }
}
