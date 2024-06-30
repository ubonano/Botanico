import 'package:get/get.dart';

import '../vendor_business_logic.dart';
import '../vendor_service.dart';
import '../vendor_repository.dart';
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
