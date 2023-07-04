import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((item) {
            return Row(children: [
              Text(
                ((item['question-index'] as int) + 1).toString(),
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      item['question'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    const SizedBox(height: 20),
                    Text(item['user-answer'] as String,
                        style: const TextStyle(
                            color: Colors.orange, fontSize: 15)),
                    Text(item['correct-answer'] as String,
                        style: const TextStyle(
                            color: Colors.orange, fontSize: 15)),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
