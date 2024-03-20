import 'package:botanico/config/routes.dart';
import 'package:get/get.dart';
import '../utils/log_service.dart';

/// Manages navigation throughout the application using named routes.
///
/// This service abstracts the GetX navigation to provide simple methods
/// for navigating to different pages in the app. It also logs navigation actions.
class NavigationService extends GetxService {
  /// Logs navigation events.
  final log = Get.find<LogService>();

  /// Navigates to the Home page.
  ///
  /// [canPop] determines whether the navigation action can be popped.
  void toHome({bool canPop = false}) => to(Routes.HOME, canPop: canPop);

  /// Navigates to the Lobby page.
  ///
  /// [canPop] determines whether the navigation action can be popped.
  void toLobby({bool canPop = false}) => to(Routes.LOBBY, canPop: canPop);

  /// Navigates to the Sign In page.
  ///
  /// [canPop] determines whether the navigation action can be popped.
  void toSignIn({bool canPop = false}) => to(Routes.SIGN_IN, canPop: canPop);

  /// Navigates to the Sign Up page.
  ///
  /// [canPop] determines whether the navigation action can be popped.
  void toSignUp({bool canPop = false}) => to(Routes.SIGN_UP, canPop: canPop);

  /// Navigates to the Worker Creation page.
  ///
  /// [canPop] determines whether the navigation action can be popped.
  void toWorkerCreate({bool canPop = false}) => to(Routes.WORKER_CREATE, canPop: canPop);

  /// Navigates to the Company Creation page.
  ///
  /// [canPop] determines whether the navigation action can be popped.
  void toCompany({bool canPop = false}) => to(Routes.COMPANY_CREATE, canPop: canPop);

  /// Navigates to the Linked Workers page.
  ///
  /// [canPop] determines whether the navigation action can be popped.
  void toLinkedWorkers({bool canPop = false}) => to(Routes.LINKED_WORKERS, canPop: canPop);

  /// Navigates to the Link Worker page.
  ///
  /// [canPop] determines whether the navigation action can be popped.
  void toLinkWorker({bool canPop = false}) => to(Routes.LINK_WORKER, canPop: canPop);

  /// Performs navigation based on the given route.
  ///
  /// If [canPop] is true, the navigation allows popping back to the previous page.
  /// Logs the navigation action.
  void to(String route, {bool canPop = false}) {
    if (canPop) {
      log.debug('Navigate to named: $route');
      Get.toNamed(route);
    } else {
      log.debug('Navigate off all named: $route');
      Get.offAllNamed(route);
    }
  }

  /// Navigates back to the previous page in the navigation stack.
  /// Logs the back navigation action.
  void back() {
    log.debug('Navigate - back');
    Get.back();
  }
}
