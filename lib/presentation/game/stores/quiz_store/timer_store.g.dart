// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimerStore on _TimerStore, Store {
  late final _$remainingTimeAtom =
      Atom(name: '_TimerStore.remainingTime', context: context);

  @override
  int get remainingTime {
    _$remainingTimeAtom.reportRead();
    return super.remainingTime;
  }

  @override
  set remainingTime(int value) {
    _$remainingTimeAtom.reportWrite(value, super.remainingTime, () {
      super.remainingTime = value;
    });
  }

  late final _$isTimerRunningAtom =
      Atom(name: '_TimerStore.isTimerRunning', context: context);

  @override
  bool get isTimerRunning {
    _$isTimerRunningAtom.reportRead();
    return super.isTimerRunning;
  }

  @override
  set isTimerRunning(bool value) {
    _$isTimerRunningAtom.reportWrite(value, super.isTimerRunning, () {
      super.isTimerRunning = value;
    });
  }

  late final _$currentQuestionAtom =
      Atom(name: '_TimerStore.currentQuestion', context: context);

  @override
  QuizQuestion? get currentQuestion {
    _$currentQuestionAtom.reportRead();
    return super.currentQuestion;
  }

  @override
  set currentQuestion(QuizQuestion? value) {
    _$currentQuestionAtom.reportWrite(value, super.currentQuestion, () {
      super.currentQuestion = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: '_TimerStore.currentUser', context: context);

  @override
  String get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(String value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$isStartedAtom =
      Atom(name: '_TimerStore.isStarted', context: context);

  @override
  bool get isStarted {
    _$isStartedAtom.reportRead();
    return super.isStarted;
  }

  @override
  set isStarted(bool value) {
    _$isStartedAtom.reportWrite(value, super.isStarted, () {
      super.isStarted = value;
    });
  }

  late final _$isAnsweredAtom =
      Atom(name: '_TimerStore.isAnswered', context: context);

  @override
  bool get isAnswered {
    _$isAnsweredAtom.reportRead();
    return super.isAnswered;
  }

  @override
  set isAnswered(bool value) {
    _$isAnsweredAtom.reportWrite(value, super.isAnswered, () {
      super.isAnswered = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TimerStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isFinishedAtom =
      Atom(name: '_TimerStore.isFinished', context: context);

  @override
  bool get isFinished {
    _$isFinishedAtom.reportRead();
    return super.isFinished;
  }

  @override
  set isFinished(bool value) {
    _$isFinishedAtom.reportWrite(value, super.isFinished, () {
      super.isFinished = value;
    });
  }

  late final _$remainingTimeBeforeStartAtom =
      Atom(name: '_TimerStore.remainingTimeBeforeStart', context: context);

  @override
  int get remainingTimeBeforeStart {
    _$remainingTimeBeforeStartAtom.reportRead();
    return super.remainingTimeBeforeStart;
  }

  @override
  set remainingTimeBeforeStart(int value) {
    _$remainingTimeBeforeStartAtom
        .reportWrite(value, super.remainingTimeBeforeStart, () {
      super.remainingTimeBeforeStart = value;
    });
  }

  late final _$getQuizQuestionAsyncAction =
      AsyncAction('_TimerStore.getQuizQuestion', context: context);

  @override
  Future<String> getQuizQuestion() {
    return _$getQuizQuestionAsyncAction.run(() => super.getQuizQuestion());
  }

  late final _$wsListeningAsyncAction =
      AsyncAction('_TimerStore.wsListening', context: context);

  @override
  Future<void> wsListening() {
    return _$wsListeningAsyncAction.run(() => super.wsListening());
  }

  late final _$connectWebSocketAsyncAction =
      AsyncAction('_TimerStore.connectWebSocket', context: context);

  @override
  Future<void> connectWebSocket() {
    return _$connectWebSocketAsyncAction.run(() => super.connectWebSocket());
  }

  late final _$verifyAnswerAsyncAction =
      AsyncAction('_TimerStore.verifyAnswer', context: context);

  @override
  Future<void> verifyAnswer(String state) {
    return _$verifyAnswerAsyncAction.run(() => super.verifyAnswer(state));
  }

  late final _$_TimerStoreActionController =
      ActionController(name: '_TimerStore', context: context);

  @override
  void startTimer() {
    final _$actionInfo = _$_TimerStoreActionController.startAction(
        name: '_TimerStore.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startBeforeTime() {
    final _$actionInfo = _$_TimerStoreActionController.startAction(
        name: '_TimerStore.startBeforeTime');
    try {
      return super.startBeforeTime();
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopTimer() {
    final _$actionInfo = _$_TimerStoreActionController.startAction(
        name: '_TimerStore.stopTimer');
    try {
      return super.stopTimer();
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetTimer() {
    final _$actionInfo = _$_TimerStoreActionController.startAction(
        name: '_TimerStore.resetTimer');
    try {
      return super.resetTimer();
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateUser(String string) {
    final _$actionInfo = _$_TimerStoreActionController.startAction(
        name: '_TimerStore.updateUser');
    try {
      return super.updateUser(string);
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
remainingTime: ${remainingTime},
isTimerRunning: ${isTimerRunning},
currentQuestion: ${currentQuestion},
currentUser: ${currentUser},
isStarted: ${isStarted},
isAnswered: ${isAnswered},
isLoading: ${isLoading},
isFinished: ${isFinished},
remainingTimeBeforeStart: ${remainingTimeBeforeStart}
    ''';
  }
}
