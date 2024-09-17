import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_project/core/core.errors/server_exception.dart';
import 'package:sample_project/data/datasources/movie_remote_data_source.dart';
import 'package:sample_project/data/datasources/remote/movie_remote_data_source_impl.dart';

import 'movie_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  late MovieRemoteDataSource datasource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    datasource = MovieRemoteDataSourceImpl(client: mockHttpClient);
  });

  const sQuery = 'Avenger';
  const tUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=89fd87ec361186fb8aca4857d55a58ad';
  const sUrl =
      "https://api.themoviedb.org/3/search/movie?query=$sQuery&api_key=89fd87ec361186fb8aca4857d55a58ad";
  const pUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=89fd87ec361186fb8aca4857d55a58ad';

  const String sampleResponse = '''
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/path.jpg",
      "id": 1,
      "title": "Sample Movie",
      "original_language": "en",
      "original_title": "Sample Movie",
      "overview": "Overview here",
      "poster_path": "/path2.jpg",
      "media_type": "movie",
      "genre_ids": [1, 2, 3],
      "popularity": 100.0,
      "release_date": "2020-01-01",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 100
    }
  ],
  "total_pages": 1,
  "total_results": 1
}
''';
  test('should perform a GET request on a url to get trending movies',
      () async {
    //arrange
    when(mockHttpClient.get(Uri.parse(tUrl)))
        .thenAnswer((_) async => http.Response(sampleResponse, 200));

    //act
    await datasource.getTrendingMovies();

    //assert
    verify(mockHttpClient.get(Uri.parse(tUrl)));
  });

  test('should perform a GET request on a url to get popular movies', () async {
    //arrange
    when(mockHttpClient.get(Uri.parse(pUrl)))
        .thenAnswer((_) async => http.Response(sampleResponse, 200));

    //act
    await datasource.getPopularMovies();

    //assert
    verify(mockHttpClient.get(Uri.parse(pUrl)));
  });

  test('should perform a GET request on the url to get searched movies',
      () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(sUrl)))
        .thenAnswer((_) async => http.Response(sampleResponse, 200));

    // act
    await datasource.searchMovies(sQuery);

    // assert
    verify(mockHttpClient.get(Uri.parse(sUrl)));
  });

  test('should throw server exception when response code is 404', () async {
    //arrange
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response('Our Api Response', 404));

    //act
    final call = datasource.getTrendingMovies;

    //assert
    expect(() => call(), throwsA(isA<ServerException>()));
  });
}
