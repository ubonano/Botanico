import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../module.dart';

class VendorListController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'VendorListController';

  late final IVendorService _vendorService = Get.find();

  List<VendorModel> get vendorList$ => _vendorService.vendorList$;

  @override
  void onInit() {
    super.onInit();
    _vendorService.initializeVendorStream();
  }

  @override
  void onClose() {
    _vendorService.cancelVendorStream();
    super.onClose();
  }
}
