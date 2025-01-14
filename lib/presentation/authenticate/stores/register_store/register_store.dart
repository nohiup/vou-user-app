import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:vou_user/constant/value.dart';
import 'package:vou_user/core/api/rest_client.dart';

part 'register_store.g.dart';
class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store{

  //Observable:-----------------------------------------------------------------
  @observable
  bool isLoading = false;

  @observable
  bool isPasswordVisible = false;
  @observable
  bool isConfirmPasswordVisible = false;


  //Error messages
  @observable
  String? errorMessage;
  @observable
  String? emailError;
  @observable
  String? passwordError;
  @observable
  String? confirmError;
  @observable
  String? usernameError;

  late List<ReactionDisposer> _disposers;
  
  final RestClient rest = RestClient(Value.baseUrl);

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
  void setConfirmError(String confirm, String password){
    confirmError = validateConfirmPw(confirm, password);
  }

  @action
  void setUsernameError(String username){
    usernameError = validateUsername(username);
  }

  @action
  void resetError(){
    emailError = null;
    passwordError = null;
    usernameError = null;
    confirmError = null;
  }

  //Main act:-------------------------------------------------------------------
  //Register...
  @action
  Future<bool> register(
      String email, String password, String username) async{
    isLoading = true;
    errorMessage = null;
    var headers = {
      'Content-Type': 'application/json'
    };

    var body = {
      "email": email,
      "password": password,
      "username": username,
      "role" : "user"
    };
    //TODO: REGISTER IMPLEMENT
    var response = await rest.post(
        "/api/auth/register",
        body: body,
        headers: headers);

    if (response.statusCode == 200 ){
      var json = jsonDecode(response.stream.toString());
      Value.userId = json['id'];
      isLoading = false;
      return true;
    } else {
      isLoading = false;
      return false;
    }
  }

  @action
  Future<bool> verify(String email, String otp) async{
    isLoading = true;
    var headers = {
      'Content-Type': 'application/json'
    };

    var body = {
      "email": email,
      "otp": otp,
    };

    var response = await rest.post(
      "/api/auth/verify",
      headers: headers,
      body: body
    );

    if (response.statusCode == 200) {
      isLoading = false;
      return true;
    }
    else {
      isLoading = false;
      return true;
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
    if (password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must include at least one uppercase letter.';
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must include at least one lowercase letter.';
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must include at least one number.';
    }
    return null;
  }

  String? validateConfirmPw(String confirmPassword, String password){
    if (confirmPassword.isEmpty) {
      return "Confirm password can not be empty";
    }
    if (confirmPassword != password) {
      return "Confirm password mismatch ";
    }
    return null;
  }

  String? validateUsername(String username){
    if (username.isEmpty) {
      return "Username can not be empty";
    }
    return null;
  }

  bool isInputValid(){
    return (emailError == null && passwordError == null &&
        confirmError == null && usernameError == null);
  }

}