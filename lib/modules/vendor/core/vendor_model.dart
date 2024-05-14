import 'package:cloud_firestore/cloud_firestore.dart';

class VendorModel {
  final String uid;
  final String name;
  final String cuit;
  final String address;
  final String phone;
  final String observations;
  final String registrationType;

  VendorModel({
    this.uid = '',
    this.name = '',
    this.cuit = '',
    this.address = '',
    this.phone = '',
    this.observations = '',
    this.registrationType = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'cuit': cuit,
      'address': address,
      'phone': phone,
      'observations': observations,
      'registrationType': registrationType,
    };
  }

  factory VendorModel.fromMap(Map<String, dynamic> map, String documentId) {
    return VendorModel(
      uid: documentId,
      name: map['name'],
      cuit: map['cuit'],
      address: map['address'],
      phone: map['phone'],
      observations: map['observations'],
      registrationType: map['registrationType'] ?? '',
    );
  }

  static VendorModel fromSnapshot(DocumentSnapshot snapshot) {
    return VendorModel.fromMap(snapshot.data() as Map<String, dynamic>, snapshot.id);
  }

  VendorModel copyWith({
    String? uid,
    String? name,
    String? cuit,
    String? address,
    String? phone,
    String? observations,
    String? registrationType,
  }) {
    return VendorModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      cuit: cuit ?? this.cuit,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      observations: observations ?? this.observations,
      registrationType: registrationType ?? this.registrationType,
    );
  }
}
