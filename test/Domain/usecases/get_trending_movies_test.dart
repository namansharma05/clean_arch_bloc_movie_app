import 'package:flutter_test/flutter_test.dart';
import 'package:sample_project/domain/entities/movie.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_project/domain/usecases/get_trending_movies.dart';
import 'get_trending_movies_test.mocks.dart';

void main() {
  late GetTrendingMovies usecase;

  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetTrendingMovies(mockMovieRepository);
  });

  final tMoviesList = [
    Movie(
        id: 1,
        title: 'Test Movie 1',
        overview: 'Overview 1',
        posterPath: '/image1'),
    Movie(
        id: 2,
        title: 'Test Movie 2',
        overview: 'Overview 2',
        posterPath: '/image2')
  ];

  test('should get trending movies from the repository', () async {
    // arrange
    when(mockMovieRepository.getTrendingMovies())
        .thenAnswer((_) async => tMoviesList);

    // act
    final result = await usecase();

    // assert
    expect(result, tMoviesList);
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
