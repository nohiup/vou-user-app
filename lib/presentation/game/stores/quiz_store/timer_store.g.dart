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
  String toString() {
    return '''
remainingTime: ${remainingTime},
isTimerRunning: ${isTimerRunning}
    ''';
  }
}
