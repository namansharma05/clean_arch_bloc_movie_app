import 'package:dartz/dartz.dart';
import 'package:sample_project/core/core.errors/server_exception.dart';
import 'package:sample_project/core/core.errors/server_failure.dart';
import 'package:sample_project/data/datasources/movie_remote_data_source.dart';
import 'package:sample_project/data/models/movie_model.dart';
import 'package:sample_project/domain/entities/movie.dart';
import 'package:sample_project/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final List<MovieModel> movieModel =
          await remoteDataSource.getPopularMovies();
      final List<Movie> movies =
          movieModel.map((movie) => movie.toEntity()).toList();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies() async {
    try {
      final List<MovieModel> movieModel =
          await remoteDataSource.getTrendingMovies();
      final List<Movie> movies =
          movieModel.map((movie) => movie.toEntity()).toList();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovie(String query) async {
    print("movie repository impl query is " + query);
    try {
      final List<MovieModel> movieModel =
          await remoteDataSource.searchMovies(query);
      final List<Movie> movies =
          movieModel.map((movie) => movie.toEntity()).toList();
      print("movie repository imple");
      print(movies);
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
