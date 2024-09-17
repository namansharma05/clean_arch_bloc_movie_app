import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_project/domain/entities/movie.dart';
import 'package:sample_project/domain/usecases/get_popular_movies.dart';

import 'get_trending_movies_test.mocks.dart';

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
        .thenAnswer((_) async => pMovies);

    // act
    final result = await usecase();

    // assert
    expect(result, pMovies);
    verify(mockMovieRepository.getPopularMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
