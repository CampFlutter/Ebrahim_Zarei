void main() {
  var floatNum = ["2.2" , "6.3" , "2.7" , "4.9" , "5.3"];
  var newFloatNum = <double>[];
  List<String> newNewFloatNum = <String>[];
  for (int i = 0 ; i< floatNum.length ; i++) {
    newFloatNum.add(double.parse(floatNum[i]));
  }
  for(int i = 0; i<newFloatNum.length;i++){
    newNewFloatNum.add(newFloatNum[i].round().toString());
  }
  print(newNewFloatNum);
}