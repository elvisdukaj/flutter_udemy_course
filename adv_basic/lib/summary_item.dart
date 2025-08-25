import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.questionNumber,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
    required this.isCorrectAnswer,
    required this.onRestartQuiz,
  });

  final int questionNumber;
  final String question;
  final String correctAnswer;
  final String userAnswer;
  final bool isCorrectAnswer;
  final void Function() onRestartQuiz;

  @override
  Widget build(BuildContext context) {
    final Color correctColor = Colors.green;
    final Color wrongColor = Colors.red;
    final Color color = isCorrectAnswer ? correctColor : wrongColor;

    return Row(
      children: [
        Text((questionNumber + 1).toString()),
        SizedBox(width: 20),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              Text(userAnswer),
              Text(correctAnswer, style: TextStyle(color: color)),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
