import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import '../../../data/constants/consts.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/square_button.dart';
import 'components/number_question.dart';
import 'components/select_category.dart';
import 'components/select_difficulty.dart';

class ConfigureScreen extends StatelessWidget {
  const ConfigureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizAppCubit, QuizAppStates>(
      listener: (context, state) {
        if (state is GetQuestionsSuccessState) {
          Navigator.of(context).pushReplacementNamed(questionScreen);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: QuizAppCubit.get(context).backgroundColor,
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: AppBarCall(),
          ),
          body: Center(
            child: QuizAppCubit.get(context).isLoading
                ? CircularProgressIndicator(
                    color: QuizAppCubit.get(context).appBarColor,
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              NumberOfQuiz(
                                quiz: QuizAppCubit.get(context)
                                    .configuratioList
                                    .amount
                                    .question,
                                numOfQuiz: QuizAppCubit.get(context).numOfQuiz,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CategorySelect(
                                category: QuizAppCubit.get(context)
                                    .configuratioList
                                    .category
                                    .question,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DifficultySelect(
                                diff: QuizAppCubit.get(context)
                                    .configuratioList
                                    .difficulty
                                    .question,
                              ),
                            ],
                          ),
                          SquareButtonCall(
                            text: startButton,
                            padding: const EdgeInsets.all(50),
                            color: QuizAppCubit.get(context).appBarColor,
                            onPressed: () {
                              QuizAppCubit.get(context).getQuestions();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
