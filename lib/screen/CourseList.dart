import 'package:flutter/material.dart';
import 'package:lmsflutter/widget/CourseCard.dart';
import 'package:lmsflutter/model/course_model.dart';

class CourseListScreen extends StatelessWidget {
  CourseListScreen({Key? key, required this.courses}) : super(key: key);

  final List<Course> courses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Course List',
                style: TextStyle(
                  fontFamily: 'FredokaOne',
                  fontSize: 42,
                  color: Color.fromRGBO(251, 142, 55, 1),
                ),
              ),
              SizedBox(height: 16),
              for(final course in courses)
                CourseCard(
                  key: ValueKey(course.code),
                  code: course.code,
                  name: course.name,
                  description: course.description,
                  imageUrl: course.source,
                )
            ],
          ),
        ),
      ),
    );
  }
}
