import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeController extends GetxController{
  Rx<ThemeMode>currentTheme=ThemeMode.system.obs;
  void SwitchTheme(){
    currentTheme.value = currentTheme.value == ThemeMode.light?ThemeMode.dark:ThemeMode.light;
  }
}