import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class WorkerCreateController extends FormController with LifeCycleLogController, ContextController {
  @override
  String get logTag => 'WorkerCreateController';

  late final WorkerService _workerService = Get.find();

  @override
  List<String> formFields = ['name', 'birthDate', 'phone', 'dni'];

  Future<void> createWorker() async {
    await operationManager.perform(
      operationName: 'Create worker',
      successMessage: 'Trabajador creado!',
      operation: (_) async => await _workerService.create(newWorker),
      onSuccess: navigate.toLobby,
    );
  }

  WorkerModel get newWorker => WorkerModel(
        name: getFieldValue('name'),
        birthDate: getFieldValue('birthDate'),
        phone: getFieldValue('phone'),
        dni: getFieldValue('dni'),
      );
}
