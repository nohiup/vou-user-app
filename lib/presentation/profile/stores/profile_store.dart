import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:vou_user/constant/value.dart';
import 'package:vou_user/domain/entity/profile_model.dart';

import '../../../core/api/rest_client.dart';

part 'profile_store.g.dart';
class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store{
  //Observable
  @observable
  Profile profile = Value.nullProfile;

  @observable
  bool isLoading = false;

  final RestClient rest = RestClient(Value.baseUrl);
  //Action
  @action
  Future<void> getProfile() async{
    isLoading = true;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Value.token}'
    };

    var body = {
      "role": "user",
    };

    var response = await rest.getWithBody(
        "/api/users/${Value.userId}/profile",
        body: body,
        headers: headers);
    print("${response.statusCode}: ${Value.token}");
    if (response.statusCode == 200 ){
      String res = await response.stream.bytesToString();

      print(res);
      Profile fetched = Profile.fromJson(jsonDecode(res));
      if (fetched.name == null) {
        profile = Value.nullProfile;
      }
      else {
        profile = fetched;
      }

      isLoading = false;
      return;

    } else {
      profile = Value.nullProfile;
      isLoading = false;
      return;
    }
  }

  @action
  Future<void> updateProfile(Profile newProfile) async{
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': Value.token
    };

    //TODO: update user body insert here. (idk what params to ins). User newProfile
    var body = {
      "role": "user", //Temporary text holder
    };
    var response = await rest.put(
        "/api/users/${Value.userId}/profile",
        body: body,
        headers: headers);

    if (response.statusCode == 200 ){
      isLoading = false;
      profile = newProfile;
      //TODO: Check response if necessary
      return;

    } else {
      profile = Value.nullProfile;
      isLoading = false;
      return;
    }
  }
}