import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/constants/consts.dart';
import '../data/constants/end_points.dart';
import '../data/models/color_model.dart';
import '../data/services/local_services.dart';
import '../data/services/networ_services.dart';
import '../presentation/screens/configure/models/category_model.dart';
import '../presentation/screens/configure/models/configure_list_model.dart';
import '../presentation/screens/configure/models/difficulty_model.dart';
import '../presentation/screens/questions/models/answer_model.dart';
import '../presentation/screens/questions/models/question_model.dart';
import '../presentation/widgets/show_message.dart';

part 'quiz_app_state.dart';

class QuizAppCubit extends Cubit<QuizAppStates> {
  QuizAppCubit() : super(QuizAppInitialState());

  static QuizAppCubit get(context) => BlocProvider.of(context);

  List<ColorModel> themeColorList = [
    ColorModel(
      themeColor: Colors.indigo,
      // screenColorLight: Colors.indigo.withOpacity(0.3),
      backgroundColorLight: Colors.indigo[100],
      appBarColorLight: Colors.indigo[800],
      appBarColorDark: Colors.indigo[300],
      appBarShadowColorDark: Colors.indigo[400],
    ),
    ColorModel(
      themeColor: Colors.deepPurple,
      // screenColorLight: Colors.deepPurple.withOpacity(0.3),
      backgroundColorLight: Colors.deepPurple[100],
      appBarColorLight: Colors.deepPurple[800],
      appBarColorDark: Colors.deepPurple[300],
      appBarShadowColorDark: Colors.deepPurple[400],
    ),
    ColorModel(
      themeColor: Colors.purple,
      // screenColorLight: Colors.purple.withOpacity(0.3),
      backgroundColorLight: Colors.purple[100],
      appBarColorLight: Colors.purple[800],
      appBarColorDark: Colors.purple[300],
      appBarShadowColorDark: Colors.purple[400],
    ),
    ColorModel(
      themeColor: Colors.pink,
      // screenColorLight: Colors.pink.withOpacity(0.3),
      backgroundColorLight: Colors.pink[100],
      appBarColorLight: Colors.pink[800],
      appBarColorDark: Colors.pink[300],
      appBarShadowColorDark: Colors.pink[400],
    ),
    ColorModel(
      themeColor: Colors.lightBlue,
      // screenColorLight: Colors.lightBlue.withOpacity(0.3),
      backgroundColorLight: Colors.lightBlue[100],
      appBarColorLight: Colors.lightBlue[800],
      appBarColorDark: Colors.lightBlue[300],
      appBarShadowColorDark: Colors.lightBlue[400],
    ),
    ColorModel(
      themeColor: Colors.blue,
      // screenColorLight: Colors.blue.withOpacity(0.3),
      backgroundColorLight: Colors.blue[100],
      appBarColorLight: Colors.blue[800],
      appBarColorDark: Colors.blue[300],
      appBarShadowColorDark: Colors.blue[400],
    ),
    ColorModel(
      themeColor: Colors.cyan,
      // screenColorLight: Colors.cyan.withOpacity(0.3),
      backgroundColorLight: Colors.cyan[100],
      appBarColorLight: Colors.cyan[800],
      appBarColorDark: Colors.cyan[300],
      appBarShadowColorDark: Colors.cyan[400],
    ),
    ColorModel(
      themeColor: Colors.teal,
      // screenColorLight: Colors.teal.withOpacity(0.3),
      backgroundColorLight: Colors.teal[100],
      appBarColorLight: Colors.teal[800],
      appBarColorDark: Colors.teal[300],
      appBarShadowColorDark: Colors.teal[400],
    ),
    ColorModel(
      themeColor: Colors.lime,
      // screenColorLight: Colors.lime.withOpacity(0.3),
      backgroundColorLight: Colors.lime[100],
      appBarColorLight: Colors.lime[800],
      appBarColorDark: Colors.lime[300],
      appBarShadowColorDark: Colors.lime[400],
    ),
    ColorModel(
      themeColor: Colors.yellow,
      // screenColorLight: Colors.yellow.withOpacity(0.3),
      backgroundColorLight: Colors.yellow[100],
      appBarColorLight: Colors.yellow[800],
      appBarColorDark: Colors.yellow[300],
      appBarShadowColorDark: Colors.yellow[400],
    ),
    ColorModel(
      themeColor: Colors.blueGrey,
      // screenColorLight: Colors.blueGrey.withOpacity(0.3),
      backgroundColorLight: Colors.blueGrey[100],
      appBarColorLight: Colors.blueGrey[800],
      appBarColorDark: Colors.blueGrey[300],
      appBarShadowColorDark: Colors.blueGrey[400],
    ),
    ColorModel(
      themeColor: Colors.grey,
      // screenColorLight: Colors.grey.withOpacity(0.3),
      backgroundColorLight: Colors.grey[100],
      appBarColorLight: Colors.grey[800],
      appBarColorDark: Colors.grey[300],
      appBarShadowColorDark: Colors.grey[400],
    ),
    ColorModel(
      themeColor: Colors.brown,
      // screenColorLight: Colors.brown.withOpacity(0.3),
      backgroundColorLight: Colors.brown[100],
      appBarColorLight: Colors.brown[800],
      appBarColorDark: Colors.brown[300],
      appBarShadowColorDark: Colors.brown[400],
    ),
  ];

