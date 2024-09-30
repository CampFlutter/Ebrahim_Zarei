void main() {
  final numbers = [3, 6.3, 5, 9.8, 7, 6.4, 8, 9.2, 10.3, 16, 15.5];
  num power2(num number) {
  return number * number;
}
  for (var element in numbers) {
    if (element is int) {
      print("$element is int, power 2 is ${power2(element)}");
    } else {
      element is double;
      print(
          "$element is double, power 3 is ${power3(element).toStringAsFixed(1)}");
    }
  }

}



num power3(num number) {
  return number * number * number;
}
