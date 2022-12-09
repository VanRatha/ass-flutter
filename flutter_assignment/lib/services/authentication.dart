import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/screen/home_screen.dart';
import 'package:flutter_assignment/widget/show_message.dart';
import 'package:get/get.dart';

class AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future Login(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Get.to(const HomeScreen());
        debugPrint('Log in successed...!!');
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'User-not-found') {
        ShowMessage.showSnackbar('No User found for that email');
      } else if (e.code == 'Worng-password') {
        ShowMessage.showSnackbar('Wrong password provided for that user');
      }
    }
  }

  Future logout() async {
    return auth.signOut();
  }

  void register(String trim, String trim2) {}
}
