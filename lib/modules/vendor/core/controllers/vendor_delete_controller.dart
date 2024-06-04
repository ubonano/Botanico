import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class VendorDeleteController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'VendorDeleteController';

  late final IVendorService _workerService = Get.find();

  Future<void> submit(VendorModel vendor) async => await _workerService.deleteVendor(vendor.uid);
}
