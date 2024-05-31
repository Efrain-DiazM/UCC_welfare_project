
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/screens/login/login.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/text_strings.dart';
import 'package:flutter_ucc_welfare_project/utils/services/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({super.key});

  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();
  bool _obscureText = true; // Estado para rastrear si la contraseña está oculta


  void _register() async {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      User? user = await _authService.signUpWithEmailAndPassword(name, email, password);
      
      if (user != null) {
        // Registration successful
        Get.to(const LoginScreen());
      } else {
        // Registration failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration failed. Please try again.")),
        );
      }
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: AppText.createAccountName,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: AppText.email,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),
            TextFormField(
              obscureText: _obscureText,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: AppText.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Iconsax.eye_slash : Iconsax.eye, // Cambiar icono basado en el estado
                  ),
                  onPressed: _togglePasswordVisibility, // Alternar visibilidad de la contraseña
                ),
              ),
              // obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),
            TextFormField(
              obscureText: _obscureText,
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: AppText.createAccountConfirmPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Iconsax.eye_slash : Iconsax.eye, // Cambiar icono basado en el estado
                  ),
                  onPressed: _togglePasswordVisibility, // Alternar visibilidad de la contraseña
                ),
              ),
              // obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _register,
                child: Text(AppText.singUp),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            TextButton(
              onPressed: () {
                Get.to(const LoginScreen());
              },
              child: Text(AppText.alreadyAcount),
            ),
          ],
        ),
      ),
    );
  }
}
