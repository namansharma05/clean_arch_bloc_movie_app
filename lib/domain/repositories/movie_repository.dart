import 'package:dartz/dartz.dart';
import 'package:sample_project/core/core.errors/server_failure.dart';
import 'package:sample_project/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getTrendingMovies();

  Future<Either<Failure, List<Movie>>> searchMovie(String query);

  Future<Either<Failure, List<Movie>>> getPopularMovies();
}
