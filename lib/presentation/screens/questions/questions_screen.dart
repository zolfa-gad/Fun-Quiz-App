import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import '../../../data/constants/consts.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/text.dart';
import 'components/close_button.dart';
import 'components/next_button.dart';
import 'components/number_stepper.dart';
import 'components/previous_button.dart';
import 'components/questions_list.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: BlocBuilder<QuizAppCubit, QuizAppStates>(
          builder: (context, state) {
            return AppBarCall(
              leading: TextCall(
                text: 'Score: ${QuizAppCubit.get(context).totalScore}',
                size: 20,
                color: QuizAppCubit.get(context).appBarTextColor,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          PreviousQuestionButton(),
          NextQuestionButton(),
        ],
      ),
      body: BlocConsumer<QuizAppCubit, QuizAppStates>(
        listener: (context, state) {
          if (state is ResetAndCloseQuestionsState) {
            Navigator.of(context).pushReplacementNamed(configureScreen);
          } else if (state is IsFinalQuestionState) {
            Navigator.of(context).pushReplacementNamed(resultScreen);
          } else if (state is NoAnswerSelectedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              QuizAppCubit.get(context).showSnackBarMessage(),
            );
          }
        },
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: QuizAppCubit.get(context).backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    CloseQuestionsButton(),
                    QuestionsIndexStepper(),
                  ],
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                  color: QuizAppCubit.get(context).textColor.withOpacity(0.4),
                ),
                const QuestiosList(),
                // const NextQuestionButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
