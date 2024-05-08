import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../module.dart';

class VendorService extends GetxService with GlobalHelper implements IVendorService {
  late final IVendorBusinessLogic _vendorBusinessLogic = Get.find();
}
