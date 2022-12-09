import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/authentication.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthenticationService service = AuthenticationService();
    const spacingHeight = SizedBox(height: 30);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const FlutterLogo(size: 100),
              spacingHeight,
              Text(
                'Welcome back \nto Register',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              TextField(
                controller: email,
                style: Theme.of(context).textTheme.headline6,
                decoration: const InputDecoration(
                  hintText: 'Enter email',
                ),
              ),
              spacingHeight,
              TextField(
                controller: password,
                style: Theme.of(context).textTheme.headline6,
                decoration: const InputDecoration(
                  hintText: 'Enter password',
                ),
              ),
              spacingHeight,
              CupertinoButton.filled(
                child: const Text('Register'),
                onPressed: () async {
                  service.register(email.text.trim(), password.text.trim());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
