import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:project_workshop_mobile/controllers/register_controller.dart';
import 'package:project_workshop_mobile/forgot-pw_page.dart';
import 'package:project_workshop_mobile/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  // final LoginController controller = Get.find();

  String? _selectedGender, _selectedAgama;
  DateTime? _selectedBirth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 150,
                          child: Image.asset('assets/logo.png'),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Please enter name'),
                          MinLengthValidator(3,
                              errorText: 'Minimum 3 charecter filled name'),
                        ]),
                        // controller: controller.usernameController,
                        decoration: const InputDecoration(
                            hintText: 'Username',
                            labelText: 'Username',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            errorStyle: TextStyle(fontSize: 10.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0)))),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter your Password'),
                          MinLengthValidator(8,
                              errorText: 'Please correct password filled'),
                        ]),
                        // controller: controller.passwordController,
                        decoration: const InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.lightBlue,
                            ),
                            errorStyle: TextStyle(fontSize: 10.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0)))),
                      ),
                    ),


                                        Center(
                      child: TextButton(
                            onPressed: () {
                              // Gantilah perintah ini dengan aksi yang sesuai, seperti pengalihan ke halaman login
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));  
                            },
                            child: Text(
                              'Lupa password',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                    ),
                    
                    Center(
                      child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      // child: Container(
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       if (_formkey.currentState!.validate()) {
                      //         controller.birthdayController.value =
                      //             _selectedBirth as TextEditingValue;
                      //         controller.genderController.value =
                      //             _selectedGender as TextEditingValue;
                      //         controller.religionController.value =
                      //             _selectedAgama as TextEditingValue;
                      //       }
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(30),
                      //       ),
                      //       primary: Colors.blue,
                      //     ),
                      //     child: const Text(
                      //       'Login',
                      //       style: TextStyle(color: Colors.white, fontSize: 22),
                      //     ),
                      //   ),
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 50,
                      // ),
                    )),
                  ],
                )),
          ),
        ));
  }
}
