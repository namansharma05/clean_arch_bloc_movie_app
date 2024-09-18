import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/injection_container.dart';
import 'package:sample_project/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:sample_project/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:sample_project/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:sample_project/presentation/bloc/search_movies/search_movies_event.dart';
import 'package:sample_project/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:sample_project/presentation/bloc/trending_movies/trending_movies_event.dart';
import 'package:sample_project/presentation/pages/search_movies_screen.dart';

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
      debugShowCheckedModeBanner: false,
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
          BlocProvider(
            create: (context) => getIt<SearchMoviesBloc>()
              ..add(
                FetchSearchMovies('Avengers'),
              ),
          ),
        ],
        child: SearchMoviesScreen(),
      ),
    );
  }
}
