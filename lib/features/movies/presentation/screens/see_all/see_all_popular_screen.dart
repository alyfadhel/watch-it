import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watch_it/core/network/end_points.dart';
import 'package:watch_it/core/resources/color_manager.dart';
import 'package:watch_it/core/resources/strings_manager.dart';
import 'package:watch_it/core/resources/values_manager.dart';
import 'package:watch_it/core/service/service_locator.dart';
import 'package:watch_it/features/movies/domain/entities/movies.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movies_cubit.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movise_state.dart';
import 'package:watch_it/features/movies/presentation/widgets/see_all/build_see_all_popular.dart';

class SeeAllPopularScreen extends StatelessWidget {
  const SeeAllPopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesCubit>()..getPopularMovies(),
      child: BlocConsumer<MoviesCubit, MoviesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MoviesCubit.get(context);
          if (state is GetPopularMoviesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetPopularMoviesSuccessState) {
            return Scaffold(
              backgroundColor: ColorManager.sBlack,
              appBar: AppBar(
                backgroundColor: ColorManager.sBlack,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorManager.sWhite,
                  ),
                ),
                elevation: AppSize.s0,
                title: Text(
                  AppStrings.popular,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: ColorManager.sWhite),
                ),
              ),
              body: GridView.count(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                controller: cubit.scrollController,
                childAspectRatio: 2 / 3.6,
                crossAxisCount: 2,
                children: List.generate(
                  cubit.isLoadMore
                      ? cubit.results.length + 2
                      : cubit.results.length,
                  (index) {
                    if (index >= cubit.results.length) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return BuildSeeAllPopular(
                        model: cubit.results[index],
                      );
                    }
                  },
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
