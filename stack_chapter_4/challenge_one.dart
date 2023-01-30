// Challenge 1: Reverse a List
// Create a function that prints the contents of
//a list in reverse order.
// like that
// [M, A, J, D, I]
// to [I, D, J, A, M]
import './imp_stack.dart';

List reversedStringWithStack(List<String> string) {
  List reversedList = [];
  Stack stringStack = Stack.of(string);
  while (stringStack.isNotEmpty) {
    reversedList.add(stringStack.peek);
    stringStack.pop();
  }

  return reversedList;
}

// correction challenge two after 45 min

bool checkParentheses(String text) {
  var stack = Stack<int>();
  final open = '('.codeUnitAt(0);
  final close = ')'.codeUnitAt(0);
  for (int codeUnit in text.codeUnits) {
    if (codeUnit == open) {
      stack.push(codeUnit);
    } else if (codeUnit == close) {
      if (stack.isEmpty) {
        return false;
      } else {
        stack.pop();
      }
    }
  }
  return stack.isEmpty;
}
