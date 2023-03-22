import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/core/resources/color_manager.dart';
import 'package:watch_it/core/resources/strings_manager.dart';
import 'package:watch_it/core/resources/values_manager.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movies_cubit.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movise_state.dart';
import 'package:watch_it/features/movies/presentation/screens/search/search_screen.dart';
import 'package:watch_it/features/movies/presentation/screens/see_all/see_all_popular_screen.dart';
import 'package:watch_it/features/movies/presentation/screens/see_all/see_all_top_rated_screen.dart';
import 'package:watch_it/features/movies/presentation/screens/see_all/see_all_upcoming_screen.dart';
import 'package:watch_it/features/movies/presentation/widgets/build/build_now_palying_movies.dart';
import 'package:watch_it/features/movies/presentation/widgets/build/build_popular_movies.dart';
import 'package:watch_it/features/movies/presentation/widgets/build/build_top_rated_movies.dart';
import 'package:watch_it/features/movies/presentation/widgets/build/build_upcoming_movies.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //bool enabled = true;
    return BlocConsumer<MoviesCubit, MoviesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MoviesCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.sBlack,
          appBar: AppBar(
            elevation: AppSize.s0,
            centerTitle: true,
            backgroundColor: ColorManager.sBlack,
            leading: const Icon(
              Icons.menu,
            ),
            title: Text(
              AppStrings.home,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: ColorManager.sWhite),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),),);
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Popular',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: ColorManager.sWhite,
                            ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          debugPrint('popular');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeAllPopularScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: AppSize.s50,
                          height: AppSize.s30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSize.s5,
                            ),
                            color: ColorManager.sWhite,
                          ),
                          child: Center(
                            child: Text(
                              'All',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: ColorManager.sBlack,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  SizedBox(
                    height: AppSize.s250,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => BuildPopularMovies(
                        model: cubit.results[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: AppSize.s10,
                      ),
                      itemCount: cubit.results.length,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Top Rated',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: ColorManager.sWhite,
                            ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SeeAllTopRatedScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: AppSize.s50,
                          height: AppSize.s30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSize.s5,
                            ),
                            color: ColorManager.sWhite,
                          ),
                          child: Center(
                            child: Text(
                              'All',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: ColorManager.sBlack,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  SizedBox(
                    height: AppSize.s250,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => BuildTopRatedMovies(
                        model: cubit.results[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: AppSize.s10,
                      ),
                      itemCount: cubit.results.length,
                    ),
                  ),
                  Text(
                    'Now Playing',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorManager.sWhite,
                        ),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  SizedBox(
                    height: AppSize.s300,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => BuildNowPlayingMovies(
                        model: cubit.results[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: AppSize.s10,
                      ),
                      itemCount: cubit.results.length,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Upcoming',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: ColorManager.sWhite,
                            ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SeeAllUpcomingScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: AppSize.s50,
                          height: AppSize.s30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSize.s5,
                            ),
                            color: ColorManager.sWhite,
                          ),
                          child: Center(
                            child: Text(
                              'All',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: ColorManager.sBlack,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  SizedBox(
                    height: AppSize.s250,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => BuildUpcomingMovies(
                        model: cubit.results[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: AppSize.s10,
                      ),
                      itemCount: cubit.results.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
