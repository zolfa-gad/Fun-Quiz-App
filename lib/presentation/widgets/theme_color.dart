import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import 'circle_button.dart';
import 'text.dart';

class ThemeColorElement extends StatelessWidget {
  const ThemeColorElement({super.key});

  final String themeColorText = 'Color Theme';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextCall(
              text: themeColorText,
              padding: const EdgeInsets.symmetric(vertical: 10),
              textAlign: TextAlign.left,
              weight: FontWeight.bold,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 250,
              child: GridView.builder(
                itemCount: QuizAppCubit.get(context).themeColorList.length,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 70,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemBuilder: (context, index) {
                  return CircleButtonCall(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(5),
                    buttonColor: QuizAppCubit.get(context)
                        .themeColorList[index]
                        .themeColor,
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: QuizAppCubit.get(context).themeColorIndex == index
                          ? 2.5
                          : 0.5,
                    ),
                    onPressed: () {
                      QuizAppCubit.get(context).changeThemeColor(index);
                      if (QuizAppCubit.get(context).isDarkModeTheme) {
                        QuizAppCubit.get(context).isDarkMode();
                      } else {
                        QuizAppCubit.get(context).isLightMode();
                      }
                    },
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
