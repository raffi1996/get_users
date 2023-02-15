import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_users/utils/assets.dart';
import '../../../themes/app_colors.dart';


class UserContent extends StatelessWidget {
  final String? avatar;
  final String fullName;
  final String email;
  final String? phoneNumber;

  const UserContent({
    Key? key,
    required this.fullName,
    required this.email,
    this.phoneNumber,
    this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 2),
            blurRadius: 15,
            color: AppColors.charcoal.withOpacity(.3),
          ),
        ],
      ),
      child: Column(
        children: [

          if (avatar != null) avatar!.imageNetwork(),
          const SizedBox(height: 20),
          Text(
            fullName,
            //style: context.theme.bodyText1.bold,
          ),
          const SizedBox(height: 6),
          Text(
            email,
            //style: context.theme.bodyText2.bold,
          ),
          const SizedBox(height: 6),
          if (phoneNumber != null)
            Text(
              phoneNumber!,
            ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
