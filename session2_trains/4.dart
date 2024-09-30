
void main() {
  final text = "Dart was unveiled at the GOTO conference in Aarhus, Denmark, October Lars Bak and Kasper Lund founded the project Dart was released in November, Dart had a mixed reception at first. Some criticized the Dart initiative for fragmenting the web because of plans to include a Dart VM in Chrome. Those plans were dropped in with the Dart release. Focus changed to compiling Dart code to JavaScript.";
  Map<int , int> countWord = {};
  var splittedText = text.split(' ');
  for (var word in splittedText) {
    var wordLength = word.length;
    if(countWord.containsKey(wordLength)){
      countWord[wordLength] = countWord[wordLength]! + 1;
    } else {
      countWord[wordLength] = 1;
    }
  }
  final sortedList = countWord.keys.toList()..sort();
  sortedList.forEach( (key){
    print("$key letter(s): ${countWord[key]}");
  });
}