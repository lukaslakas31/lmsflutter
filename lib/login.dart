import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  /// Constructs a [LoginScreen]
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              'App_',
              style: TextStyle(
                fontFamily: 'FredokaOne',
                fontSize: 100,
                color: Color.fromRGBO(251, 142, 55, 1),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
