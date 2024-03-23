import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Controller/log_in_controller.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginController controller = Get.put(LoginController());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * .8,
                child: Image.asset(
                  'assets/images/logo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller.emailcontroller.value,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alternate_email),
                        hintText: 'Email Id'),
                    validator: (value){
                      if(value == null || value.isEmpty ){
                        Fluttertoast.showToast(
                            msg: "Please enter your email",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                      return null;
                    },

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.passwordController.value,
                    obscureText: _isSecurePassword,
                    decoration: InputDecoration(
                        suffixIcon: PasswordToggleWidget(),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password'),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        Fluttertoast.showToast(
                            msg: "Please enter your password",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                      return null;
                    },
                  ),
                  // password

                  SizedBox(height: 7),

                  Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ))),
                  SizedBox(
                    height: 7,
                  ),
                  Obx(() {
                    return InkWell(
                      onTap: () {
                        if(_formkey.currentState!.validate()){
                          controller.loginApi();
                        }
                      },
                      child: controller.loading.value
                          ? CircularProgressIndicator()
                          : Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade400,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text("Login"),
                              ),
                            ),
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 50, right: 90),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              "assets/images/google_logo.webp",
                              fit: BoxFit.cover,
                            )),
                        Text(
                          "Login with Google",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New to Logistics?"),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

bool _isSecurePassword = true;

// Widget togglePass() {
//   return IconButton(
//     onPressed: () {
//       setState((){
//         _isSecurePassword = !_isSecurePassword;
//
//       });
//     },
//     icon:
//         _isSecurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
//   );
// }

class PasswordToggleWidget extends StatefulWidget {
  @override
  _PasswordToggleWidgetState createState() => _PasswordToggleWidgetState();
}

class _PasswordToggleWidgetState extends State<PasswordToggleWidget> {
  bool _isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
    );
  }
}

//
// Column(
//
// children: [
// Center(
// child: Container(
// alignment: Alignment.bottomLeft,
// child: InkWell(
// onTap: () {
// controller.loginApi();
// },
// child: controller.loading.value
// ? Container(
// alignment: Alignment.center,
// child: CircularProgressIndicator())
//     : Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.blue.shade400,
// ),
// height: 45,
// width: MediaQuery.of(context).size.width * 0.8,
// child: const Center(
// child: Text('Login'),
// ),
// ),
// ),
// ),
// ),
// ],
// );
