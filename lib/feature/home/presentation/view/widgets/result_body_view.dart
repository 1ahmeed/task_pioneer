import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pioneer/core/widgets/custom_error_widget.dart';
import 'package:task_pioneer/feature/home/domain/repo/repo.dart';
import 'package:task_pioneer/feature/home/presentation/cubit/repo_cubit.dart';
import 'package:task_pioneer/feature/home/presentation/view/widgets/repository_item.dart';

class ResultBodyView extends StatelessWidget {
  const ResultBodyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RepoCubit, RepoState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is RepoSuccessState) {
            if (state.reposList.isEmpty) {
              return const Scaffold(
                body: Center(
                  child: Text(
                    "No Result",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              );
            }
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        DropdownButton<String>(
                          hint: const Text("choose num results"),
                          elevation: 100,
                          value: RepoCubit.get(context)?.numOfResult,
                          items: RepoCubit.get(context)!
                              .itemsResult
                              .map(
                            RepoCubit.get(context)!.buildMenuItems
                          )
                              .toList(),
                          onChanged: (value) {
                            RepoCubit.get(context)?.changeDropResult(value!);
                            RepoCubit.get(context)?.fetchRepos(
                                searchRequest: SearchRequest(
                              date: RepoCubit.get(context)!.valueOfController!,
                              numOfResult: RepoCubit.get(context)?.numOfResult,
                              language: RepoCubit.get(context)?.language,
                            ));
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        DropdownButton<String>(
                          hint: const Text("choose Language"),
                          elevation: 200,
                          value: RepoCubit.get(context)?.language,
                          items: RepoCubit.get(context)
                              ?.itemsLang
                              .map(
                            RepoCubit.get(context)!.buildLangItems
                          )
                              .toList(),
                          onChanged: (value) {
                            RepoCubit.get(context)?.changeDropLang(value!);
                            RepoCubit.get(context)?.fetchRepos(
                                searchRequest: SearchRequest(
                              date: RepoCubit.get(context)!.valueOfController!,
                              numOfResult: RepoCubit.get(context)?.numOfResult,
                              language: RepoCubit.get(context)?.language,
                            ));
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.reposList.length,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: RepositoryItem(
                                    reposList: state.reposList[index]),
                              )),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is RepoErrorState) {
            return Scaffold(
              body: CustomErrorWidget(errorMessage: state.errorMessage),
            );
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }

}
