import 'package:sample_project/domain/entities/movie.dart';

abstract class SearchMoviesState {}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesLoading extends SearchMoviesState {}

class SearchMoviesLoaded extends SearchMoviesState {
  final List<Movie> movies;

  SearchMoviesLoaded(this.movies);
}

class SearchMoviesError extends SearchMoviesState {
  final String errorMessage;

  SearchMoviesError(this.errorMessage);
}
