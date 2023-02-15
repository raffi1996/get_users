import 'package:flutter/material.dart';
import 'package:get_users/constants/app_texts.dart';
import 'package:get_users/utils/widget_extension.dart';

import '../../../constants/routes.dart';

class DashboardFooter extends StatefulWidget {
  final Function(BuildContext) getNewUser;

  const DashboardFooter({
    Key? key,
    required this.getNewUser,
  }) : super(key: key);

  @override
  State<DashboardFooter> createState() => _DashboardFooterState();
}

class _DashboardFooterState extends State<DashboardFooter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: () {
                widget.getNewUser(context);
              },
              child: const Text(
                AppTexts.loadNewUser,
                //style: context.theme.button2.white,
              ),
            ).expandedHorizontally(),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.green,
                ),
              ),
              child: const Text(
                AppTexts.history,
                //style: context.theme.button2.white,
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.historyFacts,
                );
              },
            ).expandedHorizontally(),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}
