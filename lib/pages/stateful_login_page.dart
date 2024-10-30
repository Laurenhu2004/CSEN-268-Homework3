import 'package:flutter/material.dart';

class BookInfoPage extends StatefulWidget {
  const BookInfoPage({super.key});

  @override
  State<BookInfoPage> createState() => _BookInfoPageState();
}

class _BookInfoPageState extends State<BookInfoPage> {
  @override
  Widget build(BuildContext context) {
    // Sample book data for display
    final bookTitle = "The Flutter Handbook";
    final bookAuthor = "John Doe";
    final bookDescription = "A comprehensive guide to building apps with Flutter.";
    final bookCoverUrl = "https://example.com/book_cover.jpg"; // URL or asset path

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Info")
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book cover image
              Center(
                child: Image.network(
                  bookCoverUrl, // Use an asset if local image
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              // Book title
              Text(
                bookTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              // Book author
              Text(
                "Author: $bookAuthor",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              // Book description
              Text(
                bookDescription,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
