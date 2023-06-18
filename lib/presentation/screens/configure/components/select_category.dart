import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import '../../../widgets/drop_down_menu.dart';
import '../../../widgets/text.dart';

class CategorySelect extends StatelessWidget {
  const CategorySelect({
    super.key,
    required this.category,
  });

  final String category;

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
                text: category,
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
              type: 'catg',
              items: QuizAppCubit.get(context).categoryList,
              hint: QuizAppCubit.get(context).configuratioList.category.hint,
              onChanged: (value) {
                QuizAppCubit.get(context).setCategory(value);
              },
            ),
          ],
        );
      },
    );
  }
}
