import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/routes.dart';
import '../store/auth_state/auth_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Get User',
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserLoadedState) {
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
                        Column(
                          children: [
                            Image.network(
                              state.user.avatar!,
                              loadingBuilder: (_, child, event) {
                                if (event == null) {
                                  return child;
                                } else {
                                  return const SizedBox(
                                    height: 348,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.green,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            Text(
                              '${state.user.firstName!} ${state.user.lastName!}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              state.user.email!,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              state.user.phoneNumber!,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        getNewUser(context);
                                      },
                                      child: const Text(
                                        'Load new User',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.green,
                                        ),
                                      ),
                                      child: const Text(
                                        'History',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.historyFacts,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            if (state is UserErrorState) {
              return Center(
                child: Text(
                  state.error.toString(),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  void getNewUser(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(LoadUserEvent());
  }
}
