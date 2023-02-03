import 'node.dart';
import './linked_list.dart';

void main() {
  final list = LinkedList<int>();

  list.append(2);
  list.append(4);

  list.append(6);
  list.append(8);
  list.append(14);
  list.append(48);

  print(list);
  list.removeWithIndex(2);
  print(list);
  for (var i in list) {
    print(i);
  }
}
