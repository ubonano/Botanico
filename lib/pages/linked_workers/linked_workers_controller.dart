import 'package:get/get.dart';

import '../../services/custom_controller.dart';

class LinkedWorkersController extends GetxController with CustomController {
  @override
  String get logTag => 'LinkedWorkersController';

  final RxList<Worker> workers = RxList<Worker>();

  void navigateToLinkWorker() => navigate.toLinkWorker(canPop: true);

  @override
  void onInit() {
    super.onInit();
    // Aquí deberías cargar los trabajadores vinculados a la empresa
    loadWorkers();
  }

  void loadWorkers() {
    // Simula la carga de trabajadores. Reemplaza esto con tu lógica de carga real
    workers.assignAll([
      // Worker(id: '1', name: 'John Doe', email: 'john@example.com'),
      // Worker(id: '2', name: 'Jane Doe', email: 'jane@example.com'),
    ]);
  }

  void addWorker(Worker worker) {
    // Aquí deberías implementar la lógica para añadir un nuevo trabajador
    workers.add(worker);
  }
}
