import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/core/resources/values_manager.dart';
import 'package:watch_it/core/service/service_locator.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movies_cubit.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movise_state.dart';
import 'package:watch_it/features/movies/presentation/widgets/popular_details/build_movies_popular_details.dart';



class ShowPopularDetailsScreen extends StatelessWidget {
  final int id;

  const ShowPopularDetailsScreen({Key? key, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      sl<MoviesCubit>()
        ..getMoviesPopularDetails(id: id)
        ..getCreditCast(id: id)
        ..getSimilarMovies(id: id)
        ..getTrailerMovies(id: id),
      child: BlocConsumer<MoviesCubit, MoviesState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = MoviesCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black.withOpacity(.6),
              elevation: AppSize.s10,
            ),
            extendBodyBehindAppBar: true,
            extendBody: true,
            body: ConditionalBuilder(
              condition: cubit.moviesDetails != null,
              builder: (context) =>
                  BuildMoviesPopularDetails(model: cubit.moviesDetails!),
              fallback: (context) =>
              const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
