import 'package:vou_user/domain/entity/event_model.dart';
import 'package:vou_user/domain/entity/profile_model.dart';
import 'package:vou_user/domain/entity/question_model.dart';
import 'package:vou_user/domain/entity/voucher_model.dart';

class Value{
  Value._();

  //Shared link:
  static String qrCodeShort = "https://i.ibb.co/r4F2RLX/qrcode-154858793-639eeaca52e09ec993d46bfcbc7d7bf2.png";
  // static String qrCodeShort = "https://ibb.co/72jtdT0";

  static List<Event> events = [
    //Generated
    Event(
      name: "Black Friday Sale",
      gameName: "HQ Trivia",
      imgUrl: "https://placehold.co/400x400/png",
      voucherCount: 50,
      startTime: DateTime(2024, 12, 1, 9, 0),
      endTime: DateTime(2024, 12, 2, 23, 59),
      brandName: "TechWorld",
    ),
    Event(
      name: "Christmas Special",
      gameName: "HQ Trivia",
      imgUrl: "https://placehold.co/400x400/png",
      voucherCount: 30,
      startTime: DateTime(2024, 12, 20, 10, 0),
      endTime: DateTime(2024, 12, 25, 20, 0),
      brandName: "Holiday Shop",
    ),
    Event(
      name: "New Year Bonanza",
      gameName: "Trade",
      imgUrl: "https://placehold.co/400x400/png",
      voucherCount: 100,
      startTime: DateTime(2024, 12, 31, 18, 0),
      endTime: DateTime(2025, 1, 1, 23, 59),
      brandName: "Yearly Deals",
    ),
    Event(
      name: "Valentine's Day Offer",
      gameName: "Trade",
      imgUrl: "https://placehold.co/400x400/png",
      voucherCount: 20,
      startTime: DateTime(2025, 2, 10, 8, 0),
      endTime: DateTime(2025, 2, 14, 22, 0),
      brandName: "LoveMart",
    ),
    Event(
      name: "Summer Festival",
      gameName: "Trade",
      imgUrl: "https://placehold.co/400x400/png",
      voucherCount: 75,
      startTime: DateTime(2025, 6, 1, 12, 0),
      endTime: DateTime(2025, 6, 30, 23, 59),
      brandName: "FunFair",
    ),
  ];

  static List<Question> questions = [
    Question(
        content: "What is the capital of France?",
        answers: ["Berlin", "Madrid", "Paris", "Rome"],
        correctAnswer: "Paris"
    ),
    Question(
        content: "Which planet is known as the Red Planet?",
        answers: ["Earth", "Mars", "Jupiter", "Saturn"],
        correctAnswer: "Mars"
    ),
    Question(
        content: "What is the largest mammal on Earth?",
        answers: ["Elephant", "Blue Whale", "Shark", "Giraffe"],
        correctAnswer: "Blue Whale"
    ),
  ];

  static Profile sampleProfile = Profile(
    id: '123',
    username: 'johndoe',
    avatarUrl: 'https://placehold.co/400x400/png',
    email: 'johndoe@example.com',
    phone: '1234567890',
    isMale: true,
    facebookUrl: "https://www.facebook.com/",
    birthday: DateTime(2017, 9, 7),
  );

  static Profile nullProfile = Profile(
    id: '00',
    username: 'Unknown',
    avatarUrl: 'https://placehold.co/400x400/png',
    email: '',
    phone: '',
    isMale: true,
    birthday: DateTime(2017, 9, 7),
    facebookUrl: null,
  );

  static List<Voucher> vouchers = [
    Voucher(
      id: "1",
      code: "VOUCHER2024",
      qrUrl: qrCodeShort,
      imageUrl: "https://placehold.co/400x600/png",
      value: "50.000 VND",
      description: "Giảm giá 50.000 VND cho đơn hàng trên 500.000 VND.",
      expiredTime: DateTime.now().add(const Duration(days: 10)),
      status: "Valid",
    ),
    Voucher(
      id: "2",
      code: "NEWYEAR2024",
      qrUrl: qrCodeShort,
      imageUrl: "https://placehold.co/400x600/png",
      value: "20%",
      description: "Giảm 20% cho tất cả các sản phẩm vào dịp Tết.",
      expiredTime: DateTime.now().add(const Duration(days: 5)),
      status: "Valid",
    ),
    Voucher(
      id: "3",
      code: "FREESHIP2024",
      qrUrl: qrCodeShort,
      imageUrl: "https://placehold.co/400x600/png",
      value: "Free Shipping",
      description: "Miễn phí vận chuyển cho mọi đơn hàng trong tháng 1.",
      expiredTime: DateTime.now().subtract(const Duration(days: 1)),
      status: "Expired",
    ),
    Voucher(
      id: "4",
      code: "SUMMER2024",
      qrUrl: qrCodeShort,
      imageUrl: "https://placehold.co/400x600/png",
      value: "100.000 VND",
      description: "Giảm 100.000 VND cho đơn hàng từ 1.000.000 VND.",
      expiredTime: DateTime.now().add(const Duration(days: 30)),
      status: "Valid",
    ),
    Voucher(
      id: "5",
      code: "THANKYOU2024",
      qrUrl: qrCodeShort,
      imageUrl: "https://placehold.co/400x600/png",
      value: "10%",
      description: "Giảm 10% cho khách hàng thân thiết.",
      expiredTime: DateTime.now().subtract(const Duration(days: 7)),
      status: "Expired",
    ),
  ];
}