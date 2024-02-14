import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/navigation_service.dart';
import '../../utils/validator.dart';
import '../controllers/auth_controller.dart';
import '../../widgets/custom_input_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthController authController = Get.find();
  final NavigationService navigationService = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputField(
                label: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validator.emailValidator,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: 'Contraseña',
                controller: passwordController,
                obscureText: true,
                validator: Validator.passwordValidator,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: 'Confirmar Contraseña',
                controller: confirmPasswordController,
                obscureText: true,
                validator: (value) => Validator.confirmPasswordValidator(
                    value, passwordController.text),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    authController.createUserWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
                    );
                  }
                },
                child: const Text('Registrar'),
              ),
              TextButton(
                onPressed: navigationService.navigateToLogin,
                child: const Text('¿Ya tienes cuenta? Inicia sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
