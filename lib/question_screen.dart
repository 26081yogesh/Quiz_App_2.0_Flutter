import 'package:flutter/material.dart';
import 'package:quizzy/answer_button.dart';
import 'package:quizzy/Utilities/constants.dart';
import 'package:quizzy/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.chooseAnswer, {super.key});
  final void Function(String answer) chooseAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.chooseAnswer(selectedAnswer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: kQuestionsTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ...currentQuestion.getShuffledAnswer().map((item) {
              return AnswerButton(item, () {
                answerQuestion(item);
              });
            })
          ],
        ),
      ),
    );
  }
}
