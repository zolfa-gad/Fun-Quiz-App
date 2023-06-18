import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/consts.dart';
import '../../logic/quiz_app_cubit.dart';
import 'dialog.dart';
import 'icon_button.dart';
import 'text.dart';

class AppBarCall extends StatelessWidget {
  const AppBarCall({
    Key? key,
    this.leading,
  }) : super(key: key);

  final Widget? leading;
  final String appBarTitle = 'Quiz App';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, _) {
        return AppBar(
          centerTitle: true,
          leadingWidth: 110,
          elevation: 10,
          shadowColor: QuizAppCubit.get(context).appBarShadowColor,
          backgroundColor: QuizAppCubit.get(context).appBarColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black54,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
          ),
          leading: Center(child: leading),
          actions: [
            IconButtonCall(
              icon: Icons.settings_outlined,
              iconColor: QuizAppCubit.get(context).appBarTextColor,
              onPressed: () {
                AlertDialogCall.show(context: context);
              },
            ),
          ],
          title: TextCall(
            text: appBarTitle,
            size: 25,
            weight: FontWeight.w700,
            color: QuizAppCubit.get(context).appBarTextColor,
            fontFamily: notoFonts,
          ),
        );
      },
    );
  }
}
