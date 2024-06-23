import 'package:get/get.dart';

import '../core/vendor_business_logic.dart';
import '../core/vendor_service.dart';
import '../model/vendor_repository.dart';
import '../ui/ui.dart';
import 'interfaces/i_vendor_business_logic.dart';
import 'interfaces/i_vendor_repository.dart';
import 'interfaces/i_vendor_service.dart';
import 'permissions.dart';

void setupDependencies() {
  Get.lazyPut<VendorPermissions>(() => VendorPermissions(), fenix: true);

  Get.lazyPut<IVendorBusinessLogic>(() => VendorBusinessLogic(), fenix: true);
  Get.lazyPut<IVendorRepository>(() => VendorRepository(), fenix: true);
  Get.lazyPut<IVendorService>(() => VendorService(), fenix: true);

  Get.lazyPut<VendorFormController>(() => VendorFormController(), fenix: true);
  Get.lazyPut<VendorListController>(() => VendorListController(), fenix: true);
}
