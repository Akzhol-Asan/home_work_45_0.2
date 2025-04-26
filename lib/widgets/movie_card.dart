import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String image;
  final String title;
  final String category;
  final String? year;
  final String? description;
  final int? rating;
  final Widget? button;
  final String? buttonText;
  final bool isMovieCardOpen;

  const MovieCard({
    super.key,
    required this.image,
    required this.title,
    required this.category,
    this.year,
    this.description,
    this.rating,
    this.button,
    this.buttonText,
    this.isMovieCardOpen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Title: $title'), Text('Category: $category')],
            ),
          ),
        ],
      ),
    );
  }
}
