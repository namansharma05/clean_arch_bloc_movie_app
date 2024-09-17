import 'package:sample_project/domain/entities/movie.dart';

class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  // Converts JSON into MovieModel
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }

  // Converts MovieModel into JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
    };
  }

  // convert MovieModel (data) to Movie (domain)
  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
    );
  }
}
