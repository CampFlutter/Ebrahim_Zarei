void main() {
  var text =
      "Dart is an approachable, portable, and productive language for high-quality apps on any platform.";
  var splittedText = text.split(" ");
  print(splittedText);
  for (var i = 0; i < splittedText.length; i++) {
    if (splittedText[i].length == 3) {
      splittedText[i] = splittedText[i].toUpperCase();
    }
  }
  print(splittedText.join(' '));
}
