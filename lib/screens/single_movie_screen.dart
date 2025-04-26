import 'package:flutter/material.dart';
import 'package:home_work_45_test/data/watched_movie_cards.dart';
import 'package:home_work_45_test/screens/main_screen.dart';
import 'package:home_work_45_test/widgets/movie_card.dart';

import '../data/new_movies_cards.dart';

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
  final bool isMovieNew;

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
    required this.isMovieNew,
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
              title: widget.isMovieNew ? Text('Rate this movie') : null,
              content:
                  widget.isMovieNew
                      ? Column(
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
                      )
                      : Text('Are you sure?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(widget.isMovieNew ? 'Cansel' : 'No'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (widget.isMovieNew) {
                        watchedMovieCards.add(
                          MovieCard(
                            image: widget.image,
                            title: widget.title,
                            year: widget.year,
                            category: widget.category,
                            description: widget.description,
                            rating: _rating ?? 0,
                          ),
                        );
                      } else {
                        movieCards.add(
                          MovieCard(
                            image: widget.image,
                            title: widget.title,
                            year: widget.year,
                            category: widget.category,
                            description: widget.description,
                            rating: null,
                            buttonText: widget.buttonText,
                            isMovieCardOpen: widget.isMovieCardOpen,
                          ),
                        );
                      }
                      widget.onSave();
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => MainScreen()),
                    );
                  },
                  child: Text(widget.isMovieNew ? 'Save' : 'Yes'),
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
                onPressed: () {
                  _showRatingDialog();
                },

                icon:
                    widget.isMovieNew
                        ? Icon(Icons.play_arrow)
                        : Icon(Icons.backspace_outlined),
                label:
                    widget.isMovieNew
                        ? Text(widget.buttonText ?? 'Watch this movie')
                        : Text(widget.buttonText ?? 'Return movie'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
