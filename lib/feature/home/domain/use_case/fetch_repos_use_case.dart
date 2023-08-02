import 'package:dartz/dartz.dart';
import 'package:task_pioneer/core/errors/failuer.dart';
import 'package:task_pioneer/core/use_cases/use_case.dart';
import 'package:task_pioneer/feature/home/domain/entitiy/repo_entity.dart';
import 'package:task_pioneer/feature/home/domain/repo/repo.dart';

class FetchReposUseCase extends UseCase<List<RepoEntity>, SearchRequest> {
  final RepositoryRepo repositoryRepo;

  FetchReposUseCase({required this.repositoryRepo});

  @override
  Future<Either<Failures, List<RepoEntity>>> call(
      [SearchRequest? param]) async {
    return await repositoryRepo.fetchRepos(
        searchRequest: SearchRequest(
            date: param!.date,
            numOfResult: param.numOfResult,
            language: param.language));
  }
}

class SearchRequestUseCase {
  final String date;
  String numOFResult = "default";
  String? language = "default";

  SearchRequestUseCase(
      {required this.date, required this.numOFResult, this.language});
}
