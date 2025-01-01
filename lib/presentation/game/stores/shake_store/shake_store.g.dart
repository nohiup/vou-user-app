// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shake_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShakeStore on _ShakeStore, Store {
  late final _$stageAtom = Atom(name: '_ShakeStore.stage', context: context);

  @override
  int get stage {
    _$stageAtom.reportRead();
    return super.stage;
  }

  @override
  set stage(int value) {
    _$stageAtom.reportWrite(value, super.stage, () {
      super.stage = value;
    });
  }

  late final _$currentShakeForceAtom =
      Atom(name: '_ShakeStore.currentShakeForce', context: context);

  @override
  double get currentShakeForce {
    _$currentShakeForceAtom.reportRead();
    return super.currentShakeForce;
  }

  @override
  set currentShakeForce(double value) {
    _$currentShakeForceAtom.reportWrite(value, super.currentShakeForce, () {
      super.currentShakeForce = value;
    });
  }

  late final _$isGameStartedAtom =
      Atom(name: '_ShakeStore.isGameStarted', context: context);

  @override
  bool get isGameStarted {
    _$isGameStartedAtom.reportRead();
    return super.isGameStarted;
  }

  @override
  set isGameStarted(bool value) {
    _$isGameStartedAtom.reportWrite(value, super.isGameStarted, () {
      super.isGameStarted = value;
    });
  }

  late final _$playCountAtom =
      Atom(name: '_ShakeStore.playCount', context: context);

  @override
  int get playCount {
    _$playCountAtom.reportRead();
    return super.playCount;
  }

  @override
  set playCount(int value) {
    _$playCountAtom.reportWrite(value, super.playCount, () {
      super.playCount = value;
    });
  }

  late final _$_ShakeStoreActionController =
      ActionController(name: '_ShakeStore', context: context);

  @override
  void startGame() {
    final _$actionInfo = _$_ShakeStoreActionController.startAction(
        name: '_ShakeStore.startGame');
    try {
      return super.startGame();
    } finally {
      _$_ShakeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopGame() {
    final _$actionInfo =
        _$_ShakeStoreActionController.startAction(name: '_ShakeStore.stopGame');
    try {
      return super.stopGame();
    } finally {
      _$_ShakeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetGame() {
    final _$actionInfo = _$_ShakeStoreActionController.startAction(
        name: '_ShakeStore.resetGame');
    try {
      return super.resetGame();
    } finally {
      _$_ShakeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateShakeForce(double shakeForce) {
    final _$actionInfo = _$_ShakeStoreActionController.startAction(
        name: '_ShakeStore.updateShakeForce');
    try {
      return super.updateShakeForce(shakeForce);
    } finally {
      _$_ShakeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stage: ${stage},
currentShakeForce: ${currentShakeForce},
isGameStarted: ${isGameStarted},
playCount: ${playCount}
    ''';
  }
}
