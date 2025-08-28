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
        Center(
          child: Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Text(
              (questionNumber + 1).toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(width: 10),
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
