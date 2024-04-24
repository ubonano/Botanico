import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A base controller class for managing forms within the application.
///
/// This class extends GetxController and provides a structured way to handle form fields,
/// validation, and text editing controllers in a GetX-friendly manner. It's designed to simplify form management
/// across different parts of the application by centralizing form-related logic.
mixin UIFormController on GetxController {
  /// A global key used to uniquely identify the form widget and facilitate form validation and saving.
  final formKey = GlobalKey<FormState>();

  /// A list of strings representing the form field identifiers.
  List<String> get formFields;

  /// A map holding the text editing controllers for each form field.
  /// The controllers are used to manage the input text of form fields.
  late final Map<String, TextEditingController> _textControllers = {};

  /// Retrieves the text value of a specific form field.
  ///
  /// [field] is the identifier of the form field whose value is to be retrieved.
  String getFieldValue(String field) => _textControllers[field]!.text.trim();

  /// Sets the text value of a specific form field.
  ///
  /// [field] is the identifier of the form field whose value is to be set.
  /// [value] is the new text value for the field.
  String setFieldValue(String field, dynamic value) => _textControllers[field]!.text = value;

  /// Retrieves the [TextEditingController] for a specific form field.
  ///
  /// [field] is the identifier of the form field whose controller is to be retrieved.
  TextEditingController? getFieldController(String field) => _textControllers[field];

  /// Validates all the form fields in the form and returns true if the form is valid.
  bool validateForm() => formKey.currentState!.validate();

  /// Calls `submit` if the form is valid.
  Future<void> secureSubmit() async {
    if (validateForm()) {
      await submit();
    }
  }

  /// Abstract method that must be implemented by subclasses to handle form submission.
  Future<void> submit();

  @override
  void onInit() async {
    super.onInit();
    // Initializes text editing controllers for each form field.
    if (formFields.isNotEmpty) _initializeTextControllers();
  }

  /// Initializes the text editing controllers for the form fields.
  ///
  /// This method iterates over the [formFields] list and creates a [TextEditingController]
  /// for each field, storing them in the [_textControllers] map.
  void _initializeTextControllers() {
    for (var fieldName in formFields) {
      _textControllers[fieldName] = TextEditingController();
    }
  }

  @override
  void onClose() {
    // Disposes of the text editing controllers to free up resources.
    if (_textControllers.isNotEmpty) _disposeControllers();
    super.onClose();
  }

  /// Disposes of all text editing controllers in the form.
  ///
  /// This method is called during the controller's onClose lifecycle method
  /// to ensure that all controllers are properly disposed of.
  // ignore: avoid_function_literals_in_foreach_calls
  void _disposeControllers() => _textControllers.values.forEach((controller) => controller.dispose());
}
