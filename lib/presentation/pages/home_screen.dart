import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/injection_container.dart';
import 'package:sample_project/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:sample_project/presentation/bloc/search_movies/search_movies_event.dart';
import 'package:sample_project/presentation/pages/popular_movies_screen.dart';
import 'package:sample_project/presentation/pages/search_movies_screen.dart';
import 'package:sample_project/presentation/pages/trending_movies_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Application'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Trending movies
            const SizedBox(
              height: 380,
              child: Column(
                children: [
                  Text('Trending Movies'),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(child: TrendingMoviesScreen()),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //   Popular movies
            const SizedBox(
              height: 380,
              child: Column(
                children: [
                  Text('Popular Movies'),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(child: PopularMoviesScreen()),
                ],
              ),
            ),

            // Searched movies
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Enter movie name',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final query = searchController.text;
                      if (query != null && query.isNotEmpty) {
                        BlocProvider.of<SearchMoviesBloc>(context)
                            .add(FetchSearchMovies(query));
                      }
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 380,
              child: Column(
                children: [
                  Text('Suggested movies'),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SearchMoviesScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
