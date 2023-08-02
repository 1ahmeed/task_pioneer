import 'package:flutter/material.dart';
import 'package:task_pioneer/feature/home/presentation/view/widgets/repo_rating_view.dart';

import '../../../domain/entitiy/repo_entity.dart';
import 'custom_owner_image.dart';

class RepositoryItem extends StatelessWidget {
   const RepositoryItem({
    required this.reposList,
    Key? key,
  }) : super(key: key);
final RepoEntity reposList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Row(
        children: [
           CustomOwnerImage(reposList: reposList),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child:  Text(
                      reposList.nameRepo!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child:  Text(
                      reposList.descriptionRepo!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                const SizedBox(
                  height: 15,
                ),
                 RepoRating(reposList: reposList,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
