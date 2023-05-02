import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CourseListScreen extends StatelessWidget {
  /// Constructs a [CourseListScreen]
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //start code here
    return Scaffold(
      appBar: AppBar(title: const Text('Course List')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('course list page')
          ],
        ),
      ),
    );
  }
}
