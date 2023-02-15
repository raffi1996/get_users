import 'package:flutter/material.dart';
import 'package:get_users/constants/app_texts.dart';

import '../../databases/hive/hive.dart';

import '../../models/user_model/user_model.dart';
import 'widgets/history_button.dart';
import 'widgets/users_list.dart';

class UserHistoryPage extends StatefulWidget {
  const UserHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UserHistoryPage> createState() => _UserHistoryPageState();
}

class _UserHistoryPageState extends State<UserHistoryPage> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    users = UserDB.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppTexts.userHistoryTitle,
        ),
      ),
      body: Stack(
        children: [
          UsersList(
            users: users,
          ),
          HistoryButton(
            onTap: deleteAll,
          ),
        ],
      ),
    );
  }

  void deleteAll() {
    UserDB.delete();
    setState(
      () => users = [],
    );
  }
}
