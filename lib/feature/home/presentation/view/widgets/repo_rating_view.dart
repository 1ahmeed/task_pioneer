import 'package:flutter/material.dart';
import 'package:task_pioneer/feature/home/domain/entitiy/repo_entity.dart';


class RepoRating  extends StatelessWidget {
   const RepoRating({
    required this.reposList,
    Key? key, }) : super(key: key);
  final RepoEntity reposList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children:   [
            Text(
              reposList.languageRepo!,
            ),
            const SizedBox(width: 20,),
             const Icon(Icons.star,color: Color(0xffFFDD4F),size: 14,),
            const  SizedBox(width: 3,),
            Text(reposList.starsRepo!.toString()),
              const SizedBox(width: 10,),
          ],
        ),
        const SizedBox(height: 10,),
        const Text("Create At"),
        Opacity(
          opacity: .5,
          child: Text(reposList.createRepo.toString() ),
        )
      ],
    );
  }
}
