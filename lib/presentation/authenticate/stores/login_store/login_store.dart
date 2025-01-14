import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:vou_user/constant/value.dart';
import 'package:vou_user/core/api/rest_client.dart';

part 'login_store.g.dart';
class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{

  //Observable:-----------------------------------------------------------------
  @observable
  bool isLoading = false;
  @observable
  bool isPasswordVisible = false;

  //Error messages
  @observable
  String? errorMessage;
  @observable
  String? emailError;
  @observable
  String? passwordError;

  late List<ReactionDisposer> _disposers;

  //Actions:--------------------------------------------------------------------
  @action
  void togglePasswordVisibility(){
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  void resetSettingForLogin() {
    isPasswordVisible = false;
  }

  @action
  void setEmailError(String email){
    emailError = validateEmail(email);
  }

  @action
  void setPasswordError(String password){
    passwordError = validatePassword(password);
  }

  @action
  void resetError(){
    emailError = null;
    passwordError = null;
  }


  final RestClient rest = RestClient(Value.baseUrl);
  //Main act:-------------------------------------------------------------------
  @action
  Future<bool> login(String email, String password) async{
    isLoading = true;
    errorMessage = null;

    //TODO: LOGIN IMPLEMENT
    var headers = {
      'Content-Type': 'application/json'
    };

    var body = {
      "email": email,
      "password": password,
    };
    //TODO: REGISTER IMPLEMENT
    var response = await rest.post(
        "/api/auth/login",
        body: body,
        headers: headers);

    if (response.statusCode == 200 ){
      isLoading = false;
      var data = jsonDecode(await response.stream.bytesToString());
      Value.token = data['token'];
      print(Value.token);
      return true;

    } else {
      isLoading = false;
      return false;
    }
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  String? validateEmail(String email){
    if (email.isEmpty) {
      return "Email can not be empty";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(email)) {
      return "Email type invalid";
    }
    return null;
  }

  String? validatePassword(String password){
    if (password.isEmpty) {
      return "Password can not be empty";
    }
    return null;
  }

  bool isInputValid(){
    return (emailError == null && passwordError == null);
  }

}