import 'dart:io';

void main() {
  print(calFibo(int.parse(stdin.readLineSync().toString())));
}
  Map fibo = {
    1 : 1,
    2 : 1
  };
  int calFibo (int x) {
    if(fibo.containsKey(x)) {
      return fibo[x];
    } else {
        var result = calFibo(x - 1) + calFibo(x - 2);
        fibo[x] = result;
        print(fibo);
        return result;
    }
    
  }