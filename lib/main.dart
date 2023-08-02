import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pioneer/core/utils/app_routes.dart';
import 'package:task_pioneer/feature/home/presentation/cubit/repo_cubit.dart';
import 'package:task_pioneer/injection_container.dart';

import 'bloc_observer.dart';
import 'feature/home/domain/use_case/fetch_repos_use_case.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepoCubit(
        fetchReposUseCase:getIt.get<FetchReposUseCase>()
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,

      ),
    );
  }
}


