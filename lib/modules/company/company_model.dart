import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyModel {
  final String uid;
  final String ownerUid;
  final String name;
  final String address;
  final String city;
  final String province;
  final String country;
  final String phone;

  CompanyModel({
    this.uid = '',
    required this.ownerUid,
    required this.name,
    required this.address,
    required this.city,
    required this.province,
    required this.country,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'ownerUid': ownerUid,
      'name': name,
      'address': address,
      'city': city,
      'province': province,
      'country': country,
      'phone': phone,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CompanyModel(
      uid: documentId,
      ownerUid: map['ownerUid'],
      name: map['name'],
      address: map['address'],
      city: map['city'],
      province: map['province'],
      country: map['country'],
      phone: map['phone'],
    );
  }

  static CompanyModel fromSnapshot(DocumentSnapshot snapshot) {
    return CompanyModel.fromMap(snapshot.data() as Map<String, dynamic>, snapshot.id);
  }

  CompanyModel copyWith({
    String? uid,
    String? ownerUid,
    String? name,
    String? address,
    String? city,
    String? province,
    String? country,
    String? phone,
  }) {
    return CompanyModel(
      uid: uid ?? this.uid,
      ownerUid: ownerUid ?? this.ownerUid,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      province: province ?? this.province,
      country: country ?? this.country,
      phone: phone ?? this.phone,
    );
  }
}
