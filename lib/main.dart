import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/injection_container.dart';
import 'package:sample_project/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:sample_project/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:sample_project/presentation/bloc/trending_movies/trending_movies_event.dart';
import 'package:sample_project/presentation/pages/popular_movies_screen.dart';
import 'package:sample_project/presentation/pages/trending_movies_screen.dart';

import 'presentation/bloc/popular_movies/popular_movies_event.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<PopularMoviesBloc>()
              ..add(
                FetchPopularMovies(),
              ),
          ),
          BlocProvider(
            create: (context) => getIt<TrendingMoviesBloc>()
              ..add(
                FetchTrendingMovies(),
              ),
          ),
        ],
        child: TrendingMoviesScreen(),
      ),
    );
  }
}
