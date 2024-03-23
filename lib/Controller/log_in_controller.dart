import 'dart:convert';
import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/api_servie.dart';
import '../Views/home_screen.dart';

class LoginController extends GetxController {
  final emailcontroller = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
RxBool loading = false.obs;

  void loginApi() async {
    loading.value= true;
    try {
      final response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': emailcontroller.value.text,
        'password': passwordController.value.text,
      });

      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data); // for checking its right or not.

      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar("Login Successfully", "Congrats");
        Get.to(HomePage());
        // Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>HomePage()));
      } else {
        loading.value = false;
        Get.snackbar("Login Failed", data["Error"]);
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar("Execption", e.toString());
    }
  }


}
