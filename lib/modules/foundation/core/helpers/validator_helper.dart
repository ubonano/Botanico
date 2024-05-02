class ValidatorHelper {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return "Este campo es obligatorio";
    }
    return null;
  }

  static String? email(String? value, {bool required = true}) {
    if (required && (value == null || value.isEmpty)) {
      return 'Este campo es obligatorio';
    } else if (!required && (value == null || value.isEmpty)) {
      return null;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
      return 'Ingresa un email válido';
    }
    return null;
  }

  static String? password(String? value, {bool required = true}) {
    if (required && (value == null || value.isEmpty)) {
      return 'Este campo es obligatorio';
    } else if (value != null && value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  static String? confirmPassword(String? value, String password, {bool required = true}) {
    if (required && (value == null || value.isEmpty)) {
      return 'Este campo es obligatorio';
    } else if (value != password) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  static String? date(String? value, {bool required = true}) {
    if (required && (value == null || value.isEmpty)) {
      return 'Este campo es obligatorio';
    } else if (!RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}$').hasMatch(value!)) {
      return "Este campo debe tener el formato DD/MM/AAAA";
    }
    return null;
  }

  static String? number(String? value, {bool required = true}) {
    if (required && (value == null || value.isEmpty)) {
      return 'Este campo es obligatorio';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
      return "Este campo debe ser numérico";
    }
    return null;
  }
}
