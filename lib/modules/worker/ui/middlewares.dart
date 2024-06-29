import 'package:botanico/modules/app/ui/navigation.dart';
import 'package:botanico/modules/worker/ui/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../content/setup/interfaces/i_worker_service.dart';

class HasWorkerMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final IWorkerService workerService = Get.find();

    if (workerService.currentWorker$ == null) {
      return const RouteSettings(name: WorkerNavigation.WORKER_CREATE);
    }
    return null;
  }
}

class NoWorkerMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final IWorkerService workerService = Get.find();

    if (workerService.currentWorker$ != null) {
      return const RouteSettings(name: WorkerNavigation.LOBBY);
    }
    return null;
  }
}

class IsEmployedOrOwnerMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final IWorkerService workerService = Get.find();

    if (workerService.currentWorker$?.companyId == '' && workerService.currentWorker$?.isOwner == false) {
      return const RouteSettings(name: WorkerNavigation.LOBBY);
    }
    return null;
  }
}

class IsNotEmployedOrOwnerMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final IWorkerService workerService = Get.find();

    if (workerService.currentWorker$?.companyId != '' && workerService.currentWorker$?.isOwner == true) {
      return const RouteSettings(name: AppNavigation.HOME);
    }
    return null;
  }
}
