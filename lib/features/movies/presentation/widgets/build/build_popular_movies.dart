import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watch_it/core/network/end_points.dart';
import 'package:watch_it/core/resources/color_manager.dart';
import 'package:watch_it/core/resources/values_manager.dart';
import 'package:watch_it/features/movies/domain/entities/movies.dart';

class BuildPopularMovies extends StatelessWidget {
  final MoviesResults model;
  const BuildPopularMovies({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius:
          const BorderRadius.all(Radius.circular(8.0)),
          child: CachedNetworkImage(
            width: AppSize.s120,
            fit: BoxFit.cover,
            imageUrl: imageUrl(model.posterPath),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: AppSize.s170,
                width: AppSize.s120,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(AppSize.s8),
                ),
              ),
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          ),
        ),
        const SizedBox(
          height: AppSize.s5,
        ),
        SizedBox(
          width: AppSize.s100,
          child: Text(
            model.originalTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ColorManager.sWhite,
              fontSize: AppSize.s14
            ),
          ),
        ),
      ],
    );
  }
}
