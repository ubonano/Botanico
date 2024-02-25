class CompanyProfileModel {
  final String uid;
  final String name;
  final String address;
  final String city;
  final String province;
  final String country;
  final String phone;

  CompanyProfileModel({
    this.uid = '',
    required this.name,
    required this.address,
    required this.city,
    required this.province,
    required this.country,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'city': city,
      'province': province,
      'country': country,
      'phone': phone,
    };
  }

  factory CompanyProfileModel.fromMap(Map<String, dynamic> map) {
    return CompanyProfileModel(
      uid: map['uid'] ?? '',
      name: map['name'],
      address: map['address'],
      city: map['city'],
      province: map['province'],
      country: map['country'],
      phone: map['phone'],
    );
  }
}
