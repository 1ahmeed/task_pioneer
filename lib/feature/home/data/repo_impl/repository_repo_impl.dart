import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_pioneer/feature/home/domain/entitiy/repo_entity.dart';
import 'package:task_pioneer/feature/home/domain/repo/repo.dart';

import '../../../../core/errors/failuer.dart';
import '../data_sources/remote_data_source/repo_remote_data_source.dart';

class RepositoryRepoImpl implements RepositoryRepo {
  final RepoRemoteDataSource repoRemoteDataSource;

  RepositoryRepoImpl({
    required this.repoRemoteDataSource,
  });

  @override
  Future<Either<Failures, List<RepoEntity>>> fetchRepos({SearchRequest? searchRequest}) async {
    try {
      List<RepoEntity> reposList = await repoRemoteDataSource.fetchRepos(searchRequest: searchRequest);
      return right(reposList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
