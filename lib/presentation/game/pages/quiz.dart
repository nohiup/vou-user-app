import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vou_user/presentation/game/stores/quiz_store/timer_store.dart';

import '../../../di/service_locator.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Câu hỏi và đáp án
  String question = "What is the capital of France?";
  List<String> options = ["Berlin", "Madrid", "Paris", "Rome"];
  String correctAnswer = "Paris";  // Đáp án đúng

  String selectedAnswer = "";
  final TimerStore timerStore = getIt<TimerStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerStore.startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timerStore.stopTimer();
    super.dispose();

  }

  void checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
    });
    if (answer == correctAnswer) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correct!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Quiz Game"),
      ),
      body: Observer(builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hiển thị câu hỏi
              Text(
                question,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  timerStore.remainingTime.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(height: 40),
              // Các lựa chọn đáp án
              for (var option in options)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    onPressed: () => checkAnswer(option),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: selectedAnswer == option
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                    child: Text(
                      option,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),),
                )

            ],
          ),
        );
      })
    );
  }
}
