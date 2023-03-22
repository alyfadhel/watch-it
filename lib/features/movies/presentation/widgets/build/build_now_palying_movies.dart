import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watch_it/core/network/end_points.dart';
import 'package:watch_it/core/resources/color_manager.dart';
import 'package:watch_it/core/resources/values_manager.dart';
import 'package:watch_it/features/movies/domain/entities/movies.dart';

class BuildNowPlayingMovies extends StatelessWidget {
  final MoviesResults model;

  const BuildNowPlayingMovies({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20)),
              child: CachedNetworkImage(
                width: AppSize.s350,
                height: AppSize.s220,
                fit: BoxFit.fill,
                imageUrl: imageUrl(model.backdropPath.toString()),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(AppSize.s8),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Row(
             //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                     top: AppSize.s60,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.sWhite,
                    ),
                    borderRadius: BorderRadius.circular(AppSize.s10,)
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10,)),
                    child: CachedNetworkImage(
                      width: AppSize.s100,
                      height: AppSize.s150,
                      fit: BoxFit.fill,
                      imageUrl: imageUrl(model.posterPath),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.sWhite,
                            borderRadius: BorderRadius.circular(AppSize.s8),
                            border: Border.all(
                              color: ColorManager.sWhite,
                              width: AppSize.s20
                            )
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppSize.s10,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: AppSize.s80,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: AppSize.s200,
                        child: Text(
                          model.originalTitle,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.sWhite,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s15,
                      ),
                      SizedBox(
                        width: AppSize.s220,
                        child: Text(
                          model.overview,
                          maxLines: 4,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: AppSize.s5,
        ),
        SizedBox(
          width: AppSize.s350,
          child: Text(
            model.originalTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorManager.sWhite,
                ),
          ),
        ),
      ],
    );
  }
}
