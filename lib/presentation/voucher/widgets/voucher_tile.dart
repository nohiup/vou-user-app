import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vou_user/domain/entity/voucher_model.dart';
import 'package:vou_user/presentation/voucher/pages/image.dart';

class VoucherTile extends StatelessWidget {
  final Voucher voucher; // E.g., "Valid", "Expired", "Used"

  const VoucherTile({
    super.key,
    required this.voucher
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final statusColor = voucher.status == "Valid"
        ? Colors.green
        : voucher.status == "Expired"
        ? Colors.red
        : Colors.orange;

    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return _buildActionDialog(context);
            }
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  voucher.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Code: ${voucher.code}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Value: \$${voucher.value}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      voucher.description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Hết hạn: ${dateFormat.format(voucher.expiredTime)}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      voucher.status,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AlertDialog _buildActionDialog(BuildContext context){
    return AlertDialog(
      title: const Text('Choose an Action'),
      content: const Text('Select one of the following options:'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ImageViewer(imageUrl: voucher.qrUrl),
                )
            );
            // Close dialog
          },
          child: const Text('Show QRCode'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Used voucher ${voucher.code}"),
                duration: const Duration(seconds: 1), // Thời gian hiển thị
                behavior: SnackBarBehavior.floating, // Đặt vị trí hiển thị
                margin: const EdgeInsets.only(bottom: 0, left: 20, right: 20), // Vị trí phía dưới
                backgroundColor: Colors.black.withOpacity(0.7), // Màu nền
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Bo góc
                ),
                action: SnackBarAction(
                  label: 'Đóng',
                  onPressed: () {
                    // Xử lý khi nhấn vào hành động, ví dụ đóng thông báo
                  },
                ),
              ),
            );
          },
          child: const Text('Use Voucher'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog
            print("Cancel selected");
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
