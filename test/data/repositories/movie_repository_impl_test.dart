import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_project/core/core.errors/server_exception.dart';
import 'package:sample_project/core/core.errors/server_failure.dart';
import 'package:sample_project/data/datasources/movie_remote_data_source.dart';
import 'package:sample_project/data/models/movie_model.dart';
import 'package:sample_project/data/repositories/movie_repository_impl.dart';
import 'package:sample_project/domain/entities/movie.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRemoteDataSource>()])
void main() {
  late MovieRepositoryImpl repository;

  late MockMovieRemoteDataSource mockMovieRemoteDataSource;

  setUp(() {
    mockMovieRemoteDataSource = MockMovieRemoteDataSource();

    repository =
        MovieRepositoryImpl(remoteDataSource: mockMovieRemoteDataSource);
  });

  const String tQuery = 'Avenger';

  final tMoviesModelList = [
    MovieModel(
      id: 1,
      title: 'Test Movie 1',
      overview: 'Overview 1',
      posterPath: '/image 1',
    ),
    MovieModel(
      id: 2,
      title: 'Test Movie 2',
      overview: 'Overview 2',
      posterPath: '/image 2',
    )
  ];

  test('should get trending movies from the remote data source', () async {
    // arrange
    when(mockMovieRemoteDataSource.getTrendingMovies())
        .thenAnswer((_) async => tMoviesModelList);

    // act
    final result = await repository.getTrendingMovies();

    // assert
    verify(mockMovieRemoteDataSource.getTrendingMovies());
    expect(result, isA<Right<Failure, List<Movie>>>());
  });

  test('should get popular movies from the remote data source', () async {
    // arrange
    when(mockMovieRemoteDataSource.getPopularMovies())
        .thenAnswer((_) async => tMoviesModelList);

    // act
    final result = await repository.getPopularMovies();

    // assert
    verify(mockMovieRemoteDataSource.getPopularMovies());
    expect(result, isA<Right<Failure, List<Movie>>>());
  });

  test('should get searched movies from the remote data source', () async {
    // arrange
    when(mockMovieRemoteDataSource.searchMovies(tQuery))
        .thenAnswer((_) async => tMoviesModelList);

    // act
    final result = await repository.searchMovie(tQuery);

    // assert
    verify(mockMovieRemoteDataSource.searchMovies(tQuery));
    expect(result, isA<Right<Failure, List<Movie>>>());
  });

  test(
      'should return ServerFailure when, call to remote data source is unsuccessful',
      () async {
    // arrange
    when(mockMovieRemoteDataSource.getTrendingMovies())
        .thenThrow(ServerException());

    // act
    final result = await repository.getTrendingMovies();

    // assert
    expect(result, isA<Left<Failure, List<Movie>>>());
  });

  test(
      'should return ServerFailure when, call to remote data source is unsuccessful',
      () async {
    // arrange
    when(mockMovieRemoteDataSource.getPopularMovies())
        .thenThrow(ServerException());

    // act
    final result = await repository.getPopularMovies();

    // assert
    expect(result, isA<Left<Failure, List<Movie>>>());
  });

  test(
      'should return ServerFailure when, call to remote data source is unsuccessful',
      () async {
    // arrange
    when(mockMovieRemoteDataSource.searchMovies(tQuery))
        .thenThrow(ServerException());

    // act
    final result = await repository.searchMovie(tQuery);

    // assert
    expect(result, isA<Left<Failure, List<Movie>>>());
  });
}
