import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_auth/wapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: password.text);
    Get.offAll(Wapper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Enter Email",
              ),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: "Enter Password",
              ),
            ),
            ElevatedButton(onPressed: (() => signUp()), child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
