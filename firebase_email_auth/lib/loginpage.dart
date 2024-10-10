import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_auth/forgotpassword.dart';
import 'package:firebase_email_auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isloading = false;
  signIn() async {
    setState(() {
      isloading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error Message", e.code);
    } catch (e) {
      Get.snackbar("Error Message", e.toString());
    }
    setState(() {
      isloading = false;
    });
  }

  // Signup() {
  //   return Signup();
  // }

  // forgotpassword() {
  //   return Forgotpassword();
  // }

  @override
  Widget build(BuildContext context) {
    return isloading?Center(child: CircularProgressIndicator(),): Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
            ElevatedButton(onPressed: (() => signIn()), child: Text("Login")),
            ElevatedButton(
                onPressed: (() => Get.to(Signup())),
                child: Text("Register Now")),
            ElevatedButton(
                onPressed: (() => Get.to(const Forgotpassword())),
                child: Text("Forgot Password"))
          ],
        ),
      ),
    );
  }
}
