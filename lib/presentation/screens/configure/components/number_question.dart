import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import '../../../widgets/text.dart';
import '../../../widgets/text_form_field.dart';

class NumberOfQuiz extends StatelessWidget {
  const NumberOfQuiz({
    super.key,
    required this.quiz,
    required this.numOfQuiz,
  });

  final String quiz;
  final TextEditingController numOfQuiz;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: TextCall(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                text: quiz,
                size: 23,
                weight: FontWeight.w600,
                // align: Alignment.centerLeft,
                color: QuizAppCubit.get(context).textColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormFieldCall(
              controller: numOfQuiz,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              hint: QuizAppCubit.get(context).configuratioList.amount.hint,
              inputType: TextInputType.number,
            ),
          ],
        );
      },
    );
  }
}
