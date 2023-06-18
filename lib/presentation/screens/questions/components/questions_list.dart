import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';
import 'package:quize_app/presentation/screens/questions/components/question.dart';

import 'choices_list.dart';

class QuestiosList extends StatelessWidget {
  const QuestiosList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return Expanded(
          child: PageView.builder(
            itemCount: QuizAppCubit.get(context).questionsList.length,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            controller: QuizAppCubit.get(context).pageControll,
            onPageChanged: (val) {},
            itemBuilder: (context, index) {
              return ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                children: [
                  Question(
                    quizIndex: index,
                  ),
                  ChoicesList(
                    quizIndex: index,
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
