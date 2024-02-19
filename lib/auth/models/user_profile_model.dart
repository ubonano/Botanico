class UserProfileModel {
  final String uid;
  final String email;
  final String name;
  final String birthDate;
  final String phone;
  final String dni;

  UserProfileModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.birthDate,
    required this.phone,
    required this.dni,
  });

  bool get isComplete {
    return name.isNotEmpty &&
        birthDate.isNotEmpty &&
        phone.isNotEmpty &&
        dni.isNotEmpty;
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'birthDate': birthDate,
      'phone': phone,
      'dni': dni,
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      birthDate: map['birthDate'] ?? '',
      phone: map['phone'] ?? '',
      dni: map['dni'] ?? '',
    );
  }
}
