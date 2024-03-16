import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/custom_controller.dart';

class LinkWorkerController extends GetxController with CustomController {
  @override
  String get logTag => 'LinkWorkerController';

  final codeCtrl = TextEditingController();

  String get _code => codeCtrl.text.trim();
  void code(String code) => codeCtrl.text = code;

  @override
  void onClose() {
    codeCtrl.dispose();
    super.onClose();
  }

  Future<void> linkByCode() async {
    print("Vinculando trabajador con código: $_code");
  }

  Future<void> scanQrCode() async {}
}
