import 'package:cloud_firestore/cloud_firestore.dart';

class VendorModel {
  final String uid;

  VendorModel({
    this.uid = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
    };
  }

  factory VendorModel.fromMap(Map<String, dynamic> map, String documentId) {
    return VendorModel(
      uid: documentId,
    );
  }

  static VendorModel fromSnapshot(DocumentSnapshot snapshot) {
    return VendorModel.fromMap(snapshot.data() as Map<String, dynamic>, snapshot.id);
  }

  VendorModel copyWith({
    String? uid,
  }) {
    return VendorModel(
      uid: uid ?? this.uid,
    );
  }
}
