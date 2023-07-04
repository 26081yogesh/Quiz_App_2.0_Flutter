import 'package:flutter/material.dart';
import 'package:quizzy/Utilities/constants.dart';
import 'package:quizzy/data/questions.dart';
import 'package:quizzy/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.selectedAnswer, required this.switchScreen});

  final List<String>? selectedAnswer;
  final void Function() switchScreen;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswer!.length; i++) {
      summary.add({
        'question-index': i,
        'question': questions[i].text,
        'correct-answer': questions[i].answers[0],
        'user-answer': selectedAnswer![i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List summary = getSummaryData();

    final int totalQuestions = questions.length;
    final int correctQuestions = summary.where((data) {
      return data['user-answer'] == data['correct-answer'];
    }).length;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered $correctQuestions out of $totalQuestions questions correctly!",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 50),
          QuestionSummary(getSummaryData()),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: switchScreen,
            style: kButtonStyles,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_right_alt),
                SizedBox(width: 10),
                Text(
                  "ReStart Quiz",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
