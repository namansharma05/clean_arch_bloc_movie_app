import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/domain/entities/movie.dart';

class MoviesListWidget extends StatelessWidget {
  final List<Movie> movies;
  const MoviesListWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        // print('https://image.tmdb.org/t/p/w500' + movie.posterPath);
        return Container(
          //   color: const Color.fromRGBO(244, 67, 54, 1),
          height: 150,
          //   width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              // image
              //   Text(movie.posterPath),
              Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: 'http://image.tmdb.org/t/p/w500${movie.posterPath}',
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              //  column for title and overview
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // title
                    Text(
                      movie.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    // overview
                    Expanded(
                      child: Text(
                        movie.overview,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
        // return ListTile(
        //   leading: Image.network(
        //     'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
        //     width: 50,
        //     fit: BoxFit.cover,
        //   ),
        //   title: Text(movie.title),
        //   subtitle: Text(movie.overview),
        //   onTap: () {},
        // );
      },
    );
  }
}
