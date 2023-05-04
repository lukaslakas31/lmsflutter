import 'package:flutter/material.dart';
import 'package:lmsflutter/widget/CourseCard.dart';
import 'package:lmsflutter/model/course_model.dart';
import 'package:lmsflutter/model/student_model.dart';

class MyCourseScreen extends StatelessWidget {
  MyCourseScreen({Key? key, required this.courses, required this.user}) : super(key: key);

  final List<Course> courses;
  final Student user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'My Course',
                style: TextStyle(
                  fontFamily: 'FredokaOne',
                  fontSize: 42,
                  color: Color.fromRGBO(251, 142, 55, 1),
                ),
              ),
              const SizedBox(height: 16),
              for (final code in user.courseCodes)
                for(final course in courses)
                  if(course.code == code)
                    CourseCard(
                      key: ValueKey(course.code),
                      // code: course.code,
                      // name: course.name,
                      // description: course.description,
                      // imageUrl: course.source,
                      course: course,
                      buttonText: 'View Course',
                      addCode: null,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
