import 'package:botanico/models/enums/worker_role.dart';
import 'package:get/get.dart';

import '../../controllers/session_controller.dart';
import '../../services/navigation_service.dart';
import '../../services/worker_service.dart';
import '../../utils/async_operation_service.dart';
import '../../utils/custom_controller.dart';
import '../../models/worker_model.dart';
import '../../controllers/form_controller.dart';

class WorkerCreateController extends FormController with CustomController {
  @override
  String get logTag => 'WorkerCreateController';

  late final AsyncOperationService _async = Get.find();
  late final SessionController _session = Get.find();
  late final NavigationService navigate = Get.find();
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
      await _async.perform(
        operationName: 'Create worker',
        successMessage: 'Trabajador creado!',
        operation: (_) async {
          await _workerService.create(
            WorkerModel(
              uid: _session.currentUserUID,
              email: _session.currentUserEmail,
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
