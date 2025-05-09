import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewModels/services/status_bar_service.dart';

class DarkStatusBarWrapper extends StatelessWidget {
  final Widget child;

  const DarkStatusBarWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Get.find<StatusBarService>().setDarkStatusBar();
    return child;
  }
}
