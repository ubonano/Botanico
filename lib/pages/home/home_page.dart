import 'package:botanico/widgets/custom_drawer/custom_drawer.dart';
import 'package:botanico/widgets/sign_out_button/sign_out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.logTag;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const CustomDrawer(),
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

/*

  Agregar un drawer con: 
    #info del usuario y empresa.
    #Cerrar sesion
    #menu a trabajadores, lista de los mismos y vinculacion 
    #Revisar flujo del usuario! Ver desde el inicio de sesion, registro, creacion de worker y company

 */ 