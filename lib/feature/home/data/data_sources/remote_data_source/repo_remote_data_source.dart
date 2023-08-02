import 'package:task_pioneer/feature/home/domain/repo/repo.dart';

import '../../../../../core/utils/api_service.dart';

import '../../../domain/entitiy/repo_entity.dart';
import '../../model/repo_model.dart';

abstract class RepoRemoteDataSource {
  Future<List<RepoEntity>> fetchRepos({required SearchRequest? searchRequest});
}

class RepoRemoteDataSourceImpl extends RepoRemoteDataSource {
  final ApiService apiService;

  RepoRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<RepoEntity>> fetchRepos(
      {required SearchRequest? searchRequest}) async {
    var data = await apiService.get(
        endPoint:
            'repositories?q=created:>=${searchRequest!.date}+language:${searchRequest.language}&sort=stars&order=desc&per_page=${searchRequest.numOfResult}');
    List<RepoEntity> reposList = getReposList(data);
    return reposList;
  }
}

List<RepoEntity> getReposList(Map<String, dynamic>? data) {
  List<RepoEntity> reposList = [];
  for (var item in data!['items']) {
    reposList.add(RepoModel.fromJson(item));
  }
  return reposList;
}
