import 'package:cloud_firestore/cloud_firestore.dart';

class VendorModel {
  final String uid;
  final String name;
  final String cuit;
  final String registrationType;
  final String address;
  final String phone;
  final String observations;

  final DocumentSnapshot? documentSnapshot;

  VendorModel({
    this.uid = '',
    this.name = '',
    this.cuit = '',
    this.registrationType = '',
    this.address = '',
    this.phone = '',
    this.observations = '',
    this.documentSnapshot,
  });

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'name': name,
        'cuit': cuit,
        'registrationType': registrationType,
        'address': address,
        'phone': phone,
        'observations': observations,
      };

  static VendorModel fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return VendorModel(
      uid: snapshot.id,
      name: data['name'],
      cuit: data['cuit'],
      registrationType: data['registrationType'] ?? '',
      address: data['address'],
      phone: data['phone'],
      observations: data['observations'],
      documentSnapshot: snapshot,
    );
  }

  VendorModel copyWith({
    String? uid,
    String? name,
    String? cuit,
    String? registrationType,
    String? address,
    String? phone,
    String? observations,
  }) =>
      VendorModel(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        cuit: cuit ?? this.cuit,
        registrationType: registrationType ?? this.registrationType,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        observations: observations ?? this.observations,
      );
}
