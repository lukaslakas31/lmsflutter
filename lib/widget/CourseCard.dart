import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmsflutter/widget/Subjects.dart';
import 'package:lmsflutter/model/course_model.dart';

typedef AddCourseCallback = void Function(String);

class CourseCard extends StatelessWidget {
  // final String code;
  // final String name;
  // final String description;
  // final String imageUrl;
  final Course course;
  final String buttonText;
  final AddCourseCallback? addCode;
  final Key key;

  const CourseCard({
    // required this.code,
    // required this.name,
    // required this.description,
    // required this.imageUrl,
    required this.course,
    required this.key,
    required this.buttonText,
    required this.addCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child:
                  Image(image: NetworkImage(course.source), fit: BoxFit.cover),
            ),
            ListTile(
              key: key,
              title: Text(
                course.code,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Lexend',
                ),
              ),
              subtitle: Text(
                course.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Lexend',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                course.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Lexend',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextButton(
                onPressed: () {
                  if (buttonText == 'Enroll Course') {
                    addCode!(course.code);
                    context.go('/course');
                  } else {
                    context.go('/course_detail/${course.code}');
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(251, 142, 55, 1),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: Color.fromRGBO(251, 142, 55, 1),
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontFamily: 'Lexend',
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
