import 'package:dartz/dartz.dart';
import 'package:sample_project/core/core.errors/server_failure.dart';
import 'package:sample_project/domain/entities/movie.dart';
import 'package:sample_project/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await repository.searchMovie(query);
  }
}
