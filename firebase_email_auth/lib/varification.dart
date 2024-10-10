import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_auth/wapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Varification extends StatefulWidget {
  const Varification({super.key});

  @override
  State<Varification> createState() => _VarificationState();
}

class _VarificationState extends State<Varification> {
  @override
  void initState() {
    // TODO: implement initState
    sendVarifyLink();
    super.initState();
  }

  sendVarifyLink() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value) => {
          Get.snackbar('Link send', 'A link has been send to you mail',
              margin: const EdgeInsets.all(20),
              snackPosition: SnackPosition.BOTTOM)
        });
  }

  reload() async {
    await FirebaseAuth.instance.currentUser!
        .reload()
        .then((value) => {Get.offAll(const Wapper())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Varification Link"),
      ),
      body: Text("Open your email and varify the link"),
      floatingActionButton: FloatingActionButton(
        onPressed: reload,
        child: Icon(Icons.restart_alt),
      ),
    );
  }
}
