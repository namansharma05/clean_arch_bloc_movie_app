import 'package:dartz/dartz.dart';
import 'package:sample_project/core/core.errors/server_failure.dart';
import 'package:sample_project/domain/entities/movie.dart';
import 'package:sample_project/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call(String query) async {
    print("search movies class query is " + query);
    final result = await repository.searchMovie(query);
    print("search movies class");
    print(result);
    return result;
  }
}
