void main() {
  String sample = 'abbcccd';
  List<int> queriesSample = [1, 3, 9, 8];
  List<String> results = weightedString(sample, queriesSample);
  print(results); // Output: [Yes, Yes, Yes, No]
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

  return queries.map((query) => weights.contains(query) ? 'Yes' : 'No').toList();
}