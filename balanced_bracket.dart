import 'stack.dart';

void main() {
  String sample1 = '{ [ ( ) ] }';
  String sample2 = '{ [ ( ] ) }';
  String sample3 = '{ ( ( [ ] ) [ ] ) [ ] }';

  String result1 = isBracketBalanced(sample1);
  String result2 = isBracketBalanced(sample2);
  String result3 = isBracketBalanced(sample3);

  print(result1); // Output: YES
  print(result2); // Output: NO
  print(result3); // Output: YES
}

String isBracketBalanced(String sampleRaw) {
  String sample = sampleRaw.replaceAll(' ', '');
  final List<String> ending = [')', '}', ']'];
  final List<String> starting = ['(', '{', '['];
  final Stack<String> stack = Stack<String>();

  for (int i = 0; i < sample.length; i++) {
    final String char = sample[i];
    if (starting.contains(char)) {
      stack.push(char);
    } else if (ending.contains(char) &&
        stack.isNotEmpty &&
        stack.peek == starting[ending.indexOf(char)]) {
      stack.pop();
    } else {
      return 'NO';
    }
  }

  return stack.isEmpty ? 'YES' : 'NO';
}