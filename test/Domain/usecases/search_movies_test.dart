import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_project/domain/entities/movie.dart';
import 'package:sample_project/domain/usecases/search_movies.dart';

import 'get_trending_movies_test.mocks.dart';

void main() {
  late SearchMovies usecase;

  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovies(mockMovieRepository);
  });

  const sQuery = 'Inception';
  final sMovies = [
    Movie(
        id: 1,
        title: 'title 1',
        overview: 'Overview 1',
        posterPath: 'posterPath 1'),
    Movie(
        id: 2,
        title: 'title 2',
        overview: 'Overview 2',
        posterPath: 'posterPath 2')
  ];

  test('should get searched movies from the repository', () async {
    // arrange
    when(mockMovieRepository.searchMovie(any)).thenAnswer((_) async => sMovies);

    // act
    final result = await usecase(sQuery);

    // assert
    expect(result, sMovies);
    verify(mockMovieRepository.searchMovie(any));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
