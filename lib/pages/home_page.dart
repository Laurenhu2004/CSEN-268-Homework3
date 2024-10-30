import 'package:flutter/material.dart';
import 'package:CSEN268_F24/pages/sign_in/sign_in_page.dart';
import 'package:CSEN268_F24/pages/stateful_login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of fake book titles, author names, and corresponding colors
  List<Map<String, dynamic>> books = [
    {"title": "The Crimson Horizon", "author": "Eleanor Day", "color": Colors.red},
    {"title": "Emerald Dreams", "author": "Oliver Green", "color": Colors.green},
    {"title": "Sunset in Amber", "author": "Lily Carter", "color": Colors.orange},
    {"title": "Violet Whispers", "author": "Henry Fields", "color": Colors.purple},
    {"title": "Golden Shadows", "author": "Sarah Goldstein", "color": Colors.yellow},
    {"title": "Waves of Cyan", "author": "James Blue", "color": Colors.cyan},
  ];

  // Variable to store selected sort option
  String sortBy = 'title';

  // Function to sort books by title or author
  void sortBooks(String criteria) {
    setState(() {
      sortBy = criteria;
      if (sortBy == 'title') {
        books.sort((a, b) => a['title'].compareTo(b['title']));
      } else if (sortBy == 'author') {
        books.sort((a, b) => a['author'].compareTo(b['author']));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Club Home"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row of buttons for sorting by title or author
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      sortBooks('title');
                    },
                    child: const Text('Sort by Title'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      sortBooks('author');
                    },
                    child: const Text('Sort by Author'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text("Books", style: tt.headlineMedium),
              const SizedBox(height: 30),
              // Scrollable horizontal list of colored boxes
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                child: Row(
                  children: List.generate(books.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0), // Spacing between boxes
                      child: InkWell(
                        onTap: () {
                          String bookTitle = books[index]['title']!;
                          String bookAuthor = books[index]['author']!;
                          print('Book: $bookTitle by $bookAuthor');

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BookInfoPage(),
                              settings: RouteSettings(
                                arguments: books[index], // Pass book details as arguments
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 200,
                          decoration: BoxDecoration(
                            color: books[index]['color'], // Assign color from the sorted list
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
