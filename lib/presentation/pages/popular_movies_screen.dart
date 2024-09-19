import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:sample_project/presentation/bloc/popular_movies/popular_movies_state.dart';
import 'package:sample_project/presentation/widgets/movies_list_widget.dart';

class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularMoviesBloc, PopularMoviesState>(
      listenWhen: (previous, current) => current is PopularMoviesActionState,
      buildWhen: (previous, current) => current is! PopularMoviesActionState,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is PopularMoviesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PopularMoviesLoaded) {
          return MoviesListWidget(movies: state.movies);
        } else if (state is PopularMoviesError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
