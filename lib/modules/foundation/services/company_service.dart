import 'package:botanico/modules/foundation/config/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/company_model.dart';
import '../utils/async_operation_service.dart';
import '../utils/common_services.dart';
import '../utils/log_lifecycle_service.dart';

class CompanyService extends GetxService with CommonServices, LogLifecycleService {
  @override
  String get logTag => 'CompanyService';

  final AsyncOperationService _asyncOperationService = Get.find();

  final CollectionReference _companiesCollection =
      FirebaseFirestore.instance.collection(FirestoreCollections.companies);

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> createCompany(CompanyModel company) async {
    await _asyncOperationService.performAsyncOperation<void>(
      () => _companiesCollection.doc().set(company.toMap()),
      errorMessage: 'Error al crear compañía',
      operationName: "Crear compañía",
    );
  }
}
