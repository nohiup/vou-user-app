
import 'package:vou_user/di/service_locator.dart';
import 'package:vou_user/presentation/authenticate/stores/authenticate_store.dart';
import 'package:vou_user/presentation/authenticate/stores/login_store/login_store.dart';
import 'package:vou_user/presentation/authenticate/stores/register_store/register_store.dart';
import 'package:vou_user/presentation/event/stores/event_store.dart';
import 'package:vou_user/presentation/game/stores/timer_store.dart';
import 'package:vou_user/presentation/profile/stores/profile_store.dart';
import 'package:vou_user/presentation/voucher/stores/voucher_store.dart';

class StoreModule {
  static Future<void> configureStoreModuleInjection() async {
    getIt.registerSingleton<LoginStore>(
      LoginStore()
    );

    getIt.registerSingleton<RegisterStore>(
      RegisterStore()
    );

    getIt.registerSingleton<AuthenticateStore>(
      AuthenticateStore()
    );

    getIt.registerSingleton<EventStore>(
      EventStore()
    );

    getIt.registerSingleton<ProfileStore>(
      ProfileStore()
    );

    getIt.registerSingleton<VoucherStore>(
      VoucherStore()
    );

    getIt.registerSingleton<TimerStore>(
      TimerStore()
    );
  }
}