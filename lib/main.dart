import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jenosize/app.dart';
import 'package:jenosize/application/bloc/restuarant_bloc.dart';
import 'package:jenosize/core/network.dart';
import 'package:jenosize/infrastructure/repositories/restaurant_repository_fix.dart';
import 'package:jenosize/infrastructure/source/github/github_datasource.dart';
import 'package:jenosize/infrastructure/source/local/local_datasource.dart';

import 'application/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalDataSource.initialize();

  runApp(
    MultiRepositoryProvider(
      providers: [
        ///
        /// Services
        ///
        RepositoryProvider<NetworkManager>(
          create: (context) => NetworkManager(),
        ),

        ///
        /// Data sources
        ///
        RepositoryProvider<LocalDataSource>(
          create: (context) => LocalDataSource(),
        ),
        RepositoryProvider<GithubDataSource>(
          create: (context) => GithubDataSource(context.read<NetworkManager>()),
        ),

        ///
        /// Repositories
        ///
        ///
        RepositoryProvider<RestuarantRepositoryFix>(
          create: (context) => RestuarantDefaultRepositoryFix(
            localDataSource: context.read<LocalDataSource>(),
            githubDataSource: context.read<GithubDataSource>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          ///
          /// BLoCs
          ///
          BlocProvider<RestuarantBloc>(
            create: (context) =>
                RestuarantBloc(context.read<RestuarantRepositoryFix>()),
          ),

          ///
          /// Theme Cubit
          ///
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          )
        ],
        child: const JenosizeApp(),
      ),
    ),
  );
}
