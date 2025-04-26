class MovieData {
  final String image;
  final String title;
  final String category;
  final String? year;
  final String? description;
  final int? rating;
  final String? buttonText;
  final bool isMovieCardOpen;

  MovieData({
    required this.image,
    required this.title,
    required this.category,
    this.year,
    this.description,
    this.rating,
    this.buttonText,
    this.isMovieCardOpen = false,
  });
}
