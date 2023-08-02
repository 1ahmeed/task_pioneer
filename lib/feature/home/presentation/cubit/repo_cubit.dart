import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pioneer/feature/home/domain/use_case/fetch_repos_use_case.dart';
import '../../domain/entitiy/repo_entity.dart';
import '../../domain/repo/repo.dart';

part 'repo_state.dart';

class RepoCubit extends Cubit<RepoState> {
  RepoCubit({required this.fetchReposUseCase}) : super(RepoInitial());

  static RepoCubit? get(context) => BlocProvider.of(context);

  FetchReposUseCase fetchReposUseCase;
  String? valueOfController;

  final List<String> itemsResult = ["10", "50", "100", "default"];
  final List<String> itemsLang = [
    "Dart",
    "HTML",
    "CSS",
    "JavaScript",
    "Go",
    "Assembly",
    "default"
  ];

  String? numOfResult;
  String? language;

  DropdownMenuItem<String> buildMenuItems(String item) => DropdownMenuItem(
      value: item,
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ));

  DropdownMenuItem<String> buildLangItems(String lang) => DropdownMenuItem(
      value: lang,
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Text(
          lang,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ));

  String changeDropResult(String value) {
    numOfResult = value;
    emit(RepoChangeDropMenuSuccessState());
    return numOfResult!;
  }

  String changeDropLang(String value) {
    language = value;
    emit(RepoChangeDropMenuSuccessState());
    return language!;
  }

  Future<void> fetchRepos({SearchRequest? searchRequest}) async {
    emit(RepoLoadingState());
    var result = await fetchReposUseCase.call(searchRequest);
    result.fold((failure) {
      emit(RepoErrorState(failure.errorMessage));
    }, (books) {
      emit(RepoSuccessState(books));
    });
  }
}
