import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class LoginScreen extends StatelessWidget {
  /// Constructs a [LoginScreen]
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //start code here
    return Scaffold(
      appBar: AppBar(title: const Text('Log in')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('log in page')
          ],
        ),
      ),
    );
  }
}
