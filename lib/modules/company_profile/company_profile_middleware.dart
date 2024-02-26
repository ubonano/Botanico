import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../foundation/config/routes.dart';
import 'company_profile_service.dart';

class CompanyProfileMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final CompanyProfileService companyProfileService = Get.find();

    if (!companyProfileService.isCompanyProfile) {
      return const RouteSettings(name: Routes.LOBBY);
    }

    return null;
  }
}
