import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin FormHelper<T> on GetxController {
  final formKey = GlobalKey<FormState>();

  List<String> get formFields;

  late final Map<String, TextEditingController> _textControllers = {};

  T? modelForUpdate;

  dynamic get modelId => Get.arguments;
  bool get isUpdateMode => modelId != null && modelId != '';

  String getFieldValue(String field) => _textControllers[field]!.text.trim();

  String setFieldValue(String field, dynamic value) => _textControllers[field]!.text = value;

  TextEditingController? getFieldController(String field) => _textControllers[field];

  bool validateForm() => formKey.currentState!.validate();

  Future<void> secureSubmit() async {
    if (validateForm()) {
      await submit();
    }
  }

  Future<void> submit();

  Future<void> populateFormFields() async {}

  T buildModel() => throw UnimplementedError();

  void _initializeTextControllers() {
    for (var fieldName in formFields) {
      _textControllers[fieldName] = TextEditingController();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    if (formFields.isNotEmpty) _initializeTextControllers();
    if (isUpdateMode) await populateFormFields();
  }

  @override
  void onClose() {
    if (_textControllers.isNotEmpty) _disposeControllers();
    super.onClose();
  }

  void _disposeControllers() => _textControllers.values.forEach((controller) => controller.dispose());
}
