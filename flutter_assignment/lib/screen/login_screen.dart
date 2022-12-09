// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_assignment/services/authentication.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController email = TextEditingController();
//     TextEditingController password = TextEditingController();
//     const spacingHeight = SizedBox(height: 20);
//     //const spacinWidth = SizedBox(width: 15);
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 FlutterLogo(size: 100),
//                 Text(
//                   'Welcom back \nLogin',
//                   style: Theme.of(context).textTheme.headline3,
//                   textAlign: TextAlign.center,
//                 ),
//                 spacingHeight,
//                 TextField(
//                   controller: email,
//                   style: Theme.of(context).textTheme.headline6,
//                   decoration: const InputDecoration(
//                     hintText: 'Enter  Email',
//                   ),
//                 ),
//                 spacingHeight,
//                 TextField(
//                   controller: password,
//                   style: Theme.of(context).textTheme.headline6,
//                   decoration: const InputDecoration(
//                     hintText: 'Enter Password',
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 CupertinoButton.filled(
//                   child: const Text('Log in'),
//                   onPressed: () async {
//                     await AuthenticationService()
//                         .Login(email.text, password.text);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/authentication.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    const spacingHeight = SizedBox(height: 30);
    //const spacingWidth = SizedBox(width: 15);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const FlutterLogo(size: 120),
                spacingHeight,
                Text(
                  'Welcome back \nto Login',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: email,
                  style: Theme.of(context).textTheme.headline6,
                  decoration: const InputDecoration(
                    hintText: 'Enter email',
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: password,
                  style: Theme.of(context).textTheme.headline6,
                  decoration: const InputDecoration(
                    hintText: 'Enter password',
                  ),
                ),
                const SizedBox(height: 50),
                CupertinoButton.filled(
                  child: const Text('Log in'),
                  onPressed: () async {
                    await AuthenticationService().Login(
                      email.text,
                      password.text,
                    );
                  },
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const RegisterScreen());
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
