class Profile{
  final String id;
  final String? name;
  final String? avatar;
  final String? email;
  final String? phone;
  final DateTime? dob; // Consider parsing to DateTime if needed
  final bool? gender;
  final String? facebook;

  Profile({
    required this.id,
    this.name,
    this.avatar,
    this.email,
    this.phone,
    this.dob,
    this.gender,
    this.facebook,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] ?? '',
      name: json['name'],
      avatar: json['avatar'],
      email: json['email'],
      phone: json['phone'],
      dob: json['dob'],
      gender: json['gender'] ?? false,
      facebook: json['facebook'],
    );
  }

  //FromJson:



}