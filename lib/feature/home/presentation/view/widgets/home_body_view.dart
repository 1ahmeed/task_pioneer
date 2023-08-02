import 'package:flutter/material.dart';
import 'package:task_pioneer/core/function/custom_navigate.dart';
import 'package:task_pioneer/core/widgets/custom_button.dart';
import 'package:task_pioneer/feature/home/domain/repo/repo.dart';
import 'package:task_pioneer/feature/home/presentation/cubit/repo_cubit.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../result_screen.dart';

class HomeBodyView extends StatelessWidget {
  HomeBodyView({Key? key,}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomTextFormField(
                controller: searchController,
                keyboard: TextInputType.datetime,
                prefixIcon: Icons.search,
                validate: (value) {
                  if (value!.isEmpty) {
                    return "please enter the date";
                  } else {
                    return null;
                  }
                },
                hintText: "Enter The Year",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomButton(
                backgroundColor: Colors.green,
                text: "search",
                textColor: Colors.white,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    RepoCubit.get(context)
                        ?.fetchRepos(searchRequest: SearchRequest(
                        date:searchController.text
                    ));
                    RepoCubit.get(context)?.valueOfController=searchController.text;
                    navigatorTo(context, const ResultScreen());
                    searchController.clear();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
