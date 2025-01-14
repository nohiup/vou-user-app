import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vou_user/constant/vertical_spacing.dart';
import 'package:vou_user/di/service_locator.dart';
import 'package:vou_user/presentation/authenticate/stores/authenticate_store.dart';
import 'package:vou_user/presentation/authenticate/stores/login_store/login_store.dart';
import 'package:vou_user/presentation/authenticate/stores/register_store/register_store.dart';
import 'package:vou_user/utils/routes/routes.dart';


class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({super.key});

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final LoginStore loginStore = getIt<LoginStore>();
  final RegisterStore registerStore = getIt<RegisterStore>();
  final AuthenticateStore authenticateStore = getIt<AuthenticateStore>();

  @override
  Widget build(BuildContext context) {

    return Observer(
      builder: (context){
        return Stack(
          children: [
            Scaffold(
              appBar: _buildAppBar(),
              body: _buildBody(),
            ),
            if (loginStore.isLoading || registerStore.isLoading)
              Positioned.fill(child: _buildProgressIndicator()),
          ],
        );
      },
    );
  }

  //Build components:-----------------------------------------------------------
  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Center(
          child: Text('VOU User App')
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 70),
            _buildToggleButton(),
            const SizedBox(height: 20),
            authenticateStore.isLogin ? _buildLoginView() : _buildRegisterView(),
          ],
        ),
      ),
    );
  }

  //Build items:----------------------------------------------------------------
  Widget _buildProgressIndicator() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: LoadingAnimationWidget.twistingDots(
          size: 50,
          leftDotColor: Colors.blue,
          rightDotColor: Colors.green,
        ),
      ),
    );
  }

  Widget _buildToggleButton() {
    return LayoutBuilder(
        builder: (context, constraints) => ToggleButtons(
              constraints: BoxConstraints.expand(
                  width: (constraints.maxWidth - 16) / 2, height: 40),
              fillColor: Colors.green,
              color: Colors.blue,
              selectedColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              isSelected: [authenticateStore.isLogin, !authenticateStore.isLogin],
              onPressed: (index) {
                setState(() {
                  authenticateStore.setToSpecific((index == 0));
                  resetTextFieldValue();
                });
              },
              children: <Widget>[
                _buildToggleText('Login', authenticateStore.isLogin),
                _buildToggleText('Register', !authenticateStore.isLogin),
              ],
            ));
  }

  Widget _buildToggleText(String text, bool selected) {
    return Text(text, style: Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: 15,
      color: selected ? Colors.white : Colors.blue,
    ));
  }

  Widget _buildLoginView() {
    return Column(
      children: [
        _buildTextFieldView('Email', 'Enter your email address',
            loginStore.emailError, _emailController, false),
        const SizedBox(height: 15),
        _buildPasswordTypeField(
          'Password',
          'Enter your password',
          loginStore.passwordError,
          _passwordController,
          authenticateStore.isPasswordShowing,
          setStatePassword,
        ),
        VSpacing.sm,
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: forgotPasswordPress,
            child: Text(
              'Forgot password',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 15,
                    color: Colors.lightBlueAccent,
                  ),
            ),
          ),
        ),
        VSpacing.sm,
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: loginValidateSubmit,
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              child: Center(
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account? ',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 15,
                  ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    authenticateStore.setToRegister();
                    resetTextFieldValue();
                  });
                },
                child: Text(
                  'Register',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 15, color: Colors.lightBlueAccent),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildRegisterView() {
    return Column(
      children: <Widget>[
        _buildTextFieldView('Email', 'Enter your email address',
            registerStore.emailError, _emailController, false),
        const SizedBox(height: 15),
        _buildTextFieldView('Username', 'Enter your username',
            registerStore.usernameError, _usernameController, false),
        const SizedBox(height: 15),
        _buildPasswordTypeField(
          'Password',
          'Enter your password',
          registerStore.passwordError,
          _passwordController,
          authenticateStore.isPasswordShowing,
          setStatePassword,
        ),
        const SizedBox(height: 15),
        _buildPasswordTypeField(
          'Confirm password',
          'Re-enter your password',
          registerStore.confirmError,
          _confirmPwController,
          authenticateStore.isConfirmPwShowing,
          setStateConfirmPw,
        ),
        const SizedBox(height: 15),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: registerValidateSubmit,
            child: Ink(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Register',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        VSpacing.md,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have account? ',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 15,
                  ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    authenticateStore.setToLogin();
                    resetTextFieldValue();
                  });
                },
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.lightBlueAccent,
                        fontSize: 15,
                      ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildTextFieldView(String label, String hint, String? error,
      TextEditingController controller, bool isPasswordType) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        errorText: error,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.brown.withOpacity(0.7),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.brown.withOpacity(0.7),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.lightBlueAccent,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPasswordTypeField(String label, String hint, String? error,
      TextEditingController controller, bool isShowing, VoidCallback callback) {
    return TextField(
      controller: controller,
      obscureText: !isShowing,
      cursorColor: Colors.brown,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.brown.withOpacity(0.7),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
        hintText: hint,
        errorText: error,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.brown.withOpacity(0.7),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.lightBlueAccent,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isShowing ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: callback,
        ),
      ),
    );
  }

  //Other methods:--------------------------------------------------------------
  void forgotPasswordPress() {}

  void setStatePassword() {
    authenticateStore.toggleShowPassword();
  }

  void setStateConfirmPw() {
    authenticateStore.toggleShowConfirmPassword();
  }

  void loginValidateSubmit() async {
    loginStore.setEmailError(_emailController.text);
    loginStore.setPasswordError(_passwordController.text);

    if (loginStore.isInputValid()) {
      print('OK');
      //Call login API
      bool isLogged = await loginStore.login(
          _emailController.text, _passwordController.text);
      if (isLogged) {
        print('Success');
        if (mounted){
          Navigator.pushReplacementNamed(context, Routes.home);
        }
      }
    } else {
      print('Failed');
    }
  }

  void registerValidateSubmit() async {
    registerStore.setEmailError(_emailController.text);
    registerStore.setPasswordError(_passwordController.text);
    registerStore.setConfirmError(
        _confirmPwController.text, _passwordController.text);
    registerStore.setUsernameError(_usernameController.text);

    if (registerStore.isInputValid()) {
      String email = _emailController.text;
      //call API register
      bool isRegistered = await registerStore.register(
          _emailController.text,
          _passwordController.text,
          _usernameController.text);
      if (isRegistered) {
        print('Logging in');
        if (mounted){
          showDialog(context: context, builder: (_){
            TextEditingController otpController = TextEditingController();
            return AlertDialog(
              title: const Text("Enter OTP sent"),
              content: TextFormField(
                controller: otpController,
              ),
              actions: [
                TextButton(onPressed: () async{
                  String otp = otpController.text;
                  bool isCorrect = await registerStore.verify(email, otp);
                  if (isCorrect) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Verify successfully"),
                        duration: Duration(seconds: 2),)
                    );
                    }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Verify failed, please try again"),
                          duration: Duration(seconds: 2),)
                    );
                  }
                  Navigator.of(context).pop();
                  }, child: const Text("OK")),
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: const Text("Cancel"))
              ],
            );
          });
          // Navigator.pushReplacementNamed(context, Routes.home);
        }
      }
    } else {
      print('Failed register');
    }
  }

  void resetTextFieldValue() {
    registerStore.resetError();
    loginStore.resetError();

    _emailController.text = '';
    _passwordController.text = '';
    _confirmPwController.text = '';
    _usernameController.text = '';
  }
}
