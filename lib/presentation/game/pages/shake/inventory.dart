import 'package:flutter/material.dart';
import 'package:vou_user/constant/value.dart';
import 'package:vou_user/domain/entity/inventory_item.dart';
import 'package:vou_user/domain/entity/trade_item.dart';
import 'package:vou_user/presentation/game/widgets/inventory_widget.dart';

class ShakeInventoryPage extends StatefulWidget {
  const ShakeInventoryPage({super.key});

  @override
  State<ShakeInventoryPage> createState() => _ShakeInventoryPageState();
}

class _ShakeInventoryPageState extends State<ShakeInventoryPage> {
  final List<InventoryItem> inventoryItems = [
    InventoryItem('V', 5),
    InventoryItem('O', 4),
    InventoryItem('U', 6),
  ];

  final List<TradeItem> tradeItems = [
    TradeItem(voucher: Value.vouchers[0], amountOfV: 10, amountOfO: 2, amountOfU: 3, amountOfVoucher: 5),
    TradeItem(voucher: Value.vouchers[1], amountOfV: 2, amountOfO: 3, amountOfU: 1, amountOfVoucher: 4),
    TradeItem(voucher: Value.vouchers[2], amountOfV: 3, amountOfO: 1, amountOfU: 2, amountOfVoucher: 6),
    TradeItem(voucher: Value.vouchers[3], amountOfV: 1, amountOfO: 1, amountOfU: 1, amountOfVoucher: 2),
    TradeItem(voucher: Value.vouchers[4], amountOfV: 2, amountOfO: 2, amountOfU: 2, amountOfVoucher: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InventoryWidget(items: inventoryItems, trades: tradeItems),
      ),
    );
  }
}
