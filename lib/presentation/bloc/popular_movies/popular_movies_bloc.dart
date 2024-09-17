import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/domain/usecases/get_popular_movies.dart';
import 'package:sample_project/presentation/bloc/search_movies/popular_movies_event.dart';
import 'package:sample_project/presentation/bloc/search_movies/popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc({required this.getPopularMovies})
      : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>(fetchPopularMovies);
  }

  Future<void> fetchPopularMovies(
      FetchPopularMovies event, Emitter<PopularMoviesState> emit) async {
    emit(PopularMoviesLoading());
    final failureOrMovies = await getPopularMovies();
    failureOrMovies.fold(
        (failure) => emit(PopularMoviesError(failure.toString())),
        (movies) => emit(PopularMoviesLoaded(movies)));
  }
}
