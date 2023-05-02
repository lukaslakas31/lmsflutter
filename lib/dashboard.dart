import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  /// Constructs a [DashboardScreen]
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //start code here
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/login'),
              child: const Text('go to login page'),
            ),
          ],
        ),
      ),
    );
  }
}
