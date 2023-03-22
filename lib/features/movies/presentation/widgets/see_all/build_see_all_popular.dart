import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watch_it/core/network/end_points.dart';
import 'package:watch_it/core/resources/assets_manager.dart';
import 'package:watch_it/core/resources/color_manager.dart';
import 'package:watch_it/core/resources/values_manager.dart';
import 'package:watch_it/features/movies/domain/entities/movies.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movies_cubit.dart';
import 'package:watch_it/features/movies/presentation/screens/show_popular_movies_details_screen/show_popular_details_screen.dart';

class BuildSeeAllPopular extends StatelessWidget {
  final MoviesResults model;
  const BuildSeeAllPopular({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        AppPadding.p8,
      ),
      child: InkWell(
        onTap: ()
        {
          debugPrint(model.id.toString());
          Navigator.push(context, MaterialPageRoute(builder: (context) => ShowPopularDetailsScreen(id: model.id,),));
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: CachedNetworkImage(
                width: 550.0,
                imageUrl: imageUrl(model.posterPath),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    // height: 170.0,
                    // width: 150.0,
                    // decoration: BoxDecoration(
                    //   color: Colors.black,
                    //   borderRadius: BorderRadius.circular(8.0),
                    // ),
                  ),
                ),
                errorWidget: (context, url, error) =>  const Image(
                  width: 550,
                  height: 270,
                  color: ColorManager.sWhite,
                  image: AssetImage(
                    ImageAssets.person,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              model.originalTitle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.sWhite, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
