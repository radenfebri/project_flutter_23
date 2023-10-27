import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:project_workshop_mobile/controllers/register_controller.dart';
import 'package:project_workshop_mobile/main.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formkey = GlobalKey<FormState>();
  // final ForgotPasswordController controller = Get.find();

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
                          RequiredValidator(errorText: 'Enter email address'),
                          EmailValidator(
                              errorText: 'Please correct email filled'),
                        ]),
                        // controller: controller.emailController,
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
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
                              // Gantilah perintah ini dengan aksi yang sesuai, seperti pengalihan ke halaman ForgotPassword
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
                      //       'ForgotPassword',
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
