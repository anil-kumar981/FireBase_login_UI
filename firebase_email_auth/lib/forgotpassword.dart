import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
   TextEditingController email = TextEditingController();
 // TextEditingController password = TextEditingController();
  resetLink() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
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
            // TextField(
            //   controller: password,
            //   decoration: InputDecoration(
            //     hintText: "Enter Password",
            //   ),
            // ),
            ElevatedButton(onPressed: (()=> resetLink()), child: Text("Reset link"))
          ],
        ),
      ),
    );
  }
}