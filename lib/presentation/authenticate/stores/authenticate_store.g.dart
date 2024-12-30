// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticateStore on _AuthenticateStore, Store {
  late final _$isLoginAtom =
      Atom(name: '_AuthenticateStore.isLogin', context: context);

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  late final _$isPasswordShowingAtom =
      Atom(name: '_AuthenticateStore.isPasswordShowing', context: context);

  @override
  bool get isPasswordShowing {
    _$isPasswordShowingAtom.reportRead();
    return super.isPasswordShowing;
  }

  @override
  set isPasswordShowing(bool value) {
    _$isPasswordShowingAtom.reportWrite(value, super.isPasswordShowing, () {
      super.isPasswordShowing = value;
    });
  }

  late final _$isConfirmPwShowingAtom =
      Atom(name: '_AuthenticateStore.isConfirmPwShowing', context: context);

  @override
  bool get isConfirmPwShowing {
    _$isConfirmPwShowingAtom.reportRead();
    return super.isConfirmPwShowing;
  }

  @override
  set isConfirmPwShowing(bool value) {
    _$isConfirmPwShowingAtom.reportWrite(value, super.isConfirmPwShowing, () {
      super.isConfirmPwShowing = value;
    });
  }

  late final _$_AuthenticateStoreActionController =
      ActionController(name: '_AuthenticateStore', context: context);

  @override
  void setToLogin() {
    final _$actionInfo = _$_AuthenticateStoreActionController.startAction(
        name: '_AuthenticateStore.setToLogin');
    try {
      return super.setToLogin();
    } finally {
      _$_AuthenticateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setToRegister() {
    final _$actionInfo = _$_AuthenticateStoreActionController.startAction(
        name: '_AuthenticateStore.setToRegister');
    try {
      return super.setToRegister();
    } finally {
      _$_AuthenticateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setToSpecific(bool value) {
    final _$actionInfo = _$_AuthenticateStoreActionController.startAction(
        name: '_AuthenticateStore.setToSpecific');
    try {
      return super.setToSpecific(value);
    } finally {
      _$_AuthenticateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleLogin() {
    final _$actionInfo = _$_AuthenticateStoreActionController.startAction(
        name: '_AuthenticateStore.toggleLogin');
    try {
      return super.toggleLogin();
    } finally {
      _$_AuthenticateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowPassword() {
    final _$actionInfo = _$_AuthenticateStoreActionController.startAction(
        name: '_AuthenticateStore.toggleShowPassword');
    try {
      return super.toggleShowPassword();
    } finally {
      _$_AuthenticateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowConfirmPassword() {
    final _$actionInfo = _$_AuthenticateStoreActionController.startAction(
        name: '_AuthenticateStore.toggleShowConfirmPassword');
    try {
      return super.toggleShowConfirmPassword();
    } finally {
      _$_AuthenticateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogin: ${isLogin},
isPasswordShowing: ${isPasswordShowing},
isConfirmPwShowing: ${isConfirmPwShowing}
    ''';
  }
}
