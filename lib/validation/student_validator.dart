import 'package:flutter/material.dart';

class StudentValidationMixin {
  String validateFirstName(String value) {
    if (value.length < 2) {
      return "İsim en az iki karakter olmalıdır";
    }
    return "";
  }

  String validateLastName(String value) {
    if (value.length < 2) {
      return "Soyad en az iki karakter olmalıdır";
    }
    return "";
  }

  String validateGradeName(String value) {
    var grade = int.parse(value);
    if (grade < 0 || grade > 100) {
      return "Not 0-100 arasında olmalıdır";
    }
    return "";
  }
}
