void main() {
  String sample1 = '3943';
  String sample2 = '932239';
  String sample3 = '1234';

  int n1 = sample1.length;
  int n2 = sample2.length;
  int n3 = sample3.length;

  int k = 1;
  int k2 = 2;

  print(highestPalindrome(sample1, n1, k)); // Output: 3993
  print(highestPalindrome(sample2, n2, k2)); // Output: 992299
  print(highestPalindrome(sample3, n3, k)); // Output: -1
}

String highestPalindrome(String inputString, int length, int allowedChanges) {
  List<String> characters = inputString.split('');
  int leftIndex = 0;
  int rightIndex = length - 1;

  int differences = calculateDifferences(characters, leftIndex, rightIndex, 0);
  if (differences > allowedChanges) {
    return "-1";
  }

  return constructHighestValuePalindrome(characters, leftIndex, rightIndex, allowedChanges);
}

int calculateDifferences(List<String> characters, int leftIndex, int rightIndex, int differences) {
  if (leftIndex >= rightIndex) {
    return differences;
  }

  if (characters[leftIndex] != characters[rightIndex]) {
    differences++;
  }

  return calculateDifferences(characters, leftIndex + 1, rightIndex - 1, differences);
}

String constructHighestValuePalindrome(List<String> characters, int leftIndex, int rightIndex, int changesLeft) {
  if (leftIndex >= rightIndex) {
    return characters.join('');
  }

  if (characters[leftIndex] != characters[rightIndex]) {
    if (changesLeft > 0) {
      characters[leftIndex] = '9';
      characters[rightIndex] = '9';
      changesLeft--;
    }
  } 
  else {
    if (characters[leftIndex] != '9' && changesLeft > 1) {
      characters[leftIndex] = '9';
      characters[rightIndex] = '9';
      changesLeft -= 2;
    }
  }

  return constructHighestValuePalindrome(characters, leftIndex + 1, rightIndex - 1, changesLeft);
}