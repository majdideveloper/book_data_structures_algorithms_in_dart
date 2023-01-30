class Stack<E> {
  Stack() : _storage = <E>[];

  // Named Constructor
  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);

  Stack.size(int size, E element) : _storage = List<E>.filled(4, element);

  final List<E> _storage;

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  E get peek => _storage.last;

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !this.isEmpty;
  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }
}
