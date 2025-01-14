import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:vou_user/domain/entity/single_question_model.dart';
import 'package:vou_user/presentation/game/stores/quiz_store/timer_store.dart';

import '../../../di/service_locator.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Câu hỏi và đáp án
 // Đáp án đúng

  String selectedAnswer = "";
  final TimerStore timerStore = getIt<TimerStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerStore.startBeforeTime();
    reaction((_) => timerStore.isFinished,  // Lắng nghe giá trị của isFinished
          (isFinished) {
        // Nếu isFinished thay đổi thành true, thực hiện hành động
        if (isFinished) {
          // Chỉ thực hiện showDialog khi isFinished là true
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text("Winner!!!"),
                  content: Text(
                      "Congratulations! You've won a voucher from the event. Voucher is added into your account. Check out in Voucher tab."
                  ),
                    actions: [
                    TextButton(
                    onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"),
                ),
                ]
                );
              },
            ).then((_) {
              // Đảm bảo các hành động tiếp theo được thực hiện sau khi dialog đóng
              timerStore.channel?.sink.close();
              Navigator.of(context).pop();
            });
          });
        }
      },
    );
    // SchedulerBinding.instance.addPostFrameCallback((_) async {
    //   timerStore.connectWebSocket();
    // });
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

    timerStore.isAnswered = true;
    if (answer == timerStore.currentQuestion?.correctAnswer) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correct!')),
      );
      timerStore.verifyAnswer('correct');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong! You are eliminated')),
      );
      timerStore.verifyAnswer('incorrect');
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timerStore.isFinished) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(context: context, builder: (_){
          return const AlertDialog(
            title: Text("Winner!!!"),
            content: Text(
                "Congratulations! You've won a voucher from the event. Voucher is added into your account. Check out in Voucher tab."
            ),
          );
        });
        timerStore.channel?.sink.close();
        Navigator.of(context).pop();
      });
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Quiz Game"),
      ),
        body: Observer(
            builder: (_) {
              if (timerStore.isStarted){
                if (timerStore.remainingTime <= 1 && timerStore.isAnswered == false) {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(content: Text('Wrong! You are eliminated')),
                  // );
                  timerStore.verifyAnswer('incorrect');
                  timerStore.channel?.sink.close();
                  Navigator.of(context).pop();
                }
              }

          return timerStore.isStarted?
            Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Hiển thị câu hỏi
                Text(
                  timerStore.currentQuestion!.questionText,
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
                for (var option in options(timerStore.currentQuestion))
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
          ) : Observer(builder: (_) {
            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Game will start in: ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(timerStore.remainingTimeBeforeStart.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ]
                )
            );
          });

      })
    );
  }

  List<String> options(QuizQuestion? current){
    return current == null ? [] : [
      current.optionA,
      current.optionB,
      current.optionC,
      current.optionD
    ];
  }
}
