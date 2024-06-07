void main() {
  String sample = '3943';
  int n = sample.length;
  int k = 1;
  print(highestPalindrome(sample, n, k)); // Output: 3993
}

String highestPalindrome(String s, int n, int k) {

  void solve(List<String> sList, int end, int left, int right, int changes) {
    if (changes == 0) return;
    if (left < 0 || right > end) return;
    if (sList[left] != sList[right]) {
      solve(sList, end, left - 1, right + 1, changes - 1);
      if (changes > 0 && sList[left] != '9' && sList[right] != '9') {
        sList[left] = '9';
        sList[right] = '9';
        return;
      } else {
        sList[left] = sList[left].compareTo(sList[right]) > 0 ? sList[left] : sList[right];
        sList[right] = sList[left];
      }
    } else {
      solve(sList, end, left - 1, right + 1, changes);
      if (changes > 1 && sList[left] != '9') {
        sList[left] = '9';
        sList[right] = '9';
        return;
      }
    }
    if (left == right && changes > 0 && sList[left] != '9') {
      sList[left] = '9';
    }
  }

  bool isPalindrome(String s, int start, int end) {
    if (start >= end) return true;
    if (s[start] != s[end]) return false;
    return isPalindrome(s, start + 1, end - 1);
  }

  List<String> sList = s.split('');
  int left = (n - 1) ~/ 2;
  int right = n ~/ 2;
  --n;
  solve(sList, n, left, right, k);
  s = sList.join('');
  if (isPalindrome(s, 0, n))
    return s;
  else
    return "-1";
}