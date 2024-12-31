// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VoucherStore on _VoucherStore, Store {
  late final _$vouchersAtom =
      Atom(name: '_VoucherStore.vouchers', context: context);

  @override
  List<Voucher> get vouchers {
    _$vouchersAtom.reportRead();
    return super.vouchers;
  }

  @override
  set vouchers(List<Voucher> value) {
    _$vouchersAtom.reportWrite(value, super.vouchers, () {
      super.vouchers = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_VoucherStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getVouchersAsyncAction =
      AsyncAction('_VoucherStore.getVouchers', context: context);

  @override
  Future<void> getVouchers() {
    return _$getVouchersAsyncAction.run(() => super.getVouchers());
  }

  @override
  String toString() {
    return '''
vouchers: ${vouchers},
isLoading: ${isLoading}
    ''';
  }
}
