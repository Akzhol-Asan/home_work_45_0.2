import 'package:flutter/material.dart';
import 'package:home_work_45_test/widgets/movie_card.dart';

class SingleMovieScreen extends StatelessWidget {
  const SingleMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Name')),
      body: MovieCard(
        image: 'https://global-sensors.com/wp-content/uploads/2021/07/test.jpg',
        title: 'Title',
        category: 'Category',
        year: '2000',
        description:
            'Xлопаю стоя. Я даже не представляю смог бы я пройти такой долгий, трудный и тернистый путь в одиночку. Браво!',
        rating: 5,
        buttonText: 'Watch this movie',
        isMovieCardOpen: true,
      ),
    );
  }
}
