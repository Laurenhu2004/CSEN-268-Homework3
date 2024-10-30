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
        title: const Text("Book Detail"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center( 
                child: Container(
                  height: 300,
                  width: 200,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                bookTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 10),
              Text(
                "Author: $bookAuthor",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                bookDescription,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}