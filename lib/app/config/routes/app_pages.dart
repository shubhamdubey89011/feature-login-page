import 'package:flutter_template/app/features/dashboard/bindings/login_binding.dart';
import 'package:flutter_template/app/features/dashboard/views/screens/login_screen.dart';

import '../../features/dashboard/views/screens/dashboard_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const initial = Routes.dashboard;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
     GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
