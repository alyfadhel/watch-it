import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/core/observer/observer.dart';
import 'package:watch_it/core/resources/theme_manager.dart';
import 'package:watch_it/core/service/service_locator.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movies_cubit.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movise_state.dart';
import 'package:watch_it/features/movies/presentation/screens/movies.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> sl<MoviesCubit>()..getPopularMovies()..getTopRatedMovies()..getNowPlayingMovies()..getUpcomingMovies(),
      child: BlocConsumer<MoviesCubit,MoviesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: getApplicationDarkTheme(),
            home: const MoviesScreen(),
          );
        },
      ),
    );
  }
}


