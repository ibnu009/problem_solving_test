void main() {
  String sample = '3943';
  int n = sample.length;
  int k = 1;
  print(highestPalindrome(sample, n, k)); // Output: 3993
}

String highestPalindrome(String originalString, int length, int allowedChanges) {

  void modifyString(List<String> characters, int endIndex, int leftIndex, int rightIndex, int changesLeft) {
    if (changesLeft == 0) return;
    if (leftIndex < 0 || rightIndex > endIndex) return;

    if (characters[leftIndex] != characters[rightIndex]) {
      modifyString(characters, endIndex, leftIndex - 1, rightIndex + 1, changesLeft - 1);
            if (changesLeft > 0 && characters[leftIndex] != '9' && characters[rightIndex] != '9') {
        characters[leftIndex] = '9';
        characters[rightIndex] = '9';
        return;
      } else {
        characters[leftIndex] = characters[leftIndex].compareTo(characters[rightIndex]) > 0 ? characters[leftIndex] : characters[rightIndex];
        characters[rightIndex] = characters[leftIndex];
      }
    } else {
      modifyString(characters, endIndex, leftIndex - 1, rightIndex + 1, changesLeft);
      if (changesLeft > 1 && characters[leftIndex] != '9') {
        characters[leftIndex] = '9';
        characters[rightIndex] = '9';
        changesLeft -= 2;
        return;
      }
    }
    if (leftIndex == rightIndex && changesLeft > 0 && characters[leftIndex] != '9') {
      characters[leftIndex] = '9';
    }
  }

  bool isPalindrome(String string, int startIndex, int endIndex) {
    if (startIndex >= endIndex) return true;
    if (string[startIndex] != string[endIndex]) return false;
    return isPalindrome(string, startIndex + 1, endIndex - 1);
  }

  List<String> characters = originalString.split('');
  int leftIndex = (length - 1) ~/ 2;
  int rightIndex = length ~/ 2;
  --length;
  modifyString(characters, length, leftIndex, rightIndex, allowedChanges);
  originalString = characters.join('');
  
  if (isPalindrome(originalString, 0, length))
    return originalString;
  else
    return "-1";
}