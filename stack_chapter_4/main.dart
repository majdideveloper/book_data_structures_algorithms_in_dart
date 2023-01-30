import './imp_stack.dart';
import 'challenge_one.dart';
import 'challenge_two.dart';

void main(List<String> args) {
  // Stack miniStack = Stack();
  // final stack = Stack<int>();
  // stack.push(1);
  // stack.push(2);
  // stack.push(3);
  // stack.push(4);
  // print(stack);
  // final element = stack.pop();
  // print('Popped: $element');
  // print(Stack.size(5, 'hello'));

  // print(miniStack);
  // const list = ['S', 'M', 'O', 'K', 'E'];
  // final smokeStack = Stack.of(list);
  // print(smokeStack);
  // print(smokeStack.pop());
  // print(smokeStack);

  // List<String> word = ['M', 'A', 'J', 'D', 'I'];

  // print(paraBalanced);

  // List reversed = reversedStringWithStack(word);
  // print(reversed);

  bool balanced = balancedParentheses('h((e))llo(world)()');
  bool balanced2 = balancedParentheses('(hello world');
  print(balanced);
  print(balanced2);
}
