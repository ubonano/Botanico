class UserModel {
  final String uid;
  final String email;
  final String name;
  final String dob; // Fecha de nacimiento
  final String phone;
  final String dni;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.dob,
    required this.phone,
    required this.dni,
  });

  bool get isComplete {
    return name.isNotEmpty &&
        dob.isNotEmpty &&
        phone.isNotEmpty &&
        dni.isNotEmpty;
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'dob': dob,
      'phone': phone,
      'dni': dni,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      dob: map['dob'],
      phone: map['phone'],
      dni: map['dni'],
    );
  }
}
