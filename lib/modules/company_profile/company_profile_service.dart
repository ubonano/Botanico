import 'package:botanico/modules/common/config/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'company_profile_model.dart';
import '../common/utils/async_operation_service.dart';
import '../common/utils/common_services.dart';
import '../common/utils/log_lifecycle_service.dart';

class CompanyProfileService extends GetxService with CommonServices, LogLifecycleService {
  @override
  String get logTag => 'CompanyService';

  final AsyncOperationService _asyncOperationService = Get.find();

  final CollectionReference _companyProfilesCollection =
      FirebaseFirestore.instance.collection(FirestoreCollections.companyProfiles);

  Future<void> createCompanyProfile(CompanyProfileModel company) async {
    await _asyncOperationService.performAsyncOperation<void>(
      () async {
        bool existCompanyByOwner = await _existsCompanyCreatedByOwner(company.ownerUid);

        if (existCompanyByOwner) {
          throw Exception('Usted ya posee una empresa registrada a su nombre');
        }

        DocumentReference companyRef = _companyProfilesCollection.doc();
        await companyRef.set(company.toMap());

        navigationService.navigateToLobby();

        return await authService.updateUserProfileWithCompanyUid(company.ownerUid, companyRef.id);
      },
      successMessage: 'Empresa creada con exito',
      errorMessage: 'Error al crear compañía',
      operationName: "Crear empresa",
    );
  }

  Future<bool> _existsCompanyCreatedByOwner(String ownerUid) async {
    final querySnapshot = await _companyProfilesCollection.where('ownerUid', isEqualTo: ownerUid).limit(1).get();

    return querySnapshot.docs.isNotEmpty;
  }

  // Future<CompanyProfileModel?> getCompanyById(String companyId) async {
  //   return await _asyncOperationService.performAsyncOperation<CompanyProfileModel?>(
  //     () async {
  //       DocumentSnapshot docSnapshot = await _companyProfilesCollection.doc(companyId).get();

  //       if (!docSnapshot.exists) {
  //         throw Exception('No se encontró la compañía con el ID proporcionado');
  //       }

  //       return CompanyProfileModel.fromMap(docSnapshot.data() as Map<String, dynamic>);
  //     },
  //     errorMessage: 'Error al obtener la compañía',
  //     operationName: "Obtener compañía por ID",
  //   );
  // }
}
