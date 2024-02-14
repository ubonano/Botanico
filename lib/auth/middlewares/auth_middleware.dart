import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../config/routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser == null) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}
