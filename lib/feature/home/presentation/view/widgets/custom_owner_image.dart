import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../domain/entitiy/repo_entity.dart';


class CustomOwnerImage extends StatelessWidget {
  const  CustomOwnerImage({
  required this.reposList  ,
    Key? key}) : super(key: key);
  final RepoEntity reposList;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: reposList.photoRepo!,
            errorWidget: (context, url, error) => const Icon(Icons.error_outline),
            placeholder:(context, url) => const CustomLoadingIndicator()

        ),
      ),
    );
  }
}
