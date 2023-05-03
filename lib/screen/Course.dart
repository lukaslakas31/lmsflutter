import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CourseScreen extends StatelessWidget {
  /// Constructs a [CourseScreen]
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //start code here
    return Scaffold(
      appBar: AppBar(title: const Text('Course')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('course page')
          ],
        ),
      ),
    );
  }
}
