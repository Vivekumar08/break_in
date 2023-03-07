// Contact Validation
String? contactValidation(String? input) {
  if (input?.length != 10) {
    return 'Input should be of 10 digit';
  } else {
    return null;
  }
}

// Email Validation
String? emailValidation(String? input) {
  if (input == null || input.trim().isEmpty) {
    return 'Field is required';
  } else if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(input)) {
    return null;
  }
  return 'invalid email format';
}

// No Special Character Validation
String? noSpecialCharacterValidation(String? input) {
  if (input == null || input.trim().isEmpty) {
    return 'Field is required';
  } else if (input.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return 'special character not allowed';
  }
  return null;
}

// Null Validation
String? nullValidation(String? input) {
  if (input == null || input.trim().isEmpty) {
    return 'Field is required';
  }
  return null;
}

String? passwordValidation(String? input) {
  if (input == null || input.trim().isEmpty) {
    return 'Field is required';
  } else if (input.length < 8) {
    return 'Password must have 8 characters';
  } else if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
      .hasMatch(input)) {
    return null;
  }
  return 'Weak Password';
}
