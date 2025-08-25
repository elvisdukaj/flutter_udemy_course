import 'package:flutter/material.dart';
import 'package:adv_basic/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.summary,
    required this.onRestartQuiz,
  });

  final List<Map<String, Object>> summary;
  final void Function() onRestartQuiz;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((summaryData) {
            return SummaryItem(
              questionNumber: summaryData['question_number'] as int,
              question: summaryData['question'] as String,
              correctAnswer: summaryData['correct_answer'] as String,
              userAnswer: summaryData['user_answer'] as String,
              isCorrectAnswer:
                  summaryData['correct_answer'] == summaryData['user_answer'],
              onRestartQuiz: onRestartQuiz,
            );
          }).toList(),
        ),
      ),
    );
  }
}
