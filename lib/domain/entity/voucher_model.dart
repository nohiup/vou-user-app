class Voucher{
  final String id;
  final String code;
  final String qrUrl;
  final String imageUrl;
  final String value;
  final String description;
  final DateTime expiredTime;
  final String status;
  final int quantity;

  Voucher({
    required this.quantity,
    required this.id,
    required this.code,
    required this.qrUrl,
    required this.imageUrl,
    required this.value,
    required this.description,
    required this.expiredTime,
    required this.status
  });

}