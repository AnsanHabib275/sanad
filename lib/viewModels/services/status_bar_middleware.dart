import 'package:get/get.dart';
import 'package:sanad/viewModels/services/status_bar_service.dart';

class StatusBarMiddleware extends GetMiddleware {
  final bool darkStatusBar;

  StatusBarMiddleware({required this.darkStatusBar});

  @override
  GetPage? onPageCalled(GetPage? page) {
    final statusBarService = Get.find<StatusBarService>();
    darkStatusBar
        ? statusBarService.setDarkStatusBar()
        : statusBarService.setLightStatusBar();
    return super.onPageCalled(page);
  }
}
