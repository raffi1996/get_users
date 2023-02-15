import 'package:flutter/material.dart';

import 'constants/routes.dart';
import 'pages/dashboard/dashboard_page.dart';
import 'pages/user_history_page/user_history_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());

      case Routes.historyFacts:
        return MaterialPageRoute(builder: (_) => const UserHistoryPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}.'),
            ),
          ),
        );
    }
  }
}
