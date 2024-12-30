import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vou_user/presentation/authenticate/pages/authenticate.dart';
import 'package:vou_user/utils/routes/routes.dart';

import '../constant/route_observer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        navigatorObservers: [routeObserver],
        debugShowCheckedModeBanner: false,
        title: "VOU App For User",
        routes: Routes.routes,
        home: const AuthenticateScreen(),
      );
    }
    );
  }
}
