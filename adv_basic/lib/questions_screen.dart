import 'package:flutter/material.dart';
import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onAnswer});

  final void Function(String) onAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onAnswer(answer);
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
              style: GoogleFonts.lato(
                color: Color.fromARGB(150, 255, 255, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...questions[currentQuestionIndex].getShuffled().map((answer) {
              return AnswerButton(
                onPressed: () {
                  answerQuestion(answer);
                },
                text: answer,
              );
            }),
          ],
        ),
      ),
    );
  }
}
