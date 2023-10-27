import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_workshop_mobile/controllers/register_controller.dart';
import 'package:project_workshop_mobile/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Start Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final register = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selamat datang ${register.religionController.text} di aplikasi Flutter Penjualan Buku!',
            ),

            SizedBox(height: 50), // Jarak vertikal antara teks dan tombol
            ElevatedButton(
              onPressed: () {
                // Fungsi yang akan dijalankan saat tombol ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Register()), // Navigasi ke halaman Register
                );
              },
              child: Text(
                'Getting Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20, // Ukuran teks
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: Size(200, 50), // Atur ukuran tombol (lebar x tinggi)
                // Tambahan gaya tombol seperti warna latar belakang, bentuk, dll.
              ),
            ),
          ],
        ),
      ),


      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const Register()),
      //     );
      //   },
      //   tooltip: 'Register',
      //   child: const Icon(Icons.person_add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
