part of 'repo_cubit.dart';

@immutable
abstract class RepoState {}

class RepoInitial extends RepoState {}

class RepoChangeDropMenuSuccessState extends RepoState {}

class RepoLoadingState extends RepoState {}

class RepoSuccessState extends RepoState {
  final List<RepoEntity> reposList;

  RepoSuccessState(this.reposList);
}

class RepoErrorState extends RepoState {
  final String errorMessage;

  RepoErrorState(this.errorMessage);
}
