import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watch_it/core/network/end_points.dart';
import 'package:watch_it/core/resources/assets_manager.dart';
import 'package:watch_it/core/resources/color_manager.dart';
import 'package:watch_it/core/resources/values_manager.dart';
import 'package:watch_it/features/movies/domain/entities/movies_details.dart';
import 'package:watch_it/features/movies/domain/entities/trailer.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movies_cubit.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movise_state.dart';
import 'package:watch_it/features/movies/presentation/widgets/popular_details/show_credit_cast_details.dart';
import 'package:watch_it/features/movies/presentation/widgets/popular_details/show_similar_movies.dart';
import 'package:watch_it/features/movies/presentation/widgets/popular_details/web_view.dart';



class BuildMoviesPopularDetails extends StatelessWidget {
  final MoviesDetails model;

  const BuildMoviesPopularDetails({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesCubit, MoviesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MoviesCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  height: AppSize.s800,
                  alignment: AlignmentDirectional.topStart,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: 280,
                      fit: BoxFit.cover,
                      imageUrl: imageUrl(model.backdropPath.toString()),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: 170.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s700,
                  child: Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p10),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.originalTitle,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppSize.s20,
                                    ),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(AppSize.s8,),),
                                    child: CachedNetworkImage(
                                      width: AppSize.s150,
                                      height: AppSize.s250,
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          imageUrl(model.posterPath.toString()),
                                      placeholder: (context, url) =>
                                          Shimmer.fromColors(
                                        baseColor: Colors.grey[850]!,
                                        highlightColor: Colors.grey[800]!,
                                        child: Container(
                                          height: 270.0,
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                SizedBox(
                                  height: AppSize.s260,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: AppSize.s200,
                                        child: Row(
                                          children: [
                                            Text(
                                              '${model.releaseDate}, ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    fontSize: 15,
                                                  ),
                                            ),
                                            Text(
                                              '${model.productionCountries[0].iso31661.toString()}, ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    fontSize: 15,
                                                  ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                model.genres[0].name,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      fontSize: 15,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: AppSize.s10,
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: AppSize.s20,
                                            backgroundColor: ColorManager.red,
                                            child: CircleAvatar(
                                              radius: AppSize.s18,
                                              backgroundColor: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              child: Text(
                                                model.voteAverage
                                                    .round()
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      color:
                                                          ColorManager.sWhite,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: AppSize.s10,
                                          ),
                                          Container(
                                            width: AppSize.s25,
                                            height: AppSize.s25,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: ColorManager.green,
                                              ),
                                            ),
                                            child: Container(
                                              width: AppSize.s20,
                                              height: AppSize.s20,
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor),
                                              child: Center(
                                                child: Text(
                                                  model.originalLanguage,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color:
                                                            ColorManager.sWhite,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: AppSize.s10,
                                      ),
                                      Text(
                                        'Status',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      const SizedBox(
                                        height: AppSize.s5,
                                      ),
                                      Text(
                                        model.status,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: ColorManager.green),
                                      ),
                                      const SizedBox(
                                        height: AppSize.s20,
                                      ),
                                      Text(
                                        'Revenue',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      const SizedBox(
                                        height: AppSize.s5,
                                      ),
                                      Text(
                                        '${model.revenue}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: ColorManager.green),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Original Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: ColorManager.grey,
                                  ),
                            ),
                            Text(
                              model.originalTitle,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: AppSize.s20,
                            ),
                            Text(
                              'Overview',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: AppSize.s20,
                            ),
                            Text(
                              model.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: ColorManager.grey,
                                  ),
                            ),
                            const SizedBox(
                              height: AppSize.s20,
                            ),
                            Text(
                              model.overview,
                              style: const TextStyle(
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s20,
                            ),
                            Text(
                              'Trailers',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: AppSize.s20,
                            ),
                            //YouTube
                            SizedBox(
                              height: AppSize.s160,
                              child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    buildTrailerMovies(
                                        cubit.trailerResults[index], context),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 10.0,
                                ),
                                itemCount: cubit.trailerResults.length,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s20,
                            ),
                            Text(
                              'Top Billed Cast',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: AppSize.s20,
                            ),
                            ConditionalBuilder(
                              condition: cubit.getCredit != null,
                              builder: (context) => SizedBox(
                                height: AppSize.s270,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      ShowCreditCast(
                                    model: cubit.getCredit!.cast[index],
                                  ),
                                  itemCount: cubit.getCredit!.cast.length,
                                ),
                              ),
                              fallback: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s20,
                            ),
                            Text(
                              'Similar Movies',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: AppSize.s20,
                            ),
                            SizedBox(
                              height: AppSize.s300,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    ShowSimilarMovies(
                                  model: cubit.similarMovies[index],
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: AppSize.s20,
                                ),
                                itemCount: cubit.similarMovies.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

Widget buildTrailerMovies(TrailerResults model, context) => Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebViewScreen(model.key.toString()),
              ),
            );
          },
          child: Container(
            width: 205.0,
            height: 155.0,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(),
              shape: BoxShape.rectangle,
            ),
            child: Container(
              width: 100.0,
              height: 100.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(),
                //shape: BoxShape.rectangle,
              ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imageUrl(
                  MoviesCubit.get(context).moviesDetails!.posterPath.toString(),
                ),
                errorWidget: (context, url, error) => const Image(
                  image: AssetImage(ImageAssets.person),
                  color: ColorManager.sWhite,
                ),
              ),
            ),
          ),
        ),
      ],
    );
//MoviesCubit.get(context).moviesDetails!.posterPath
