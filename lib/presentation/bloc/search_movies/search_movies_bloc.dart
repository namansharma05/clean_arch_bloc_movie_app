import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/domain/usecases/search_movies.dart';
import 'package:sample_project/presentation/bloc/search_movies/search_movies_event.dart';
import 'package:sample_project/presentation/bloc/search_movies/search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;

  SearchMoviesBloc({required this.searchMovies})
      : super(SearchMoviesInitial()) {
    on<FetchSearchMovies>(fetchSearchMovies);
  }

  Future<void> fetchSearchMovies(
      FetchSearchMovies event, Emitter<SearchMoviesState> emit) async {
    print("event query is " + event.query);
    emit(SearchMoviesLoading());
    final failureOrMovies = await searchMovies(event.query);
    failureOrMovies.fold(
        (failure) => emit(SearchMoviesError(failure.toString())),
        (movies) => emit(SearchMoviesLoaded(movies)));
  }
}
