import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobx/mobx.dart';
import 'package:vou_user/domain/entity/question_model.dart';
import 'package:vou_user/domain/entity/single_question_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'timer_store.g.dart';

class TimerStore = _TimerStore with _$TimerStore;

abstract class _TimerStore with Store {
  // Giữ thời gian còn lại
  @observable
  int remainingTime = 10;

  // Giữ trạng thái timer đang chạy
  @observable
  bool isTimerRunning = false;

  @observable
  QuizQuestion? currentQuestion;

  @observable
  String currentUser = "Current player: 1";

  @observable
  bool isStarted = false;

  @observable
  bool isAnswered = false;

  @observable
  bool isLoading = false;

  @observable
  bool isFinished = false;

  @observable
  int remainingTimeBeforeStart = 30;
  // Khai báo timer
  late Timer _timer;

  WebSocket? webSocket;
  WebSocketChannel? channel;

  // Hàm bắt đầu đồng hồ đếm ngược
  @action
  void startTimer() {
    remainingTime = 5;
    isTimerRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
      } else {

         // Dừng timer khi hết thời gian
      }
    });
  }

  @action
  void startBeforeTime(){
    isTimerRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTimeBeforeStart > 0) {
        remainingTimeBeforeStart--;
        print(remainingTimeBeforeStart);
      }
      else {
        isStarted = true;
      }
    });
  }

  // Hàm dừng timer
  @action
  void stopTimer() {
    _timer.cancel();
    isTimerRunning = false;
  }

  // Hàm reset lại timer
  @action
  void resetTimer() {
    stopTimer();
    startTimer();
  }

  @action
  Future<String> getQuizQuestion() async{
    if (!isStarted) return "";
    else {
      return "";
    }
  }

  @action
  Future<void> wsListening() async {
    if (kIsWeb) {
      channel?.stream.listen(
          (message) {
            if (message.toString().contains("Current")) {
              currentUser = message.toString();
              print(currentUser);
            }
            else {
              currentQuestion = QuizQuestion.fromJson(jsonDecode(message.toString()));
              print(currentQuestion?.questionText);
            }
          }
      );
    } else {
      webSocket?.listen(
              (message) {
            if (message.toString().contains("Current")) {
              currentUser = message.toString();
              print(currentUser);
            }
            else {
              currentQuestion = QuizQuestion.fromJson(jsonDecode(message.toString()));
              print(currentQuestion?.questionText);
            }
          }
      );
    }
  }


  bool isFirstMessage = true;
  @action
  Future<void> connectWebSocket() async{

    final uri = Uri.parse('ws://localhost:8082/quiz');
    try {
      if (kIsWeb) {
        // Sử dụng WebSocketChannel cho Web
        channel = WebSocketChannel.connect(
          Uri.parse('ws://localhost:8082/quiz'),
        );
        channel?.sink.add('UserId001');
        channel?.stream.listen(
                (message) {
                  isLoading = true;
              if (isFirstMessage) {
                if (message.toString() == "Refuse") {
                  isStarted = true;
                  channel?.sink.close();
                  return;
                }
                int startTimeEpoch = int.parse(message);
                int currentTimeEpoch = DateTime.now().millisecondsSinceEpoch~/1000;
                remainingTimeBeforeStart = startTimeEpoch - currentTimeEpoch+3;
                isFirstMessage = false;
                print(remainingTimeBeforeStart);
              }
              else {
                if (message.toString() == "finish") {
                  isFinished = true;
                  isStarted = false;
                  return;
                }
                if (!isStarted) {
                  isStarted = true;
                  resetTimer();
                  isAnswered = false;
                  currentQuestion = QuizQuestion.fromJson(jsonDecode(message.toString()));
                }
                else {
                  resetTimer();
                  isAnswered = false;
                  currentQuestion = QuizQuestion.fromJson(jsonDecode(message.toString()));
                }
              }
              print(currentQuestion?.questionText);
              isLoading = false;
            }
        );
      } else {
        webSocket = await WebSocket.connect(uri.toString());
        print('Connected to WebSocket server: $uri');

        webSocket?.add('UserId001');
      }

    }catch (e) {
      print('Failed to connect: $e');
    }
  }

  @action
  void updateUser(String string){
    currentUser = string;
  }

  void changeAnswered(bool value) {
    isAnswered = value;
  }

  @action
  Future<void> verifyAnswer(String state) async{

    try {
      if (kIsWeb) {
        channel?.sink.add(state);
        if (state == "incorrect"){
          channel?.sink.close();
        }
      } else {
        webSocket?.add(state);
        if (state == "incorrect"){
          webSocket?.close();
        }
      }
    } catch (e) {
      print('Failed to connect: $e');
    }
  }
}