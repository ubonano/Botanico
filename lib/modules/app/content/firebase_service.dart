import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static Future<void> initializeFirebase(String environment) async {
    String configPath = 'lib/modules/app/content/setup/firebase_config_$environment.json';
    final configString = await rootBundle.loadString(configPath);
    final config = json.decode(configString);

    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: config['apiKey'],
        authDomain: config['authDomain'],
        projectId: config['projectId'],
        storageBucket: config['storageBucket'],
        messagingSenderId: config['messagingSenderId'],
        appId: config['appId'],
      ),
    );
  }
}
