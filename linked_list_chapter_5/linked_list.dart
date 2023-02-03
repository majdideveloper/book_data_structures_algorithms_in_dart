import './node.dart';

class LinkedList<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isNotEmpty => !isEmpty;

// this my implementation
  // void push(E element) {
  //   if (isEmpty) {
  //     head?.value = element;
  //   }else{

  //   }
  // }
  // implemention of the book
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    // 1
    if (isEmpty) {
      push(value);
      return;
    }
    // 2
    tail!.next = Node(value: value);
    // 3
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    // 1
    var currentNode = head;
    var currentIndex = 0;
    // 2
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  //

  int get lengthList {
    if (isEmpty) return 0;
    Node<E>? currentNode = head;
    int currentIndex = 0;
    while (currentNode != null) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentIndex;
  }

  int get lastIndex => lengthList - 1;

  void insertInIndex(int index, E value) {
    if (this.lengthList < index) {
      print('the last index in list is   ${this.lengthList - 1}');
      return;
    } else if (index == 0)
      push(value);
    else if (index == lengthList)
      append(value);
    else {
      Node<E>? currentNode = head;
      int currentIndex = 0;

      Node<E>? newNode = Node(value: value);
      while (currentNode != null && currentIndex < index - 1) {
        currentNode = currentNode.next;
        currentIndex += 1;
      }

      newNode.next = currentNode?.next;
      currentNode?.next = newNode;
    }
  }

  Node<E> insertAfter(Node<E> node, E value) {
    // 1
    if (tail == node) {
      append(value);
      return tail!;
    }
    // 2
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  //
  // time to work in remove item
  //

  void popWithoutElement() {
    if (isEmpty) return;
    head = head?.next;
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  void removeLastWithoutElement() {
    if (isEmpty) return;
    if (head?.next == null) return popWithoutElement();
    var current = head;
    while (current?.next != tail) {
      current = current?.next;
    }
    tail = current;
    tail?.next = null;
  }

  E? removeLast() {
    // 1
    if (head?.next == null) return pop();
    // 2
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }
    // 3
    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }

  void removeWithIndex(int index) {
    if (index == 0)
      popWithoutElement();
    else if (index == lastIndex)
      removeLastWithoutElement();
    else {
      var current = head;
      int currentIndex = 0;
      while (currentIndex < index - 1) {
        current = current?.next;
        currentIndex++;
      }
      current!.next = current.next!.next;
    }
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  @override
  // TODO: implement iterator
  Iterator<E> get iterator => _LinkedListIterator(this);

  @override
  bool get isEmpty => head == null;
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;

  Node<E>? _currentNode;
  @override
  // TODO: implement current
  E get current => _currentNode!.value;

  bool _firstPass = true;

  @override
  bool moveNext() {
    // 1
    if (_list.isEmpty) return false;
    // 2
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }
    // 3
    return _currentNode != null;
  }
}
