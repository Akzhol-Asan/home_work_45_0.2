import 'package:flutter/material.dart';
import 'package:home_work_45_test/data/watched_movie_cards.dart';
import 'package:home_work_45_test/widgets/movie_card.dart';

class SingleMovieScreen extends StatefulWidget {
  final String image;
  final String title;
  final String category;
  final String? year;
  final String? description;
  final int? rating;
  final String? buttonText;
  final bool isMovieCardOpen;
  final VoidCallback onSave;

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
    required this.onSave,
  });

  @override
  State<SingleMovieScreen> createState() => _SingleMovieScreenState();
}

class _SingleMovieScreenState extends State<SingleMovieScreen> {
  int? _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  void _showRatingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateDialog) {
            return AlertDialog(
              title: Text('Rate this movie'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Select a rating (0 to 5):'),
                  Slider(
                    value: _rating?.toDouble() ?? 0.0,
                    min: 0,
                    max: 5,
                    divisions: 5,
                    onChanged: (double newValue) {
                      setStateDialog(() {
                        _rating = newValue.toInt();
                      });
                    },
                  ),
                  Text('Rating: $_rating'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      watchedMovieCards.add(
                        MovieCard(
                          image: widget.image,
                          title: widget.title,
                          category: widget.category,
                          rating: _rating ?? 0,
                        ),
                      );
                      widget.onSave();
                    });
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(widget.image),
            ),
            SizedBox(height: 10),
            Text('Title: ${widget.title}'),
            Text('Category: ${widget.category}'),
            Text('Year: ${widget.year}'),
            Text('Description: ${widget.description}'),
            Text('Rating: ${_rating ?? "-"}'),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _showRatingDialog,
                icon: Icon(Icons.play_arrow),
                label: Text(widget.buttonText ?? 'Watch this movie'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
