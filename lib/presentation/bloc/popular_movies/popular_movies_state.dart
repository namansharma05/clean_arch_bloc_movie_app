import 'package:sample_project/domain/entities/movie.dart';

abstract class PopularMoviesState {}

abstract class PopularMoviesActionState extends PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> movies;

  PopularMoviesLoaded(this.movies);
}

class PopularMoviesError extends PopularMoviesState {
  final String errorMessage;

  PopularMoviesError(this.errorMessage);
}
