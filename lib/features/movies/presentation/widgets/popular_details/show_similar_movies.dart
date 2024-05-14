import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watch_it/core/network/end_points.dart';
import 'package:watch_it/core/resources/assets_manager.dart';
import 'package:watch_it/core/resources/color_manager.dart';
import 'package:watch_it/core/resources/values_manager.dart';
import 'package:watch_it/features/movies/domain/entities/simailr_movies.dart';

class ShowSimilarMovies extends StatelessWidget {
  final Results model;

  const ShowSimilarMovies({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
            ),
            child: ClipRRect(
              child: CachedNetworkImage(
                width: AppSize.s120,
                height: AppSize.s150,
                fit: BoxFit.cover,
                imageUrl: imageUrl(model.posterPath.toString()),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    width: 252,
                    height: 151,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                  ),
                ),
                errorWidget: (context, url, error) => const Image(
                  image: AssetImage(
                    ImageAssets.person,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: AppSize.s100,
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorManager.sWhite
              ),
            ),
          ),
        ],
      ),
    );
  }
}
