import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:sample_project/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'package:sample_project/presentation/widgets/movies_list_widget.dart';

class TrendingMoviesScreen extends StatelessWidget {
  const TrendingMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TrendingMoviesLoaded) {
            return MoviesListWidget(movies: state.movies);
          } else if (state is TrendingMoviesError) {
            return Center(
                child: Text(
              state.errorMessage,
            ));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
