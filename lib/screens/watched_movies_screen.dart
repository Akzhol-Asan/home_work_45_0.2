import 'package:flutter/material.dart';

import '../data/watched_movie_cards.dart';
import '../widgets/app_bar_button.dart';

class WatchedMoviesScreen extends StatefulWidget {
  const WatchedMoviesScreen({super.key});

  @override
  State<WatchedMoviesScreen> createState() => _WatchedMoviesScreenState();
}

class _WatchedMoviesScreenState extends State<WatchedMoviesScreen> {
  void openNewMovies() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            AppBarButton(buttonText: 'New Movies', onTap: openNewMovies),
            AppBarButton(
              buttonText: 'Watched Movies',
              style: TextStyle(color: Colors.white),
              onTap: () {},
            ),
          ],
        ),
      ),
      body:
          watchedMovieCards.isEmpty
              ? Center(child: Text('You have no watched movies'))
              : GridView.builder(
                padding: EdgeInsets.all(8),
                itemCount: watchedMovieCards.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 320,
                ),
                itemBuilder: (context, index) {
                  return watchedMovieCards[index];
                },
              ),
    );
  }
}
