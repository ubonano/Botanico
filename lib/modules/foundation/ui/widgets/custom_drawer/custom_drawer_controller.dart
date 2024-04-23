import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController with ContextController {
  @override
  String get logTag => 'CustomDrawerController';

  final WorkerRepository _workerRepo = Get.find();
  final CompanyRepository _companyRepo = Get.find();

  WorkerModel? get currentWorker$ => _workerRepo.currentWorker$;
  CompanyModel? get currentCompany$ => _companyRepo.currentCompany$;

  @override
  Future<void> onInit() async {
    super.onInit();

    await _workerRepo.fetch(authRepo.user!.uid);
    await _companyRepo.get(_workerRepo.currentWorker$!.companyId);
  }
}
