// Challenge 2: Balance the Parentheses
// Check for balanced parentheses. Given a string, check if there are ( and ) characters,
// and return true if the parentheses in the string are balanced. For example:
// // 1
// h((e))llo(world)() // balanced parentheses return true
// // 2
// (hello world // unbalanced parentheses return false
import './imp_stack.dart';

bool balancedParentheses(String str) {
  List listBalanced = str.split('');
  Stack paraBalanced = Stack.of(listBalanced);
  print(paraBalanced);
  int close = 0;
  int open = 0;
  while (paraBalanced.isNotEmpty) {
    if (paraBalanced.peek == ')') {
      close++;
      paraBalanced.pop();
    } else if (paraBalanced.peek == '(') {
      open++;
      paraBalanced.pop();
      while (open != close || paraBalanced.isEmpty) {
        if (paraBalanced.peek == '(') open++;
        paraBalanced.pop();
      }
    }
    paraBalanced.pop();
  }
  if (close != open)
    return (false);
  else
    return (true);
}
