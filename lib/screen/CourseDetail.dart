import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lmsflutter/widget/Subjects.dart';
import 'package:lmsflutter/model/course_model.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({super.key, required this.courses, required this.code});

  final List<Course> courses;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Course Details',
                style: TextStyle(
                  fontFamily: 'FredokaOne',
                  fontSize: 42,
                  color: Color.fromRGBO(251, 142, 55, 1),
                ),
              ),
              SizedBox(height: 16),
              for(final course in courses)
                if(course.code == code)
                  Subjects(
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
