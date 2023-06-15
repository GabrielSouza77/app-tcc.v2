import 'package:flutter/foundation.dart';

class RadioButtonState extends ChangeNotifier {
  String selectedOption = '';

  void setSelectedOption(String option) {
    selectedOption = option;
    notifyListeners();
  }
}
