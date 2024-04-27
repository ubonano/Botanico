import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

mixin CompanyContext {
  late final CompanyRepository companyRepo = Get.find();

  Future<void> getCompany(WorkerModel? worker) async {
    if (worker != null && worker.companyId.isNotEmpty) await companyRepo.fetch(worker.companyId);
  }

  void cleanCurrentCompany() => companyRepo.clearCurrentCompany();
}
