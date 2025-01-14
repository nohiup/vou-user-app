class Event{
  final String id;
  final String name;
  final String? imgUrl;
  final int voucherCount;
  final DateTime startTime, endTime;
  final String gameName;
  final String? brandName;

  Event({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.voucherCount,
    required this.startTime,
    required this.endTime,
    required this.gameName,
    required this.brandName
  });

  //FromJson...

}