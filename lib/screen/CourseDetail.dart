import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lmsflutter/widget/Subjects.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'Course tite',
                style: TextStyle(
                  fontFamily: 'FredokaOne',
                  fontSize: 42,
                  color: Color.fromRGBO(251, 142, 55, 1),
                ),
              ),
              SizedBox(height: 16),
              Subjects(
                key: ValueKey(1),
                code: 'ssni',
                name: 'English',
                description: 'lorem ipsum',
                imageUrl: 'youjizz.com',
              )
            ],
          ),
        ),
      ),
    );
  }
}
