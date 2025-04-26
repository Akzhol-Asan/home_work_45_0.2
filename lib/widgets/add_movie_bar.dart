import 'package:flutter/material.dart';

class AddMovieBar extends StatefulWidget {
  final Function({
    required String title,
    required String category,
    required String year,
    required String description,
    required String image,
  })
  onAddMovie;

  const AddMovieBar({super.key, required this.onAddMovie});

  @override
  State<AddMovieBar> createState() => _AddMovieBarState();
}

class _AddMovieBarState extends State<AddMovieBar> {
  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  final yearController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  void onAddMovieTap() {
    widget.onAddMovie(
      title: titleController.text,
      category: categoryController.text,
      year: yearController.text,
      description: descriptionController.text,
      image: imageController.text,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Movie Title'),
          ),
          TextField(
            controller: categoryController,
            decoration: InputDecoration(labelText: 'Category'),
          ),
          TextField(
            controller: yearController,
            decoration: InputDecoration(labelText: 'Movie release date'),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          TextField(
            controller: imageController,
            decoration: InputDecoration(labelText: 'Add image link'),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onAddMovieTap,
              label: Text('Add movie'),
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
