import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quize_app/logic/quiz_app_cubit.dart';

import '../../../widgets/square_button.dart';

class ChoicesList extends StatelessWidget {
  const ChoicesList({
    super.key,
    required this.quizIndex,
  });
  final int quizIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAppCubit, QuizAppStates>(
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: QuizAppCubit.get(context)
              .questionsList[quizIndex]
              .answersList
              .length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SquareButtonCall(
                borderRadius: 20,
                text: QuizAppCubit.get(context)
                    .questionsList[quizIndex]
                    .answersList[index]
                    .answer,
                color: QuizAppCubit.get(context).getButtonColor(index),
                onPressed: QuizAppCubit.get(context).quizPinIndex >
                        QuizAppCubit.get(context).getQuestionIndex()
                    ? null
                    : () {
                        QuizAppCubit.get(context).changeAnswerSelection(
                          index,
                        );
                      },
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 20,
            );
          },
        );
      },
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quize_app/logic/quiz_app_cubit.dart';
// import 'package:quize_app/presentation/widgets/text.dart';

// class ChoicesList extends StatelessWidget {
//   const ChoicesList({
//     super.key,
//     required this.quizIndex,

//     // required this.choicesList,
//   });
//   // final List choicesList;
//   final int quizIndex;
//   final textText = ',bvvvxfj,xfj,xfj,xfj,xfj,xfxfj,x';

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<QuizAppCubit, QuizAppStates>(
//       builder: (context, state) {
//         return Expanded(
//           child: ListView.separated(
//             itemCount: QuizAppCubit.get(context)
//                 .questionsList[quizIndex]
//                 .answersList
//                 .length,
//             itemBuilder: (BuildContext context, int i) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: ChoiceChip(
//                   // will edit the layout later
//                   label: Center(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         TextCall(
//                           // text: textText,
//                           text: QuizAppCubit.get(context)
//                               .questionsList[quizIndex]
//                               .answersList[i]
//                               .answer,
//                           size: 22,
//                           weight: FontWeight.bold,
//                           // align: Alignment.center,

//                           color: QuizAppCubit.get(context).appBarTextColor,
//                         ),
//                       ],
//                     ),
//                   ),
//                   selected: QuizAppCubit.get(context)
//                           .questionsList[quizIndex]
//                           .selectedAnswer ==
//                       i,
//                   selectedColor: QuizAppCubit.get(context).selectedColor,
//                   // selectedColor: Colors.orange[900],
//                   backgroundColor: QuizAppCubit.get(context).getButtonColor(i),
//                   // backgroundColor: QuizAppCubit.get(context).appBarColor,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 20,
//                   ),
//                   materialTapTargetSize: MaterialTapTargetSize.padded,
//                   clipBehavior: Clip.none,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   onSelected: (bool value) {
//                     QuizAppCubit.get(context).changeAnswerSelection(value, i);
//                     debugPrint(
//                       'Answer: ${QuizAppCubit.get(context).questionsList[QuizAppCubit.get(context).getQuestionIndex()].selectedAnswer}',
//                     );
//                   },
//                 ),
//               );
//             },
//             separatorBuilder: (BuildContext context, int index) {
//               return const SizedBox(
//                 height: 20,
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
