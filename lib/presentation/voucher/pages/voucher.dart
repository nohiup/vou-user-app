import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vou_user/di/service_locator.dart';
import 'package:vou_user/presentation/event/stores/event_store.dart';
import 'package:vou_user/presentation/event/widgets/event_tile.dart';
import 'package:vou_user/presentation/voucher/stores/voucher_store.dart';
import 'package:vou_user/presentation/voucher/widgets/voucher_tile.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key});

  @override
  State<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await voucherStore.getVouchers();
    });
  }

  final VoucherStore voucherStore = getIt<VoucherStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return voucherStore.isLoading? _buildProgressIndicator() : _buildMainBody();
    });
  }

  Widget _buildMainBody(){
    return ListView.builder(
        itemCount: voucherStore.vouchers.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final voucher = voucherStore.vouchers[index];
          return VoucherTile(voucher: voucher);
        }
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: LoadingAnimationWidget.twistingDots(
          size: 50,
          leftDotColor: Colors.blue,
          rightDotColor: Colors.green,
        ),
      ),
    );
  }
}
