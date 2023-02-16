import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/app_texts.dart';
import '../../store/auth_state/auth_bloc.dart';
import '../../themes/app_colors.dart';
import 'widgets/dashboard_footer.dart';
import 'widgets/user_content.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppTexts.dashboardTitle,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 100,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (state is UserLoadingState)
                        Center(
                          heightFactor:
                              MediaQuery.of(context).size.height / 100,
                          child: const CircularProgressIndicator(
                            color: AppColors.yellow,
                          ),
                        )
                      else if (state is UserLoadedState)
                        Center(
                          child: UserContent(
                            avatar: state.user.avatar,
                            fullName: state.user.fullName,
                            email: state.user.email,
                            phoneNumber: state.user.phoneNumber,
                          ),
                        ),
                      if (state is UserErrorState)
                        Center(
                          child: Text(
                            state.error.toString(),
                          ),
                        ),
                      DashboardFooter(
                        getNewUser: _getNewUser,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _getNewUser(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(LoadUserEvent());
  }
}
