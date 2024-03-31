import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class WorkerCreateController extends GetxController with FormController, ContextController {
  @override
  String get logTag => 'WorkerCreateController';

  late final WorkerService _workerService = Get.find();

  @override
  List<String> formFields = ['name', 'birthDate', 'phone', 'dni'];

  @override
  Future<void> submit() async {
    await operationManager.perform(
      operationName: 'Create worker',
      successMessage: 'Trabajador creado',
      operation: (_) async => await _workerService.createWorker(newWorker),
      onSuccess: () async {
        await session.fetchWorker();
        navigate.toLobby();
      },
    );
  }

  WorkerModel get newWorker => WorkerModel(
        name: getFieldValue('name'),
        birthDate: getFieldValue('birthDate'),
        phone: getFieldValue('phone'),
        dni: getFieldValue('dni'),
      );
}
