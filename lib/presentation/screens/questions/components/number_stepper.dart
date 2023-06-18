import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

class QuestionsIndexStepper extends StatelessWidget {
  const QuestionsIndexStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return Expanded(
          child: NumberStepper(
            numbers: QuizAppCubit.get(context).questionsList.length < 2
                ? []
                : List.generate(
                    QuizAppCubit.get(context).questionsList.length,
                    (index) {
                      return index + 1;
                    },
                  ),

            enableNextPreviousButtons: false,
            direction: Axis.horizontal,

            stepColor: QuizAppCubit.get(context).appBarColor,
            lineLength: 20,
            stepRadius: 15,
            enableStepTapping: false,
            steppingEnabled: false,

            stepReachedAnimationEffect: Curves.easeIn,

            // stepReachedAnimationDuration: const Duration(milliseconds: 100),

            numberStyle: TextStyle(
              color: QuizAppCubit.get(context).appBarTextColor,
            ),

            lineColor: QuizAppCubit.get(context).textColor,
            activeStepColor: QuizAppCubit.get(context).selectedAnswerColor,

            activeStep: QuizAppCubit.get(context).getQuestionIndex(),

            //
          ),
        );
      },
    );
  }
}
