import 'package:vou_user/domain/entity/voucher_model.dart';

class TradeItem{
  final int amountOfV;
  final int amountOfO;
  final int amountOfU;

  final int amountOfVoucher;
  final Voucher voucher;

  TradeItem({
    required this.amountOfV,
    required this.amountOfO,
    required this.amountOfU,
    required this.amountOfVoucher,
    required this.voucher});

}