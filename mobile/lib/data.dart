import 'package:flutter/material.dart';

class Book {
  final String id, title, topic, language;
  final double progress;
  final Color coverColor;

  Book({
    required this.id, required this.title, required this.topic,
    required this.language, required this.progress, required this.coverColor,
  });
}

final List<Book> hardcodedBooks = [
  Book(
    id: '1',
    title: 'El Principito',
    topic: 'Classic Literature',
    language: 'Spanish',
    progress: 0.45,
    coverColor: const Color(0xFF6B4CE6),
  ),
  Book(
    id: '2',
    title: 'Le Petit Prince',
    topic: 'Fiction',
    language: 'French',
    progress: 0.23,
    coverColor: const Color(0xFFE84855),
  ),
  Book(
    id: '3',
    title: 'Der Kleine Prinz',
    topic: 'Philosophy',
    language: 'German',
    progress: 0.67,
    coverColor: const Color(0xFFF9A826),
  ),
  Book(
    id: '4',
    title: 'Cien Años de Soledad',
    topic: 'Magic Realism',
    language: 'Spanish',
    progress: 0.12,
    coverColor: const Color(0xFF2ECC71),
  ),
  Book(
    id: '5',
    title: 'L\'Étranger',
    topic: 'Philosophy',
    language: 'French',
    progress: 0.89,
    coverColor: const Color(0xFF9B59B6),
  ),
  Book(
    id: '6',
    title: 'Die Verwandlung',
    topic: 'Mystery',
    language: 'German',
    progress: 0.34,
    coverColor: const Color(0xFF34495E),
  ),
  Book(
    id: '7',
    title: 'Don Quijote',
    topic: 'Adventure',
    language: 'Spanish',
    progress: 0.56,
    coverColor: const Color(0xFFE67E22),
  ),
  Book(
    id: '8',
    title: 'Les Misérables',
    topic: 'History',
    language: 'French',
    progress: 0.05,
    coverColor: const Color(0xFF16A085),
  ),
];

// Hardcoded Book Content
const bookContent = '''
En el principio, el pequeño príncipe vivía en un pequeño planeta, no mucho más grande que una casa. Cada mañana, él limpiaba sus tres volcanes y arrancaba los brotes de baobab que intentaban crecer. Era un trabajo importante, porque si los baobabs crecían demasiado, sus raíces podrían romper el planeta entero.

Un día, una rosa apareció en su planeta. Era hermosa, con cuatro espinas para protegerse. El pequeño príncipe cuidaba la rosa cada día, cubriéndola con una campana de cristal por la noche y regándola con cuidado. Pero la rosa era vanidosa y exigente, y esto hacía que el príncipe se sintiera confundido.

Finalmente, decidió dejar su planeta y explorar el universo. Visitó muchos asteroides diferentes, cada uno habitado por una persona extraña. En el primer asteroide, conoció a un rey que creía que gobernaba todas las estrellas. En el segundo, encontró a un hombre vanidoso que solo quería admiración.

El pequeño príncipe aprendió muchas lecciones en su viaje, pero la más importante fue sobre el amor y la amistad. Cuando llegó a la Tierra y conoció al zorro, el zorro le enseñó un secreto maravilloso: "Solo con el corazón se puede ver correctamente. Lo esencial es invisible a los ojos."

Esta lección cambió al pequeño príncipe para siempre. Él entendió que el tiempo que había pasado con su rosa era lo que la hacía tan especial. No era solo una rosa cualquiera; era su rosa, única en todo el universo porque él la había cuidado y amado.''';

final Set<String> savedWords = {'príncipe', 'planeta', 'rosa', 'corazón', 'esencial'};

final Map<String, Map<String, String>> wordTranslations = {
  'príncipe': {
    'translation': 'prince',
    'pronunciation': 'PREEN-see-peh',
    'example': 'El príncipe vive en un castillo.',
  },
  // ... (Include the rest of your translations here)
};