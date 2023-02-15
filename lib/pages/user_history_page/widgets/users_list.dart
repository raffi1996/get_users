import 'package:flutter/material.dart';
import '../../../models/user_model/user_model.dart';
import 'user_tile.dart';

class UsersList extends StatelessWidget {
  final List<UserModel> users;

  const UsersList({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: users.length + 1,
        itemBuilder: (_, index) {
          if (index == users.length) {
            return const SizedBox(height: 75);
          }
          return UserTile(
            user: users[index],
          );
        },
      ),
    );
  }
}
