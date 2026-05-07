class Validators {
  static String? requiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? email(String? value) {
    final requiredResult = requiredField(value, 'Email');
    if (requiredResult != null) {
      return requiredResult;
    }

    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value!.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? password(String? value) {
    final requiredResult = requiredField(value, 'Password');
    if (requiredResult != null) {
      return requiredResult;
    }

    if (value!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
