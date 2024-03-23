class WorkerNotFoundException implements Exception {
  final String message;

  WorkerNotFoundException({this.message = 'No se encontro trabajador'});

  @override
  String toString() => message;
}

class CustomException implements Exception {
  final String message;

  CustomException({this.message = ''});

  @override
  String toString() => message;
}
