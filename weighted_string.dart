void main() {
  String sample1 = 'abbcccd';
  String sample2 = 'aabbbcccdddd';
  String sample3 = 'gits';

  List<int> queries1 = [1, 3, 9, 8];
  List<int> queries2 = [5, 6, 20, 16];
  List<int> queries3 = [7, 9, 20, 19];

  List<String> results = weightedString(sample1, queries1);
  List<String> results2 = weightedString(sample2, queries2);
  List<String> results3 = weightedString(sample3, queries3);

  print(results); // Output: [Yes, Yes, Yes, No]
  print(results2); // Output: [No, Yes, No, Yes]
  print(results3); // Output: [Yes, Yes, Yes, Yes]
}

List<String> weightedString(String s, List<int> queries) {
  Set<int> weights = {};
  String? lastChar;
  int lastCharWeight = 0;
  int currentTotalWeight = 0;

  for (int i = 0; i < s.length; i++) {
    if (s[i] == lastChar) {
      currentTotalWeight += lastCharWeight;
    } else {
      lastChar = s[i];
      lastCharWeight = s.codeUnitAt(i) - 'a'.codeUnitAt(0) + 1;
      currentTotalWeight = lastCharWeight;
    }
    weights.add(currentTotalWeight);
  }

  return queries
      .map((query) => weights.contains(query) ? 'Yes' : 'No')
      .toList();
}
