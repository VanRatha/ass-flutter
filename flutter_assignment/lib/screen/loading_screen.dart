// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_assignment/screen/home_screen.dart';
// import 'package:flutter_assignment/screen/login_screen.dart';

// class LoadingScreen extends StatelessWidget {
//   const LoadingScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return _loading();
//           }
//           if (snapshot.hasError) {
//             return _error(context);
//           }
//           if (snapshot.hasData) {
//             return const HomeScreen();
//           }
//           return const LoginScreen();
//         },
//       ),
//     );
//   }
// }

// Widget _loading() {
//   return const Center(
//     child: CircularProgressIndicator(),
//   );
// }

// Widget _error(BuildContext context) {
//   return Center(
//     child: Text(
//       'Something went wrong...!',
//       style: Theme.of(context).textTheme.headline6,
//     ),
//   );
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _loading();
          }
          if (snapshot.hasError) {
            return _error(context);
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _error(BuildContext context) {
    return Center(
      child: Text(
        "Something went wrong...!",
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
