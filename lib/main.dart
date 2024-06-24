import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'modules/app/content/firebase_service.dart';
import 'modules/app/ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // firebase deploy --only hosting:qa,firestore,functions,storage --project botanico-qa
  // firebase deploy --only hosting:prod,firestore,functions,storage --project botanico-82e04

  // const String environment = String.fromEnvironment('ENV', defaultValue: 'prod');
  const String environment = String.fromEnvironment('ENV', defaultValue: 'qa');

  await FirebaseService.initializeFirebase(environment);

  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(const App());
}
