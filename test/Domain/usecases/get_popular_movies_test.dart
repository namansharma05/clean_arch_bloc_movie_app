import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_project/core/core.errors/server_failure.dart';
import 'package:sample_project/domain/entities/movie.dart';
import 'package:sample_project/domain/repositories/movie_repository.dart';
import 'package:sample_project/domain/usecases/get_popular_movies.dart';

import 'get_popular_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main() {
  late GetPopularMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetPopularMovies(mockMovieRepository);
  });

  final pMovies = [
    Movie(
        id: 1,
        title: 'Test Movie 1',
        overview: 'Overview 1',
        posterPath: '/image 1'),
    Movie(
        id: 2,
        title: 'Test Movie 2',
        overview: 'Overview 2',
        posterPath: '/image 2')
  ];

  test('should get popular movies from the repository', () async {
    // arrange
    when(mockMovieRepository.getPopularMovies())
        .thenAnswer((_) async => Right(pMovies));

    // act
    final result = await usecase();

    // assert
    expect(result, isA<Right<Failure, List<Movie>>>());
    verify(mockMovieRepository.getPopularMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
