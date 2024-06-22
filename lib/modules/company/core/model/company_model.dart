import 'package:botanico/modules/company/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyModel {
  static const String collectionName = 'companies';

  final String uid;
  final String ownerUid;
  final String name;
  final String address;
  final String city;
  final String province;
  final String country;
  final String phone;
  Map<String, bool> activeModules;

  CompanyModel({
    this.uid = '',
    this.ownerUid = '',
    required this.name,
    required this.address,
    required this.city,
    required this.province,
    required this.country,
    required this.phone,
    this.activeModules = const {},
  });

  bool hasModuleActive(IModuleStructure module) =>
      activeModules.containsKey(module.id) && activeModules[module.id] == true;

  void toggleModule(IModuleStructure module) {
    if (activeModules.containsKey(module.id) && activeModules[module.id] == true) {
      activeModules.remove(module.id);
    } else {
      activeModules[module.id] = true;
    }
  }

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'ownerUid': ownerUid,
        'name': name,
        'address': address,
        'city': city,
        'province': province,
        'country': country,
        'phone': phone,
        if (activeModules.isNotEmpty) 'activeModules': activeModules,
      };

  factory CompanyModel.fromMap(Map<String, dynamic> map, String documentId) => CompanyModel(
        uid: documentId,
        ownerUid: map['ownerUid'],
        name: map['name'],
        address: map['address'],
        city: map['city'],
        province: map['province'],
        country: map['country'],
        phone: map['phone'],
        activeModules: Map<String, bool>.from(map['activeModules'] ?? {}),
      );

  static CompanyModel fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyModel.fromMap(snapshot.data() as Map<String, dynamic>, snapshot.id);

  CompanyModel copyWith({
    String? uid,
    String? ownerUid,
    String? name,
    String? address,
    String? city,
    String? province,
    String? country,
    String? phone,
    Map<String, bool>? activeModules,
  }) =>
      CompanyModel(
        uid: uid ?? this.uid,
        ownerUid: ownerUid ?? this.ownerUid,
        name: name ?? this.name,
        address: address ?? this.address,
        city: city ?? this.city,
        province: province ?? this.province,
        country: country ?? this.country,
        phone: phone ?? this.phone,
        activeModules: activeModules ?? this.activeModules,
      );
}
