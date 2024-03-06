class FormValidations {
  static String? validateRequired(String? value, String? message) {
    if (value == null || value.isEmpty) {
      return message ?? 'This field is required.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    // Add your email validation logic here
    // For example, you can use a regular expression to validate the email format
    // if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
    //   return 'Invalid email format.';
    // }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }
    // Add your password validation logic here
    // For example, you can check if the password meets certain criteria like minimum length, special characters, etc.
    // if (value.length < 8) {
    //   return 'Password must be at least 8 characters long.';
    // }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }
    // Add your phone number validation logic here
    // For example, you can check if the phone number is in a valid format
    // if (!RegExp(r'^\d{10}$').hasMatch(value)) {
    //   return 'Invalid phone number format.';
    // }
    return null;
  }

  // Add more validation methods as needed
}
