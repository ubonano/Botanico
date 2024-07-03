import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/ui/ui.dart';
import '../../company/setup/interfaces/i_company_service.dart';
import '../content/setup/interfaces/i_worker_service.dart';
import 'ui.dart';

class HasWorkerMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final IWorkerService workerService = Get.find();

    if (workerService.currentWorker$ == null) {
      return const RouteSettings(name: LoadingPage.route);
    }
    return null;
  }
}

class NoWorkerMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final IWorkerService workerService = Get.find();

    if (workerService.currentWorker$ != null) {
      return const RouteSettings(name: LobbyPage.route);
    }
    return null;
  }
}

class IsEmployedOrOwnerMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final IWorkerService workerService = Get.find();

    if (workerService.currentWorker$?.companyId == '' && workerService.currentWorker$?.isOwner == false) {
      return const RouteSettings(name: LobbyPage.route);
    }
    return null;
  }
}

class IsNotEmployedOrOwnerMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final IWorkerService workerService = Get.find();

    if (workerService.currentWorker$?.companyId != '' && workerService.currentWorker$?.isOwner == true) {
      return const RouteSettings(name: HomePage.route);
    }
    return null;
  }
}

class AccessMiddleware extends GetMiddleware {
  final String moduleId;
  final String key;

  AccessMiddleware(this.moduleId, this.key);

  @override
  RouteSettings? redirect(String? route) {
    final IWorkerService workerService = Get.find();
    final ICompanyService companyService = Get.find();

    final hasModuleActive = companyService.currentCompany$?.hasModuleActive(moduleId) ?? false;
    final isOwner = workerService.currentWorker$?.isOwner ?? false;
    final hasPermission = workerService.currentWorker$?.hasPermission(key) ?? false;

    if (!hasModuleActive || (!isOwner && !hasPermission)) {
      return const RouteSettings(name: HomePage.route);
    }
    return null;
  }
}
