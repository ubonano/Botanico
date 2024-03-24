import 'package:botanico/models/enums/worker_role.dart';

import '../../utils/custom_controller.dart';
import '../../models/worker_model.dart';
import '../../utils/form_controller.dart';

class WorkerCreateController extends FormController with CustomController {
  @override
  String get logTag => 'WorkerCreateController';

  @override
  List<String> formFields = [
    'name',
    'birthDate',
    'phone',
    'dni',
  ];

  Future<void> createWorker() async {
    if (validateForm()) {
      await async.perform(
        operationName: 'Create worker',
        successMessage: 'Trabajador creado!',
        operation: (_) async {
          await workerService.create(
            WorkerModel(
              uid: currentUserUID,
              email: currentUserEmail,
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
