import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/injection_container.dart';
import 'package:sample_project/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:sample_project/presentation/bloc/search_movies/search_movies_state.dart';
import 'package:sample_project/presentation/widgets/movies_list_widget.dart';

class SearchMoviesScreen extends StatelessWidget {
  const SearchMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchMoviesBloc, SearchMoviesState>(
      bloc: BlocProvider.of<SearchMoviesBloc>(context),
      // listenWhen: (previous, current) => current is SearchMoviesState,
      // buildWhen: (previous, current) => current is! SearchMoviesActionState,
      listener: (context, state) {
        if (state is SearchMoviesButtonClickedState) {}
      },
      builder: (context, state) {
        if (state is SearchMoviesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchMoviesLoaded) {
          return MoviesListWidget(movies: state.movies);
        } else if (state is SearchMoviesError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: Text('Enter a movie title to search.'),
          );
        }
      },
    );
  }
}
