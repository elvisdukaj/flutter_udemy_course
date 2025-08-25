import 'package:adv_basic/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/start_screen.dart';
import 'package:adv_basic/questions_screen.dart';
import 'package:adv_basic/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  late final List<String> selectedAnswers = [];

  void restartQuiz() {
    selectedAnswers.clear();
    setState(() {
      activeScreen = 'quiz-screen';
    });
  }

  void chooseAnswer(String text) {
    selectedAnswers.add(text);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(restartQuiz);
    if (activeScreen == 'quiz-screen') {
      screenWidget = QuestionsScreen(onAnswer: chooseAnswer);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        answeredQuestions: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
