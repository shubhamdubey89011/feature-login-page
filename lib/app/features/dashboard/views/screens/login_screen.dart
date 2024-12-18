import 'package:flutter/material.dart';
import 'package:flutter_template/app/features/dashboard/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email Field
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: controller.emailError.value,
              ),
              onChanged: (value) => controller.validateEmail(),
            ),
            const SizedBox(height: 10),

            // Password Field
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: controller.passwordError.value,
              ),
              onChanged: (value) => controller.validatePassword(),
            ),
            const SizedBox(height: 20),

            // Login Button
            Obx(
              () => ElevatedButton(
                onPressed: controller.isFormValidRx.value
                    ? controller.login
                    : null, // Disable if form is invalid
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
