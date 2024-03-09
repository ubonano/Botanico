import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  final String uid;
  final String email;
  final String name;
  final String birthDate;
  final String phone;
  final String dni;
  final String companyUid;

  ProfileModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.birthDate,
    required this.phone,
    required this.dni,
    this.companyUid = '',
  });

  ProfileModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? birthDate,
    String? phone,
    String? dni,
    String? companyUid,
  }) {
    return ProfileModel(
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

  static ProfileModel fromSnapshot(DocumentSnapshot snapshot) {
    return ProfileModel.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
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
