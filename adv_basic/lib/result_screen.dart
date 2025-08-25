import 'package:flutter/material.dart';
import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.answeredQuestions,
    required this.restartQuiz,
  });

  final List<String> answeredQuestions;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < answeredQuestions.length; i++) {
      summary.add({
        'question_number': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': answeredQuestions[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    final numTotalQuestion = answeredQuestions.length;
    final numberOfCorrectQuestions = summary.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "You answered $numberOfCorrectQuestions of $numTotalQuestion questions correctly",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              QuestionSummary(summary: summary, onRestartQuiz: restartQuiz),
              SizedBox(height: 20),

              OutlinedButton(onPressed: restartQuiz, child: Text("test")),
            ],
          ),
        ),
      ),
    );
  }
}
