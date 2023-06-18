import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import '../../../data/constants/consts.dart';
import '../../widgets/animation.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/square_button.dart';
import 'components/congrats_text.dart';
import 'components/score_box.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: QuizAppCubit.get(context).backgroundColor,
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: AppBarCall(),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: AnimationCall(
                seconds: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CongratulationText(),
                    Column(
                      children: [
                        ScoreBox(
                          text:
                              'total score:  ${QuizAppCubit.get(context).totalScore}',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ScoreBox(
                          text:
                              'highest score:  ${QuizAppCubit.get(context).getHighestScore()}',
                        ),
                      ],
                    ),
                    SquareButtonCall(
                      text: playAgainButton,
                      color: QuizAppCubit.get(context).appBarColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      onPressed: () {
                        QuizAppCubit.get(context).resetAndCloseQuestions();
                        Navigator.of(context)
                            .pushReplacementNamed(configureScreen);
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
