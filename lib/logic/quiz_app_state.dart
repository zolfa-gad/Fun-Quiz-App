part of 'quiz_app_cubit.dart';

abstract class QuizAppStates {}

class QuizAppInitialState extends QuizAppStates {}

class IsDarkModeState extends QuizAppStates {}

class IsLightModeState extends QuizAppStates {}

class ChangeThemeColorState extends QuizAppStates {}

class GetCategoriesSuccessState extends QuizAppStates {}

class GetCategoriesErrorState extends QuizAppStates {}

class GetQuestionsLoadingState extends QuizAppStates {}

class GetQuestionsErrorState extends QuizAppStates {}

class GetQuestionsSuccessState extends QuizAppStates {}

class UpdateTotalScoreState extends QuizAppStates {}

class ChangeAnswerSelectionState extends QuizAppStates {}

class IsCorrectAnswerState extends QuizAppStates {}

class NotCorrectAnswerState extends QuizAppStates {}

class NoAnswerSelectedState extends QuizAppStates {}

class ShowSnackBarMessageState extends QuizAppStates {}

class ResetAndCloseQuestionsState extends QuizAppStates {}

class IsFinalQuestionState extends QuizAppStates {}

class ScrollToNextQuestionState extends QuizAppStates {}

class ScrollToPreviousQuestionState extends QuizAppStates {}

class InProcessState extends QuizAppStates {}
