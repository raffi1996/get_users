import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import 'widgets/splash_screen_logo.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => checkSession(context));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenLogo(),
    );
  }

  Future<void> checkSession(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (!mounted) return;
    Navigator.pushNamed(context, Routes.dashboard);
  }
}
