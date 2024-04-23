import 'dart:math';

String generateRandomString(int length) {
  const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Random rnd = Random();

  return String.fromCharCodes(Iterable.generate(
    length,
    (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
  ));
}

String generateRandomEmail() {
  return '${generateRandomString(8)}@${generateRandomString(5)}.com';
}


// TODO refactorizar los flujos de testing