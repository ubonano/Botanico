import 'package:botanico/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/routes.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController authController = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthInputField(
                label: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validator.emailValidator,
              ),
              const SizedBox(height: 10),
              AuthInputField(
                label: 'Contraseña',
                controller: passwordController,
                obscureText: true,
                validator: Validator.passwordValidator,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    authController.signInWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
                    );
                  }
                },
                child: const Text('Iniciar Sesión'),
              ),
              // TextButton(
              //   onPressed: () => authController.signInWithGoogle(),
              //   child: const Text('Iniciar Sesión con Google'),
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Get.offAllNamed(Routes.SIGN_UP),
                child: const Text('Crear Nueva Cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