  final List<DifficultyModel> difficultyList = [
    DifficultyModel(name: 'Any Difficulty', value: 'any'),
    DifficultyModel(name: 'Easy', value: 'easy'),
    DifficultyModel(name: 'Meduim', value: 'meduim'),
    DifficultyModel(name: 'Hard', value: 'hard'),
  ];

  final List<CategoryModel> categoryList = [
    CategoryModel(
      name: 'Any Category',
      id: -1,
    )
  ];

  PageController pageControll = PageController(initialPage: 0);
  ConfigureListMode configuratioList = ConfigureListMode();
  final List<QuestionModel> questionsList = [];
  TextEditingController numOfQuiz = TextEditingController();
  String catgChoose = '';
  String diffChoose = '';

  bool isDarkModeTheme = false;
  int totalScore = 0;
  bool isLoading = false;
  bool inProcess = false;
  double pageHeight = 0;
  int quizPinIndex = 0;

  Color? selectedColor = Colors.orange[900];

  MaterialColor themeColor = Colors.indigo;
  int themeColorIndex = 0;

  Color appBarTextColor = Colors.white;
  Color iconColor = Colors.white;
  Color? appBarShadowColor = Colors.black;
  Color textColor = Colors.black;
  Color? backgroundColor = Colors.indigo[100];
  Color? appBarColor = Colors.indigo[800];
  Color? selectedAnswerColor = Colors.orange[900];
  Color? correctColor = Colors.green[900];
  Color? notCorrectColor = Colors.red[900];

  // Dark Mode
  // Color textColor = Colors.black;
  // Color iconColor = Colors.black;
  // Color appBarShadowColor = Colors.white;
  // Color screenColor = Colors.black.withOpacity(0.9);
  // Color? appBarColor = Colors.indigo[400];
  // Color? appBarColor = Colors.indigo;

  isDarkMode() {
    isDarkModeTheme = true;
    themeColor = themeColorList[themeColorIndex].themeColor;
    appBarTextColor = Colors.black;
    iconColor = Colors.black;
    appBarShadowColor = themeColorList[themeColorIndex].appBarShadowColorDark;
    textColor = Colors.white;
    backgroundColor = Colors.grey[900];
    appBarColor = themeColorList[themeColorIndex].appBarColorDark;

    selectedAnswerColor = Colors.orange[400];
    correctColor = Colors.green[400];
    notCorrectColor = Colors.red[400];
    selectedColor = Colors.orange[400];
    emit(IsDarkModeState());
  }

  isLightMode() {
    isDarkModeTheme = false;
    themeColor = themeColorList[themeColorIndex].themeColor;
    appBarTextColor = Colors.white;
    iconColor = Colors.white;
    appBarShadowColor = Colors.black;
    textColor = Colors.black;
    backgroundColor = themeColorList[themeColorIndex].backgroundColorLight;
    appBarColor = themeColorList[themeColorIndex].appBarColorLight;

    selectedAnswerColor = Colors.orange[900];
    correctColor = Colors.green[900];
    notCorrectColor = Colors.red[900];
    selectedColor = Colors.orange[900];
    emit(IsLightModeState());
  }

  changeThemeColor(int index) {
    themeColorIndex = index;
    emit(ChangeThemeColorState());
  }

  setDifficulty(value) {
    // set difficulty the user choose
    diffChoose = value.value;
  }

  setCategory(value) {
    // set category the user choose
    catgChoose = value.id.toString();
  }

  checkConfigureValues() {
    if (numOfQuiz.text.isEmpty) {
      numOfQuiz.text = '10';
    }
    if (catgChoose == '-1') {
      catgChoose = '';
    }
    if (diffChoose == 'any') {
      diffChoose = '';
    }

    // debugPrint('Amount: ${numOfQuiz.text}');
    // debugPrint('Category: $catgChoose');
    // debugPrint('Difficulty: $diffChoose');
  }

  getCatigories() {
    if (categoryList.length == 1) {
      AppNetworkServices.getData(
        endPoint: categoryEndPoint,
      ).then(
        (value) {
          // debugPrint('Value:    $value');
          for (var item in value['trivia_categories']) {
            categoryList.add(CategoryModel.fromJson(item));
          }
          emit(GetCategoriesSuccessState());
        },
      ).catchError((error) {
        debugPrint('Error: $error');
        emit(GetCategoriesErrorState());
      });
    }
  }

