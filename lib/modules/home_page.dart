import 'package:botanico/modules/auth/sign_out/sign_out_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hola Mundo', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            SignOutButton(),
          ],
        ),
      ),
    );
  }
}
