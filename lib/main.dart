import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'bloc/users_bloc.dart';
import 'bloc/user_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => UsersBloc()..add(const UsersRequested()),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state.status == UsersStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: state.users
                .map(
                  (u) => ListTile(
                    title: Text(u.name),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserPage(id: u.id),
                      ));
                    },
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(UserRequested(id: id)),
      child: const UserView(),
    );
  }
}

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.status == UsersStatus.loading || state.user == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(child: Text(state.toString()));
        },
      ),
    );
  }
}
