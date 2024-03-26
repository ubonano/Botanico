import 'package:botanico/modules/worker/models/enums/worker_role.dart';
import 'package:get/get.dart';
import '../../../authentication/services/session_service.dart';
import '../../../../auxiliaries/services/navigation_service.dart';
import '../../services/worker_service.dart';
import '../../../../auxiliaries/services/async_operation_service.dart';
import '../../../../auxiliaries/life_cycle_log.dart';
import '../../models/worker_model.dart';
import '../../../../auxiliaries/form_controller.dart';

class WorkerCreateController extends FormController with LifeCycleLogController {
  @override
  String get logTag => 'WorkerCreateController';

  late final AsyncOperationService _async = Get.find();
  late final SessionService _session = Get.find();
  late final NavigationService _navigate = Get.find();
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
              uid: _session.userUID,
              email: _session.userEmail,
              name: getFieldValue('name'),
              birthDate: getFieldValue('birthDate'),
              phone: getFieldValue('phone'),
              dni: getFieldValue('dni'),
              role: WorkerRole.undefined,
            ),
          );
        },
        onSuccess: _navigate.toLobby,
      );
    }
  }
}
