import 'package:cloud_firestore/cloud_firestore.dart';

class AccountingAccountModel {
  final String uid;
  final String name;
  final String observations;

  final DocumentSnapshot? documentSnapshot;

  AccountingAccountModel({
    this.uid = '',
    this.name = '',
    this.observations = '',
    this.documentSnapshot,
  });

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'name': name,
        'observations': observations,
      };

  static AccountingAccountModel fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return AccountingAccountModel(
      uid: snapshot.id,
      name: data['name'],
      observations: data['observations'],
      documentSnapshot: snapshot,
    );
  }

  AccountingAccountModel copyWith({
    String? uid,
    String? name,
    String? observations,
  }) =>
      AccountingAccountModel(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        observations: observations ?? this.observations,
      );
}
