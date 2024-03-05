import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final String birthDate;
  final String phone;
  final String dni;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.birthDate,
    required this.phone,
    required this.dni,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? birthDate,
    String? phone,
    String? dni,
    String? companyUid,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      phone: phone ?? this.phone,
      dni: dni ?? this.dni,
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
    };
  }

  static UserModel fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      birthDate: map['birthDate'] ?? '',
      phone: map['phone'] ?? '',
      dni: map['dni'] ?? '',
    );
  }
}
