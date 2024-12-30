import 'package:mobx/mobx.dart';

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

  //Main act:-------------------------------------------------------------------
  @action
  Future<bool> login(String email, String password) async{
    isLoading = true;
    errorMessage = null;

    //TODO: LOGIN IMPLEMENT

    isLoading = false;
    //Default true = login
    return true;
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