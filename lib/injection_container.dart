import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sample_project/data/datasources/movie_remote_data_source.dart';
import 'package:sample_project/data/datasources/remote/movie_remote_data_source_impl.dart';
import 'package:sample_project/data/repositories/movie_repository_impl.dart';
import 'package:sample_project/domain/repositories/movie_repository.dart';
import 'package:sample_project/domain/usecases/get_popular_movies.dart';
import 'package:sample_project/domain/usecases/get_trending_movies.dart';
import 'package:sample_project/domain/usecases/search_movies.dart';
import 'package:sample_project/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:sample_project/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:sample_project/presentation/bloc/trending_movies/trending_movies_bloc.dart';

final getIt = GetIt.instance;

void init() {
  // Bloc
  getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(searchMovies: getIt()));

  // use cases
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => SearchMovies(getIt()));

  // repositories
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: getIt()));

  // data sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: getIt()));

  // http service
  getIt.registerLazySingleton(() => http.Client());
}
