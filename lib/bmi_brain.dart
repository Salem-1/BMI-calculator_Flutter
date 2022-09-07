import 'package:flutter/material.dart';
import 'dart:math';

class BmiBrain {
  BmiBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;

  String getBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getConc() {
    if (_bmi > 25)
      return 'Overweight';
    else if (_bmi > 18)
      return 'Perfect weight';
    else
      return 'Underweight';
  }

  String getAdvice() {
    if (_bmi > 25)
      return 'ده عز يا باشا متقلقش';
    else if (_bmi < 18)
      return 'قوم كللك لقمتين ترم عضمك ';
    else
      return 'علي وضعك';
  }
}
