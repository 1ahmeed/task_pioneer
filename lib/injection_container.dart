import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_pioneer/feature/home/domain/use_case/fetch_repos_use_case.dart';

import 'core/utils/api_service.dart';
import 'feature/home/data/data_sources/remote_data_source/repo_remote_data_source.dart';
import 'feature/home/data/repo_impl/repository_repo_impl.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<FetchReposUseCase>(FetchReposUseCase(
      repositoryRepo: RepositoryRepoImpl(
          repoRemoteDataSource:
              RepoRemoteDataSourceImpl(apiService: getIt.get<ApiService>()))));
}
