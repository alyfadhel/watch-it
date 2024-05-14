import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/core/network/end_points.dart';
import 'package:watch_it/core/observer/observer.dart';
import 'package:watch_it/core/resources/theme_manager.dart';
import 'package:watch_it/core/service/service_locator.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movies_cubit.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movise_state.dart';
import 'package:watch_it/features/movies/presentation/screens/movies.dart';
import 'package:watch_it/features/user/login/login_screen.dart';
import 'package:watch_it/features/user/network/local/cache_helper.dart';
import 'package:watch_it/features/user/network/remote/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await ServiceLocator().init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  token = CacheHelper.getData(key: 'token');
  debugPrint(token.toString());

  Widget widget;

  if (token != null) {
    widget = const MoviesScreen();
  } else {
    widget = const LoginScreen();
  }
  runApp(
    MyApp(
      startWidget: widget,
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key,required this.startWidget,});

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
            home: startWidget,
          );
        },
      ),
    );
  }
}


