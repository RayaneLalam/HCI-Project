import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'data.dart';
import 'reader_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VOCAPERSO', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.65, crossAxisSpacing: 16, mainAxisSpacing: 16,
        ),
        itemCount: hardcodedBooks.length,
        itemBuilder: (context, index) => BookCard(book: hardcodedBooks[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // Add logic later
        backgroundColor: AppColors.lobsterPink,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 3,
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BookReaderScreen(book: book))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(color: book.coverColor, borderRadius: BorderRadius.circular(8)),
                child: const Center(child: Icon(Icons.book, size: 48, color: Colors.white70)),
              ),
              const SizedBox(height: 12),
              Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 2),
              const Spacer(),
              LinearProgressIndicator(value: book.progress, backgroundColor: AppColors.ghostWhite, color: AppColors.lobsterPink),
            ],
          ),
        ),
      ),
    );
  }
}