import 'package:sample_project/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> searchMovies(String query);
  Future<List<MovieModel>> getPopularMovies();
}
