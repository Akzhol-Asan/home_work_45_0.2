import 'package:flutter/material.dart';

class SingleMovieScreen extends StatelessWidget {
  final String image;
  final String title;
  final String category;
  final String? year;
  final String? description;
  final int? rating;
  final String? buttonText;
  final bool isMovieCardOpen;

  const SingleMovieScreen({
    super.key,
    required this.image,
    required this.title,
    required this.category,
    this.year,
    this.description,
    this.rating,
    this.buttonText,
    required this.isMovieCardOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(image),
            ),
            SizedBox(height: 10),
            Text('Title: $title'),
            Text('Category: $category'),
            Text('Year: $year'),
            Text('Description: $description'),
            Text('Rating: $rating'),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.play_arrow),
                label: Text(buttonText ?? 'Watch this movie'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
