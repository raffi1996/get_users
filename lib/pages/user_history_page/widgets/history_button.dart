import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_users/constants/app_texts.dart';
import 'package:get_users/utils/widget_extension.dart';

class HistoryButton extends StatelessWidget {
  final AsyncValueSetter<BuildContext> onTap;

  const HistoryButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: MediaQuery.of(context).padding.bottom + 24,
        ),
        child: ElevatedButton(
          onPressed: () async {
            await onTap(context);
          },
          child: const Text(
            AppTexts.deleteAll,
          ),
        ).expandedHorizontally(),
      ),
    );
  }
}
