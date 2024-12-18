import 'package:flutter/material.dart';
import 'package:flutter_template/app/utils/mixins/app_mixins.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with ValidatorMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailError = Rx<String?>(null);
  final passwordError = Rx<String?>(null);
  final isFormValidRx = false.obs; 

    void validateEmail() {
    if (!GetUtils.isEmail(emailController.text)) {
      emailError.value = 'Please enter a valid email';
    } else {
      emailError.value = null;
    }
    _updateFormValidity();
  }

  void validatePassword() {
    if (passwordController.text.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
    } else {
      passwordError.value = null;
    }
    _updateFormValidity();
  }

  void _updateFormValidity() {
    isFormValidRx.value =
        emailError.value == null && passwordError.value == null;
  }

  bool validateForm() {
    validateEmail();
    validatePassword();
    return isFormValidRx.value;
  }

  void login() {
    if (validateForm()) {
      Get.snackbar('Success', 'Login successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } else {
      Get.snackbar('Error', 'Please fix the errors',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
