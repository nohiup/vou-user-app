import 'package:mobx/mobx.dart';

part 'authenticate_store.g.dart';
class AuthenticateStore = _AuthenticateStore with _$AuthenticateStore;

abstract class _AuthenticateStore with Store{

  @observable
  bool isLogin = true;
  @observable
  bool isPasswordShowing = false;
  @observable
  bool isConfirmPwShowing = false;

  @action
  void setToLogin(){
    isLogin = true;
  }

  @action
  void setToRegister(){
    isLogin = false;
  }

  @action
  void setToSpecific(bool value){
    isLogin = value;
  }

  @action
  void toggleLogin(){
    isLogin = !isLogin;
  }

  @action
  void toggleShowPassword(){
    isPasswordShowing = !isPasswordShowing;
  }

  @action
  void toggleShowConfirmPassword(){
    isConfirmPwShowing = !isConfirmPwShowing;
  }
}