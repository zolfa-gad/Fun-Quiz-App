import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import '../../../widgets/drop_down_menu.dart';
import '../../../widgets/text.dart';

class DifficultySelect extends StatelessWidget {
  const DifficultySelect({
    super.key,
    required this.diff,
  });

  final String diff;

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
                text: diff,
                size: 23,
                weight: FontWeight.w600,
                color: QuizAppCubit.get(context).textColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DropDownButtonCall(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              type: 'diff',
              items: QuizAppCubit.get(context).difficultyList,
              hint: QuizAppCubit.get(context).configuratioList.difficulty.hint,
              onChanged: (value) {
                QuizAppCubit.get(context).setDifficulty(value);
              },
            ),
          ],
        );
      },
    );
  }
}
