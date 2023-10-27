import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  DateTime? birthdayController = DateTime.timestamp();
  TextEditingController genderController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void onInit() {}

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //jika aplikasi ditutup controller data dibawah akan hilang
    nameController.dispose();
    passwordController.dispose();
  }
}
