import 'dart:convert';

import 'dart:io';
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  File _image;
  bool imageis = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black54, BlendMode.darken),
                    image: AssetImage("assets/images/register_bg.png")),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50,
                      backgroundImage: imageis
                          ? Image.file(
                              _image,
                              fit: BoxFit.cover,
                            ).image
                          : null,
                      child: Stack(
                        children: [
                          imageis
                              ? Text('')
                              : Center(
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                          GestureDetector(
                            onTap: _openCamera,
                            child: Align(
                              alignment: Alignment(0.8, 0.9),
                              child: Icon(
                                Icons.camera_enhance,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextFormField(
                        controller: userController,
                        validator: (String text) {
                          if (text.isEmpty) {
                            return "Username is empty";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Icon(Icons.person),
                          ),
                          fillColor: Colors.black,
                          border: InputBorder.none,
                          hintText: "User",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextFormField(
                        controller: emailController,
                        validator: (String text) {
                          if (text.isEmpty ||
                              !text.contains("@") ||
                              !text.contains(".com")) {
                            return "Email is INVALID";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Icon(Icons.email),
                          ),
                          fillColor: Colors.black,
                          border: InputBorder.none,
                          hintText: "Email",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextFormField(
                        controller: passwordController,
                        validator: (String text) {
                          if (text.isEmpty) {
                            return "Password is INVALID";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Icon(Icons.lock),
                          ),
                          fillColor: Colors.black,
                          border: InputBorder.none,
                          hintText: "Password",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextFormField(
                        controller: confirmpasswordController,
                        validator: (String text) {
                          if (text.isEmpty) {
                            return "Email is INVALID";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Icon(Icons.lock),
                          ),
                          fillColor: Colors.black,
                          border: InputBorder.none,
                          hintText: "Confirm Password",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: 200.0,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Registration();
                        }
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Text("Login",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 18)))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Registration() async {
    final response =
        await http.post("https://pbh-app.herokuapp.com/api/jwtauth/register/",
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({
              "username": userController.text,
              "email": emailController.text,
              "password": passwordController.text,
              "password2": confirmpasswordController.text,
            }));
    print(response.body);
    if (response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text("Invalid credentials")));
    }
  }

  _openCamera() async {
    print("clicked on open camera ");
    await getImage();
  }

  Future getImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          imageis = true;
          print("picked pife successfull");
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } catch (exp) {
      print(exp);
    }
  }
}
