import 'package:flutter/material.dart';
import 'package:vou_user/presentation/authenticate/pages/authenticate.dart';
import 'package:vou_user/presentation/event/pages/event.dart';
import 'package:vou_user/presentation/game/pages/quiz.dart';
import 'package:vou_user/presentation/shared/pages/home/home.dart';

import '../../presentation/profile/pages/profile.dart';

class Routes{
  Routes._();

  //Static routes:
  // static const String splash = '/splash';
  static const String authenticate = '/authenticate';

  static const String home = '/home';
  static const String event = '/event';
  static const String profile = '/profile';
  static const String quiz = '/quiz';


  //Page Builders
  static final routes = <String, WidgetBuilder>{
    authenticate: (BuildContext context) => const AuthenticateScreen(),
    event: (BuildContext context) => const EventPage(),
    home: (BuildContext context) => const HomePage(),
    profile: (BuildContext context) => const ProfilePage(),
    quiz: (BuildContext context) => const QuizPage(),
  };
}
