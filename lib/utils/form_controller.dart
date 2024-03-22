import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  late List<String> formFields = [];
  late final Map<String, TextEditingController> _textControllers = {};

  String getFieldValue(String field) => _textControllers[field]!.text.trim();
  String setFieldValue(String field, dynamic value) => _textControllers[field]!.text = field;

  TextEditingController? getFieldController(String field) => _textControllers[field];

  bool validateForm() => formKey.currentState!.validate();

  @override
  Future<void> onInit() async {
    super.onInit();

    if (formFields.isNotEmpty) _initializeTextControllers();
  }

  void _initializeTextControllers() {
    for (var fieldName in formFields) {
      _textControllers[fieldName] = TextEditingController();
    }
  }

  @override
  void onClose() {
    if (_textControllers.isNotEmpty) disposeControllers();

    super.onClose();
  }

  // ignore: avoid_function_literals_in_foreach_calls
  void disposeControllers() => _textControllers.values.forEach((controller) => controller.dispose());
}
