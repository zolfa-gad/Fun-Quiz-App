import 'dart:math';

import 'package:html_unescape/html_unescape.dart';

import 'answer_model.dart';

class QuestionModel {
  late String category;
  late String type;
  late String difficulty;
  late String question;
  late String correctAnswer;
  late List inCorrectAnswers;
  late List<AnswerModel> answersList;
  int selectedAnswer = -1;

  QuestionModel.fromJson(Map<String, dynamic> map, int index) {
    category = map['category'];
    type = map['type'];
    difficulty = map['difficulty'];
    question = reFormatString('$index.  ${map['question']}');
    correctAnswer = map['correct_answer'];
    inCorrectAnswers = map['incorrect_answers'];

    answersList = reArrange();
  }

  reArrange() {
    List<AnswerModel> answersTemp = [];
    List<AnswerModel> reArrangedAnswers = [];
    int random;

    answersTemp.add(
      AnswerModel(
        isCorrect: true,
        answer: reFormatString(correctAnswer),
      ),
    );

    for (int i = 0; i < inCorrectAnswers.length; i++) {
      answersTemp.add(
        AnswerModel(
          isCorrect: false,
          answer: reFormatString(inCorrectAnswers[i]),
        ),
      );
    }

    while (answersTemp.length != 1) {
      random = Random().nextInt(answersTemp.length);
      reArrangedAnswers.add(answersTemp[random]);
      answersTemp.removeAt(random);
    }

    reArrangedAnswers.add(answersTemp[0]);

    return reArrangedAnswers;
  }

  reFormatString(String text) {
    text = HtmlUnescape().convert(text);

    return text;
  }
}
