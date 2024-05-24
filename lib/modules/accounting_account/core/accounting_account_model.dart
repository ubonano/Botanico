import 'package:cloud_firestore/cloud_firestore.dart';

class AccountingAccountModel {
  final String uid;
  final String name;
  final String observations;

  AccountingAccountModel({
    this.uid = '',
    this.name = '',
    this.observations = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'observations': observations,
    };
  }

  factory AccountingAccountModel.fromMap(Map<String, dynamic> map, String documentId) {
    return AccountingAccountModel(
      uid: documentId,
      name: map['name'],
      observations: map['observations'],
    );
  }

  static AccountingAccountModel fromSnapshot(DocumentSnapshot snapshot) {
    return AccountingAccountModel.fromMap(snapshot.data() as Map<String, dynamic>, snapshot.id);
  }

  AccountingAccountModel copyWith({
    String? uid,
    String? name,
    String? observations,
  }) {
    return AccountingAccountModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      observations: observations ?? this.observations,
    );
  }
}

