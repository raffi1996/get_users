import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get_users/constants/app_texts.dart';

import '../../../utils/assets.dart';

class SplashScreenLogo extends StatelessWidget {
  const SplashScreenLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExtendedImage.asset(
              Assets.splashScreen,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              AppTexts.splashScreenText,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
