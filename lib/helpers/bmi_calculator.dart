import 'package:flutter/material.dart';

import '../constants/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;
  Color? bmiCategoryColor;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi){
    // this.bmi = bmi;
  }

  double calculateBMI() {
    double heightInMeter = height! / 100;
    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;

    return bmi!;
  }

    determineBmiCategory(){
    String category = "";
    if (bmi! < 16.0) {
      category = underweightSevere;
    } else if (bmi! < 17) {
      category = underweightModerate;
    } else if (bmi! < 18.5) {
      category = underweightMild;
    } else if (bmi! < 25) {
      category = normal;
    } else if (bmi! < 30) {
      category = overweight;
    } else if (bmi! < 35) {
      category = obeseI;
    } else if (bmi! < 40) {
      category = obeseII;
    } else if (bmi! >= 40) {
      category = obeseIII;
    } 
    bmiCategory = category;
    return category;
  }

  determineBmiCategoryColor(){
    Color? categoryColor;
    if (determineBmiCategory() == underweightSevere) {
      categoryColor = Colors.red;
    } else if (determineBmiCategory() == underweightModerate) {
      categoryColor = Colors.red[300];
    } else if (determineBmiCategory() == underweightMild) {
      categoryColor = Colors.yellow[700];
    } else if (determineBmiCategory() == normal) {
      categoryColor = Colors.green;
    } 
    else if (determineBmiCategory() == overweight) {
      categoryColor = Colors.yellow;
    } 
    else if (determineBmiCategory() == obeseI) {
      categoryColor = Colors.red[300];
    } 
    else if (determineBmiCategory() == obeseII) {
      categoryColor = Colors.red;
    } else if (determineBmiCategory() == obeseIII) {
      categoryColor = Colors.red[900];
    } 
    bmiCategoryColor = categoryColor;
    return categoryColor;
  }

  String getHealRiskDescription() {
    String desc = "";
    switch (bmiCategory) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis.";
        break;
      case normal:
        desc = "Low risk (healthy range).";
        break;
      case overweight:
        desc = "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc = "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome";
        break;
      default:
    }
    bmiDescription = desc;
    return desc;
  }
}