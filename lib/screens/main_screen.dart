import 'package:flutter/material.dart';
import 'package:home_work_45_test/screens/single_movie_screen.dart';
import 'package:home_work_45_test/screens/watched_movies_screen.dart';
import 'package:home_work_45_test/widgets/add_movie_bar.dart';
import 'package:home_work_45_test/widgets/movie_card.dart';
import '../widgets/app_bar_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<MovieCard> movieCards = [
    MovieCard(
      image:
          'https://assets.mubicdn.net/images/notebook/post_images/31857/images-w1400.jpg?1607290863',
      title: 'Movie 1',
      category: 'Category 1',
      year: '2020',
      description: 'A great movie!',
      buttonText: 'Watch this movie',
      isMovieCardOpen: false,
    ),
    MovieCard(
      image:
          'https://cdn.shopify.com/s/files/1/1057/4964/files/10-Best-Movie-Posters-of-All-Time_480x480.webp?v=1712251697',
      title: 'Movie 2',
      category: 'Category 2',
      year: '2020',
      description: 'A great movie!',
      buttonText: 'Watch this movie',
      isMovieCardOpen: false,
    ),
    MovieCard(
      image:
          'https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg',
      title: 'Movie 3',
      category: 'Category 3',
      year: '2020',
      description: 'A great movie!',
      buttonText: 'Watch this movie',
      isMovieCardOpen: false,
    ),
    MovieCard(
      image:
          'https://marketplace.canva.com/EAFTl0ixW_k/1/0/1131w/canva-black-white-minimal-alone-movie-poster-YZ-0GJ13Nc8.jpg',
      title: 'Movie 4',
      category: 'Category 4',
      year: '2020',
      description: 'A great movie!',
      buttonText: 'Watch this movie',
      isMovieCardOpen: false,
    ),
  ];

  void onMoveCardTap(int index) {
    final movieCard = movieCards[index];
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
              onSave: () {
                setState(() {
                  movieCards.removeAt(index);
                });
              },
            ),
      ),
    );
  }

  void addNewMovie() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddMovieBar(
          onAddMovie: ({
            required String title,
            required String category,
            required String year,
            required String description,
            required String image,
          }) {
            setState(() {
              movieCards.add(
                MovieCard(
                  image: image,
                  title: title,
                  category: category,
                  year: year,
                  description: description,
                ),
              );
            });
          },
        );
      },
    );
  }

  void openWatchedMovies() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => WatchedMoviesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            AppBarButton(
              buttonText: 'New Movies',
              style: TextStyle(color: Colors.white),
              onTap: () {},
            ),
            AppBarButton(
              buttonText: 'Watched Movies',
              onTap: openWatchedMovies,
            ),
            Spacer(),
            IconButton(onPressed: addNewMovie, icon: Icon(Icons.add)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child:
            movieCards.isEmpty
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('You do not have new movies'),
                      TextButton.icon(
                        onPressed: addNewMovie,
                        label: Text('Add new movie'),
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                )
                : GridView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: movieCards.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 320,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => onMoveCardTap(index),
                      child: movieCards[index],
                    );
                  },
                ),
      ),
    );
  }
}
