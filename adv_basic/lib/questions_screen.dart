import 'package:adv_basic/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            Text(
              questions[currentQuestionIndex].question,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...questions[currentQuestionIndex].getShuffled().map((item) {
              return AnswerButton(onPressed: answerQuestion, text: item);
            }),
          ],
        ),
      ),
    );
  }
}
