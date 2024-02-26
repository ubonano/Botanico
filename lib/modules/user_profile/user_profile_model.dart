class UserProfileModel {
  final String uid;
  final String email;
  final String name;
  final String birthDate;
  final String phone;
  final String dni;
  final String companyUid;

  UserProfileModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.birthDate,
    required this.phone,
    required this.dni,
    this.companyUid = '',
  });

  UserProfileModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? birthDate,
    String? phone,
    String? dni,
    String? companyUid,
  }) {
    return UserProfileModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      phone: phone ?? this.phone,
      dni: dni ?? this.dni,
      companyUid: companyUid ?? this.companyUid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'birthDate': birthDate,
      'phone': phone,
      'dni': dni,
      'companyUid': companyUid,
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
      companyUid: map['companyUid'] ?? '',
    );
  }
}
