import 'dart:collection';
import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
   double blurValue = 10.0;
   double speechRate = 0.7;

  void updateBlurValue(double value) {
    blurValue = value;
    notifyListeners();
  }

   void updateSpeechRate(double value) {
     speechRate = value;
     notifyListeners();
   }
   
}
