import 'package:dartz/dartz.dart';
import 'package:sample_project/core/core.errors/server_failure.dart';
import 'package:sample_project/domain/entities/movie.dart';
import 'package:sample_project/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getPopularMovies();
  }
}
