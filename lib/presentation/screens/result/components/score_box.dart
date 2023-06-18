import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/quiz_app_cubit.dart';
import '../../../widgets/text.dart';

class ScoreBox extends StatelessWidget {
  const ScoreBox({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: QuizAppCubit.get(context).textColor,
              width: 2,
            ),
          ),
          child: TextCall(
            text: text,
            size: 25,
            weight: FontWeight.w600,
            color: QuizAppCubit.get(context).textColor,
          ),
        );
      },
    );
  }
}
