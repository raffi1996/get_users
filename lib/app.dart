import 'package:cat_trivia/pages/dashboard_sreen.dart';
import 'package:cat_trivia/router.dart';
import 'package:flutter/material.dart' hide Router;

import 'constants/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Get Users',
      initialRoute: Routes.dashboard,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
