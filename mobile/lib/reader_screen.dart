import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'data.dart';

class BookReaderScreen extends StatefulWidget {
  final Book book;
  const BookReaderScreen({Key? key, required this.book}) : super(key: key);

  @override
  State<BookReaderScreen> createState() => _BookReaderScreenState();
}

class _BookReaderScreenState extends State<BookReaderScreen> {
  int currentPage = 12;

  void _showTranslation(String word) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => TranslationPopup(word: word),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book.title)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: TappableText(text: bookContent, onWordTap: _showTranslation, savedWords: savedWords),
            ),
          ),
          // Bottom Toolbar logic here...
        ],
      ),
    );
  }
}

// Keep TappableText and TranslationPopup classes here at the bottom of the file

// Tappable Text Widget with Highlighted Words
class TappableText extends StatelessWidget {
  final String text;
  final Function(String) onWordTap;
  final Set<String> savedWords;

  const TappableText({
    Key? key,
    required this.text,
    required this.onWordTap,
    required this.savedWords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final words = text.split(RegExp(r'(\s+)'));
    
    return Wrap(
      children: words.map((word) {
        final cleanWord = word.replaceAll(RegExp(r'[^\w\sáéíóúñü]'), '').toLowerCase();
        final isSaved = savedWords.contains(cleanWord);
        final isWhitespace = word.trim().isEmpty;

        if (isWhitespace) {
          return Text(
            word,
            style: const TextStyle(
              fontSize: 18,
              height: 1.7,
              color: AppColors.inkBlack,
              fontFamily: 'Georgia',
            ),
          );
        }

        return GestureDetector(
          onTap: () => onWordTap(cleanWord),
          child: Container(
            decoration: isSaved
                ? BoxDecoration(
                    color: AppColors.brightTealBlue.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(3),
                  )
                : null,
            padding: isSaved
                ? const EdgeInsets.symmetric(horizontal: 2, vertical: 1)
                : null,
            child: Text(
              word,
              style: TextStyle(
                fontSize: 18,
                height: 1.7,
                color: isSaved ? AppColors.brightTealBlue : AppColors.inkBlack,
                fontWeight: isSaved ? FontWeight.w600 : FontWeight.normal,
                fontFamily: 'Georgia',
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Translation Popup Widget
class TranslationPopup extends StatelessWidget {
  final String word;

  const TranslationPopup({Key? key, required this.word}) : super(key: key);

  // Hardcoded translations
  Map<String, Map<String, String>> get translations => {
    'príncipe': {
      'translation': 'prince',
      'pronunciation': 'PREEN-see-peh',
      'example': 'El príncipe vive en un castillo. (The prince lives in a castle.)',
    },
    'planeta': {
      'translation': 'planet',
      'pronunciation': 'plah-NEH-tah',
      'example': 'La Tierra es un planeta hermoso. (Earth is a beautiful planet.)',
    },
    'rosa': {
      'translation': 'rose',
      'pronunciation': 'ROH-sah',
      'example': 'La rosa tiene espinas. (The rose has thorns.)',
    },
    'corazón': {
      'translation': 'heart',
      'pronunciation': 'koh-rah-SOHN',
      'example': 'El corazón late rápido. (The heart beats fast.)',
    },
    'esencial': {
      'translation': 'essential',
      'pronunciation': 'eh-sen-see-AHL',
      'example': 'El agua es esencial para la vida. (Water is essential for life.)',
    },
  };

  @override
  Widget build(BuildContext context) {
    final translation = translations[word] ?? {
      'translation': 'word',
      'pronunciation': 'word',
      'example': 'Example sentence with $word.',
    };

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  word,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.inkBlack,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                  color: AppColors.inkBlack,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              translation['pronunciation']!,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.inkBlack.withOpacity(0.6),
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Translation',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.verdigris,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              translation['translation']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.inkBlack,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Example',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.verdigris,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              translation['example']!,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.inkBlack.withOpacity(0.8),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Word "$word" saved!'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lobsterPink,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Save Word',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}