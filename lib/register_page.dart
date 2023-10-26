import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project_workshop_mobile/main.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();

  String? _selectedGender, _selectedAgama;
  DateTime? _selectedDate;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          automaticallyImplyLeading: false,
        ),
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
                          //decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(40),
                          //border: Border.all(color: Colors.blueGrey)),
                          child: Image.asset('assets/logo.png'),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        // validator: ((value) {
                        // if (value == null || value.isEmpty) {
                        //	 return 'please enter some text';
                        // } else if (value.length < 5) {
                        //	 return 'Enter atleast 5 Charecter';
                        // }

                        // return null;
                        // }),
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Please enter name'),
                          MinLengthValidator(3,
                              errorText: 'Minimum 3 charecter filled name'),
                        ]),
                        controller: _usernameController,
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
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter Full Name'),
                          MinLengthValidator(3,
                              errorText:
                                  'Full Name should be atleast 3 charater'),
                        ]),
                        controller: _nameController,
                        decoration: const InputDecoration(
                            hintText: 'Full Name',
                            labelText: 'Full named',
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
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter email address'),
                          EmailValidator(
                              errorText: 'Please correct email filled'),
                        ]),
                        controller: _emailController,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter your Password'),
                          MinLengthValidator(8,
                              errorText: 'Please correct password filled'),
                        ]),
                        controller: _passwordController,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DateTimeFormField(
                        decoration: const InputDecoration(
                          hintText: 'Birthday',
                          labelText: 'Birthday',
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Colors.lightBlue,
                          ),
                          errorStyle: TextStyle(fontSize: 10.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.0)),
                          ),
                        ),
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        onDateSelected: (DateTime selectedDate) {
                          setState(() {
                            _selectedDate = selectedDate;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<String>(
                        value: _selectedAgama,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedAgama = newValue;
                          });
                        },
                        items: <String>['Laki-laki', 'Perempuan']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Pilih jenis kelamin';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Jenis Kelamin',
                          labelText: 'Jenis Kelamin',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.all(Radius.circular(9)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<String>(
                        value: _selectedGender,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                        items: <String>[
                          'Islam',
                          'Hindu',
                          'Budha',
                          'Kristen',
                          'Katolik'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Pilih Agama';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Agama',
                          labelText: 'Agama',
                          prefixIcon: Icon(
                            Icons.privacy_tip,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.all(Radius.circular(9)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter your Address'),
                          // Tambahkan validasi sesuai kebutuhan
                        ]),
                        controller: _addressController,
                        decoration: const InputDecoration(
                          hintText: 'Alamat',
                          labelText: 'Alamat',
                          prefixIcon: Icon(
                            Icons.location_on,
                            // Menggunakan ikon lokasi untuk alamat
                            color: Colors.blue,
                          ),
                          errorStyle: TextStyle(fontSize: 10.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.0)),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              print(_usernameController.text);
                              print(_nameController.text);
                              print(_emailController.text);
                              print(_passwordController.text);
                              print(_selectedDate);
                              print(_selectedGender);
                              print(_selectedAgama);
                              print(_addressController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            primary: Colors.blue,
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                      ),
                    )),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors
                                  .blueGrey, // Warna latar belakang tombol
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(30), // Bentuk tombol
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MyHomePage(title: "Dashboard"),
                                ),
                              );
                            },
                            child: const Text(
                              'Dashboard',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
