import 'package:cat_trivia/pages/history_facts_screen.dart';
import 'package:cat_trivia/pages/dashboard_sreen.dart';
import 'package:flutter/material.dart';

import 'constants/routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      case Routes.historyFacts:
        return MaterialPageRoute(builder: (_) => const HistoryFactsScreen());

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
