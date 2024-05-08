import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/vendor/module.dart';
import 'package:get/get.dart';

class VendorBusinessLogic extends GetxService with GlobalHelper implements IVendorBusinessLogic {
  late final IVendorRepository _vendorRepo = Get.find();
}
