import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        backgroundColor: Colors.teal,
        title: const Text('Movie Application'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trending movies
              const SizedBox(
                height: 380,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trending Movies',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular Movies',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(child: PopularMoviesScreen()),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // Searched movies
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Search Movies',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: const InputDecoration(
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
                            icon: const Icon(Icons.search),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 380,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Suggested ${searchController.text} movies'),
                          const SizedBox(
                            height: 10,
                          ),
                          const Expanded(
                            child: SearchMoviesScreen(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
