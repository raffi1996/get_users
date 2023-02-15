import 'package:flutter/material.dart';

import '../../../models/user_model/user_model.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/assets.dart';

class UserTile extends StatelessWidget {
  final UserModel user;

  const UserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  bool get hasAvatar => user.avatar != null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 5,
            color: AppColors.charcoal.withOpacity(.5),
          ),
        ],
      ),
      child: Row(
        children: [
          if (hasAvatar)
            user.avatar!.imageNetwork(
              width: 60,
              height: 60,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullName,
              ),
              Text(user.email),
              if (user.phoneNumber != null)
                Text(
                  user.phoneNumber!,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
