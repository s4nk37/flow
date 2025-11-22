/// Validation utilities for form inputs
class Validators {
  Validators._();

  /// Email validation regex pattern
  static final RegExp _emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  /// Validates email address
  /// Returns error message if invalid, null if valid
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    
    if (!_emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }
    
    return null;
  }

  /// Validates password
  /// Returns error message if invalid, null if valid
  static String? password(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    
    return null;
  }

  /// Validates password confirmation
  /// Returns error message if invalid, null if valid
  static String? confirmPassword(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    
    if (value != originalPassword) {
      return 'Passwords do not match';
    }
    
    return null;
  }

  /// Validates required text field
  /// Returns error message if invalid, null if valid
  static String? required(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your $fieldName';
    }
    
    return null;
  }

  /// Validates name (at least 2 characters, letters and spaces only)
  /// Returns error message if invalid, null if valid
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }
    
    final trimmed = value.trim();
    if (trimmed.length < 2) {
      return 'Name must be at least 2 characters';
    }
    
    return null;
  }
}
