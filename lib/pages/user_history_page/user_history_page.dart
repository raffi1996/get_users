import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_users/constants/app_texts.dart';
import 'package:get_users/store/user_hystory_state/user_history_bloc.dart';

import '../../databases/hive/hive.dart';
import '../../themes/app_colors.dart';
import 'widgets/history_button.dart';
import 'widgets/users_list.dart';

class UserHistoryPage extends StatelessWidget {
  const UserHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHistoryBloc()..add(LoadUserHistoryEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppTexts.userHistoryTitle,
          ),
        ),
        body: Stack(
          children: [
            BlocBuilder<UserHistoryBloc, UserHistoryState>(
              builder: (_, state) {
                if (state is UserHistoryLoadingState) {
                  return Center(
                    heightFactor: MediaQuery.of(context).size.height / 100,
                    child: const CircularProgressIndicator(
                      color: AppColors.yellow,
                    ),
                  );
                } else if (state is UserHistoryLoadedState) {
                  return UsersList(
                    users: state.users,
                  );
                } else if (state is UserHistoryErrorState) {
                  return Center(
                    child: Text(
                      state.error.toString(),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            HistoryButton(
              onTap: _deleteUsers,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteUsers(BuildContext context) async {
    await UserDB.delete();
    BlocProvider.of<UserHistoryBloc>(context).add(LoadUserHistoryEvent());
  }
}
