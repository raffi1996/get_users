import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';

extension ExtensionOnString on String {
  ExtendedImage imageNetwork({
    double? height,
    double? width,
    double? errorHeight,
    double? errorWidth,
  }) {
    return ExtendedImage.network(
      this,
      width: width,
      height: height,
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return const SizedBox(
              height: 300,
              width: 300,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          case LoadState.completed:
            return state.completedWidget;
          case LoadState.failed:
            return const SizedBox();
        }
      },
    );
  }
}