  getQuestions() {
    isLoading = true;
    checkConfigureValues();

    emit(GetQuestionsLoadingState());

    AppNetworkServices.getData(
      endPoint: questionsEndPoint,
      query: {
        amount: numOfQuiz.text,
        difficulty: diffChoose,
        category: catgChoose,
      },
    ).then(
      (value) {
        // debugPrint('Value:    $value');
        if (value['response_code'] == 0) {
          for (int i = 0; i < value['results'].length; i++) {
            var item = value['results'][i];
            questionsList.add(QuestionModel.fromJson(item, i + 1));
          }

          emit(GetQuestionsSuccessState());
        }
      },
    ).catchError((error) {
      debugPrint('Error: $error');
      isLoading = false;
      emit(GetQuestionsErrorState());
    });
  }

  updateScore() {
    totalScore += 5;
    emit(UpdateTotalScoreState());
  }

  getHighestScore() {
    int? highScore = AppLocalServices.getLocalData('score');
    if (highScore == null || highScore < totalScore) {
      highScore = totalScore;
      AppLocalServices.saveLocalData('score', highScore);
    }
    // debugPrint('Score: $highScore');

    return highScore;
  }

  getButtonColor(int index) {
    if (state is ChangeAnswerSelectionState) {
      if (questionsList[getQuestionIndex()].selectedAnswer == index) {
        return selectedAnswerColor;
      }
    }
    if (state is IsCorrectAnswerState) {
      if (questionsList[getQuestionIndex()].answersList[index].isCorrect) {
        return correctColor;
      }
    } else if (state is NotCorrectAnswerState) {
      if (questionsList[getQuestionIndex()].answersList[index].isCorrect) {
        return correctColor;
      }
      if (questionsList[getQuestionIndex()].selectedAnswer == index) {
        return notCorrectColor;
      }
    }

    return appBarColor;
  }

  getQuestionIndex() {
    try {
      return pageControll.page!.round();
    } catch (error) {
      return 0;
    }
  }

  changeAnswerSelection(int index) {
    if (state is! ShowSnackBarMessageState) {
      inProcess = false;
      questionsList[getQuestionIndex()].selectedAnswer = index;
    }

    emit(ChangeAnswerSelectionState());
  }

  checkSelectedAnswer() {
    if (questionsList[getQuestionIndex()].selectedAnswer == -1) {
      if (quizPinIndex <= getQuestionIndex()) {
        noAnswerSelected();
      }
    } else {
      AnswerModel answer = questionsList[getQuestionIndex()]
          .answersList[questionsList[getQuestionIndex()].selectedAnswer];

      if (answer.isCorrect) {
        isCorrectAnswer();
      } else {
        isNotCorrectAnswer();
      }
    }
  }

  showSnackBarMessage() {
    emit(ShowSnackBarMessageState());
    return SnackBarMessageCall.show(
      message: 'Please, select an answer!',
      backgroundColor: textColor.withOpacity(0.9),
      buttonColor: appBarColor,
      textColor: appBarTextColor,
    );
  }

  noAnswerSelected() {
    inProcess = true;

    emit(NoAnswerSelectedState());
  }

  isCorrectAnswer() {
    if (quizPinIndex <= getQuestionIndex()) {
      inProcess = true;
    } else {
      inProcess = false;
    }
    selectedColor = correctColor;
    if (getQuestionIndex() >= quizPinIndex) {
      updateScore();
    }

    emit(IsCorrectAnswerState());
  }

  isNotCorrectAnswer() {
    if (quizPinIndex <= getQuestionIndex()) {
      inProcess = true;
    } else {
      inProcess = false;
    }
    selectedColor = notCorrectColor;

    emit(NotCorrectAnswerState());
  }

  scrollToNextQuestion() {
    if (questionsList[getQuestionIndex()].selectedAnswer != -1) {
      inProcess = true;

      if (getQuestionIndex() == questionsList.length - 1) {
        // navigate to result screen
        emit(IsFinalQuestionState());
      } else {
        pageControll.nextPage(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInQuad,
        );
        emit(ScrollToNextQuestionState());
      }

      Future.delayed(
        const Duration(seconds: 1),
        () {
          selectedColor = selectedAnswerColor;
          inProcess = false;
          emit(InProcessState());
        },
      );
    }
  }

  scrollToPreviousQuestion() {
    if (getQuestionIndex() > quizPinIndex) {
      quizPinIndex = getQuestionIndex();
    }
    pageControll.previousPage(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInQuad,
    );

    emit(ScrollToPreviousQuestionState());
  }

  resetAndCloseQuestions() {
    // when close question screen &&
    //when navigate from result to configure

    isLoading = false;
    inProcess = false;
    quizPinIndex = 0;
    totalScore = 0;

    Future.delayed(const Duration(seconds: 1), () {
      questionsList.removeRange(0, questionsList.length);
    });

    emit(ResetAndCloseQuestionsState());
  }
}
