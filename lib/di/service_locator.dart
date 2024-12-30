import 'package:get_it/get_it.dart';
import 'package:vou_user/presentation/di/presentation_layer_injection.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static Future<void> configureDependencies() async {
    // await DataLayerInjection.configureDataLayerInjection();
    // await DomainLayerInjection.configureDomainLayerInjection();
    await PresentationLayerInjection.configurePresentationLayerInjection();
  }
}