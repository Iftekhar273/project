import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:project/user.dart';

import 'package:project/signup_page.dart';

import 'forgot_password_page.dart';
import 'new_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.33,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/SRI JAYA ONLINE.png"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 15,
                bottom: 40,
                right: 20,
                top: 10), //You can use EdgeInsets like above
            margin:
                const EdgeInsets.only(left: 15, bottom: 40, right: 20, top: 10),
            child: Column(
              children: [
                const Text(
                  "WELCOME",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Text(
                    "Log in to your SJO account",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w600),
                  ),
                ),
                TextField(
                  controller: email,
                  //  hintText: 'PLACE HOLDER TEXT'
                  decoration: InputDecoration(
                      hintText: "Enter Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((50)))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: TextField(
                    controller: password,
                    // labelText: 'PLACE HOLDER TEXT FOR PASSWORD'
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular((50)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(120, 15, 0, 0),
                  child: GestureDetector(
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.end,
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage())),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: w * 0.5,
          //   height: h * 0.06,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(40),
          //     image: const DecorationImage(
          //         image: AssetImage("img/button2.jpg"), fit: BoxFit.cover),
          //   ),
          //   child: const Center(
          //     child: Text(
          //       "Sign In",
          //       style: TextStyle(color: Colors.white, fontSize: 30),
          //     ),
          //   ),
          // ),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: email.text, password: password.text)
                  .then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPage()),
                );
              }).onError((error, stackTrace) {
                print("Error");
              });
            },
            child: const FittedBox(
              child: Text(
                'Log In',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: w * 0.08,
          ),
          GestureDetector(
            child: RichText(
              text: TextSpan(
                  text: "Don't have an SJO account?",
                  style: TextStyle(color: Colors.grey[500], fontSize: 20),
                  children: [
                    TextSpan(
                        text: "Create",
                        style: TextStyle(color: Colors.grey[900], fontSize: 20))
                  ]),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
          )
        ],
      ),
    );
  }
}
