// lib/models/movie.dart

class Movie {
  final int id;
  final String title;
  final String category;
  final String imageUrl;
  final String description;
  final int releaseYear;
  final double rating;
  final String director;
  final List<String> cast;
  final int durationMinutes;

  const Movie({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.releaseYear,
    required this.rating,
    required this.director,
    required this.cast,
    required this.durationMinutes,
  });
}
