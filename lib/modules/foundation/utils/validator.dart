class Validator {
  static String? emailValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Ingresa un email válido';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String password) {
    if (value != password) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  static String? birthDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Este campo es obligatorio";
    } else if (!RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}$')
        .hasMatch(value)) {
      return "La fecha de nacimiento debe tener el formato DD/MM/AAAA";
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Este campo es obligatorio";
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "El número de teléfono debe ser numérico";
    }
    return null;
  }

  static String? dniValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Este campo es obligatorio";
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "El DNI debe ser numérico";
    }
    return null;
  }
}
