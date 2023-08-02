import 'package:dartz/dartz.dart';
import 'package:task_pioneer/core/errors/failuer.dart';
import 'package:task_pioneer/feature/home/domain/entitiy/repo_entity.dart';

abstract class RepositoryRepo {
  Future<Either<Failures, List<RepoEntity>>> fetchRepos(
      {SearchRequest searchRequest});
}

class SearchRequest{
  final String date;
   String? numOfResult="default";
   String? language="default";

  SearchRequest({required this.date,this.numOfResult,this.language});
}