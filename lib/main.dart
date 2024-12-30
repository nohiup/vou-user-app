import "package:flutter/material.dart";
import "package:vou_user/presentation/my_app.dart";

import "di/service_locator.dart";

Future<void> main() async{
  await ServiceLocator.configureDependencies();
  runApp(const MyApp());
}
