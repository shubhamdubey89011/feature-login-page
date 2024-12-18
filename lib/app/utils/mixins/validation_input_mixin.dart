part of 'app_mixins.dart';
mixin ValidatorMixin {
  String? getEmailError(String email) {
    if (!GetUtils.isEmail(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? getPasswordError(String password) {
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  bool isFormValid(String? emailError, String? passwordError) {
    return emailError == null && passwordError == null;
  }
}
