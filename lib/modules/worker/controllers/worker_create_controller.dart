import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';





// Refactor
class WorkerCreateController extends FormController with LifeCycleLogController, ContextController {
  @override
  String get logTag => 'WorkerCreateController';

  late final WorkerService _workerService = Get.find();

  @override
  List<String> formFields = [
    'name',
    'birthDate',
    'phone',
    'dni',
  ];

  Future<void> createWorker() async {
    if (validateForm()) {
      await operationManager.perform(
        operationName: 'Create worker',
        successMessage: 'Trabajador creado!',
        operation: (_) async {
          //Refactor
          await _workerService.create(
            WorkerModel(
              uid: session.userUID,
              email: session.userEmail,
              name: getFieldValue('name'),
              birthDate: getFieldValue('birthDate'),
              phone: getFieldValue('phone'),
              dni: getFieldValue('dni'),
              role: WorkerRole.undefined,
            ),
          );
        },
        onSuccess: navigate.toLobby,
      );
    }
  }
}
