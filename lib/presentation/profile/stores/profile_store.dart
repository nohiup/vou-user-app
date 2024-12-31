import 'package:mobx/mobx.dart';
import 'package:vou_user/constant/value.dart';
import 'package:vou_user/domain/entity/profile_model.dart';

part 'profile_store.g.dart';
class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store{
  //Observable
  @observable
  Profile profile = Value.nullProfile;

  @observable
  bool isLoading = false;

  //Action
  @action
  Future<void> getProfile() async{
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));

    profile = Value.sampleProfile;

    isLoading = false;
  }
}