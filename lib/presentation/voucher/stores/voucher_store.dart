import 'package:mobx/mobx.dart';
import 'package:vou_user/constant/value.dart';
import 'package:vou_user/domain/entity/voucher_model.dart';

import '../../../core/api/rest_client.dart';

part 'voucher_store.g.dart';
class VoucherStore = _VoucherStore with _$VoucherStore;

abstract class _VoucherStore with Store{
  //Observable
  @observable
  List<Voucher> vouchers = [];

  @observable
  bool isLoading = false;

  //Todo: insert user email
  String userEmail = "example@email.com";

  final RestClient rest = RestClient(Value.baseUrl);
  //Action
  @action
  Future<void> getVouchers() async{
    isLoading = true;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': Value.token
    };

    //TODO: REGISTER IMPLEMENT
    var response = await rest.get(
        "/api/userVouchers?email=$userEmail",
        headers: headers);

    if (response == 200) {
      //Todo: Convert response.stream.toString() into List<Vouchers> (can change model attrs)
    }
    else {
      //constant
      vouchers = Value.vouchers;
    }
    isLoading = false;
  }
}