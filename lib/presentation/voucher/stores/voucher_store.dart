import 'package:mobx/mobx.dart';
import 'package:vou_user/constant/value.dart';
import 'package:vou_user/domain/entity/voucher_model.dart';

part 'voucher_store.g.dart';
class VoucherStore = _VoucherStore with _$VoucherStore;

abstract class _VoucherStore with Store{
  //Observable
  @observable
  List<Voucher> vouchers = [];

  @observable
  bool isLoading = false;

  //Action
  @action
  Future<void> getVouchers() async{
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));

    vouchers = Value.vouchers;

    isLoading = false;
  }
}