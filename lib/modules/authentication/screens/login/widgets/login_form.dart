import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/screens/createAccount/createAccount.dart';
import 'package:flutter_ucc_welfare_project/modules/aplication/screens/base.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/text_strings.dart';
import 'package:flutter_ucc_welfare_project/utils/services/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginForm> {
  final FirebaseAuthService _auth = FirebaseAuthService(); // 👈👀
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true; // Estado para rastrear si la contraseña está oculta

  Future<void> signIn(BuildContext context) async {
    String email = _emailController.text.trim();
    String pass = _passwordController.text.trim();

    final user = await _auth.signInWithEmailAndPassword(email, pass);

    if (user != null) {
      print('Usuario si existe');
      Get.to(const BaseScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppText.loginIncorrect),
          duration: const Duration(seconds: 3),
        ),
      );
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
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: AppText.email,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),

            TextFormField(
              obscureText: _obscureText, // Usar el estado para mostrar/ocultar la contraseña
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
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(AppText.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  signIn(context);
                },
                child: Text(AppText.signIn),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),

            TextButton(
              onPressed: () {
                Get.to(const createAccount());
              },
              child: Text(AppText.createAccount),
            ),
          ],
        ),
      ),
    );
  }
}
