class CompanyNotFoundException implements Exception {
  final String message;

  CompanyNotFoundException({this.message = 'No se encontro empresa'});

  @override
  String toString() => message;
}
