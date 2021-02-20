import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
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
                    onPressed: () {},
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
    );
  }
}
