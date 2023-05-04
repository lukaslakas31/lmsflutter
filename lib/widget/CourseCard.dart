import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmsflutter/widget/Subjects.dart';

class CourseCard extends StatelessWidget {
  final String code;
  final String name;
  final String description;
  final String imageUrl;
  final String buttonText;
  final Key key;

  const CourseCard({
    required this.code,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.key,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ListTile(
            key: key,
            title: Text(
              code,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Lexend',
              ),
            ),
            subtitle: Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Lexend',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Lexend',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (buttonText == 'Enroll Course') {
                Null;
              } else {
                context.go('/course_detail');
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromRGBO(251, 142, 55, 1),
              padding: const EdgeInsets.symmetric(vertical: 8),
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
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
