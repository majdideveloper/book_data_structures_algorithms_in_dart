import 'linked_list.dart';
import 'node.dart';

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
