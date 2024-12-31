import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vou_user/utils/routes/routes.dart'; // Thư viện định dạng thời gian

class EventTile extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int voucherCount;
  final DateTime startTime; // Sửa thành DateTime
  final DateTime endTime;   // Sửa thành DateTime
  final String brandName;
  final String gameName;

  EventTile({
    required this.name,
    required this.imageUrl,
    required this.voucherCount,
    required this.startTime,
    required this.endTime,
    required this.brandName,
    required this.gameName,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy-HH:mm');

    return GestureDetector(
      onTap: (){
        if (gameName == 'HQ Trivia'){
          Navigator.of(context).pushNamed(Routes.quiz);
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
              ),

              child: Center(
                child: Image.network(
                  imageUrl,
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              // child: SvgPicture.network(
              // imageUrl,
              // width: 100,
              // height: 100,
              // fit: BoxFit.cover,
              // )
            ),
            const SizedBox(width: 12.0),
            // Event Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Brand: $brandName',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Vouchers: $voucherCount',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Game: $gameName',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'From: ${dateFormat.format(startTime)}',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    Text(
                      'To: ${dateFormat.format(endTime)}',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
