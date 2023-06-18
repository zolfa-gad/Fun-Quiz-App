import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/constants/consts.dart';
import 'data/services/local_services.dart';
import 'data/services/networ_services.dart';
import 'logic/quiz_app_cubit.dart';
import 'presentation/screens/configure/configure_screen.dart';
import 'presentation/screens/questions/questions_screen.dart';
import 'presentation/screens/result/result_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppNetworkServices.init();
  await AppLocalServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizAppCubit()..getCatigories(),
      child: BlocBuilder<QuizAppCubit, QuizAppStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // backgroundColor: Colors.green,

              primarySwatch: QuizAppCubit.get(context).themeColor,
            ),
            routes: {
              configureScreen: (context) => const ConfigureScreen(),
              questionScreen: (context) => const QuestionScreen(),
              resultScreen: (context) => const ResultScreen(),
            },
            home: const ConfigureScreen(),
          );
        },
      ),
    );
  }
}
