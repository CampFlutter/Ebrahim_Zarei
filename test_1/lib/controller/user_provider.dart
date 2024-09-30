import 'package:flutter/material.dart';

    enum Gender {
    male, female
  }
class UserProvider extends ChangeNotifier {
  int _height = 50;
  double _weight = 60;
  double bmi = 0;
  int get height => _height;
  double get weight => _weight;
  // double get bmi => _bmi;

  Gender _selectedGender = Gender.male;

  Gender get selectedGender => _selectedGender;

  set selectedGender(Gender gender){
    _selectedGender = gender;
    notifyListeners();
  }


  set height(int value) {
    _height = value ;
    notifyListeners();
  }

  set weight(double value) {
    _weight = value;
    notifyListeners();
  }
  
  calBmi(){
    print(_height);
    print(weight);
   bmi= _weight/ ((_height / 100) * (_height / 100));
   print(bmi);
   notifyListeners();
  }
}