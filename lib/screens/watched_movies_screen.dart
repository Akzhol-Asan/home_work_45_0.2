import 'package:flutter/material.dart';
import 'package:home_work_45_test/screens/main_screen.dart';
import 'package:home_work_45_test/screens/single_movie_screen.dart';

import '../data/new_movies_cards.dart';
import '../data/watched_movie_cards.dart';
import '../widgets/app_bar_button.dart';

class WatchedMoviesScreen extends StatefulWidget {
  const WatchedMoviesScreen({super.key});

  @override
  State<WatchedMoviesScreen> createState() => _WatchedMoviesScreenState();
}

class _WatchedMoviesScreenState extends State<WatchedMoviesScreen> {
  void openNewMovies() {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => MainScreen()));
  }

  void onMoveCardTap(int index) {
    final movieCard = watchedMovieCards[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (ctx) => SingleMovieScreen(
              image: movieCard.image,
              title: movieCard.title,
              category: movieCard.category,
              year: movieCard.year,
              description: movieCard.description,
              rating: movieCard.rating,
              buttonText: movieCard.buttonText,
              isMovieCardOpen: movieCard.isMovieCardOpen,
              isMovieNew: false,
              onSave: () {
                setState(() {
                  watchedMovieCards.removeAt(index);
                });
                setState(() {
                  movieCards = List.from(movieCards);
                });
              },
            ),
      ),
    );
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
                  return InkWell(
                    onTap: () => onMoveCardTap(index),
                    child: watchedMovieCards[index],
                  );
                },
              ),
    );
  }
}
