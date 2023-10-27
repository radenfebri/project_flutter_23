import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_workshop_mobile/controllers/register_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    // Logika logout disini
    // Anda dapat menghapus data sesi, menghapus token, dll.

    // Navigasi ke halaman login setelah logout
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  final register = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('dd-MM-yyyy').format(register.birthdayController!);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Book Store'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Tambahkan aksi notifikasi di sini
              },
            ),
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                // Tambahkan aksi logout saat tombol ditekan
                _showLogoutConfirmationDialog(context);
                // _logout(context);
              },
            ),
          ],
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              ListTile(
                title: Text('Nama Lengkap'),
                subtitle: Text(register.nameController.text),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text('Username'),
                subtitle: Text(register.usernameController.text),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text('Email'),
                subtitle: Text(register.emailController.text),
                leading: Icon(Icons.email),
              ),
              ListTile(
                title: Text('Tanggal Lahir'),
                subtitle: Text(date),
                leading: Icon(Icons.date_range),
              ),
              ListTile(
                title: Text('Gender'),
                subtitle: Text(register.genderController.text),
                leading: Icon(Icons.search),
              ),
              ListTile(
                title: Text('Agama'),
                subtitle: Text(register.religionController.text),
                leading: Icon(Icons.privacy_tip),
              ),
              ListTile(
                title: Text('Alamat'),
                subtitle: Text(register.addressController.text),
                leading: Icon(Icons.location_on),
              ),
              SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: () {
              //     // Tambahkan aksi untuk menu 1
              //   },
              //   child: const Text('Edit'),
              // ),
            ],
          ),
)

    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Isi dengan tampilan login Anda
          ],
        ),
      ),
    );
  }
}

Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Logout Confirmation'),
        content: const Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Lakukan logout disini
              // Anda dapat menghapus data sesi, menghapus token, dll.

              // Navigasi ke halaman login setelah logout
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Text('Logout'),
          ),
        ],
      );
    },
  );
}
