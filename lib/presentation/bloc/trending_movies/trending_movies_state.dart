import 'package:sample_project/domain/entities/movie.dart';

abstract class TrendingMoviesState {}

class TrendingMoviesInitial extends TrendingMoviesState {}

class TrendingMoviesLoading extends TrendingMoviesState {}

class TrendingMoviesLoaded extends TrendingMoviesState {
  final List<Movie> movies;

  TrendingMoviesLoaded(this.movies);
}

class TrendingMoviesError extends TrendingMoviesState {
  final String errorMessage;

  TrendingMoviesError(this.errorMessage);
}
