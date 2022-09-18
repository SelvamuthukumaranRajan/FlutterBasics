import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsController extends GetxController {
  var password = "";
  final passwordController  = TextEditingController();

  updatePassword(String name) {
    password = name;
  }
}
