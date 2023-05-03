import 'package:flutter/material.dart';
import 'package:lmsflutter/widget/CourseCard.dart';

class CourseListScreen extends StatelessWidget {
  CourseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'Course List',
                style: TextStyle(
                  fontFamily: 'FredokaOne',
                  fontSize: 42,
                  color: Color.fromRGBO(251, 142, 55, 1),
                ),
              ),
              SizedBox(height: 16),
              CourseCard(
                key: ValueKey(['tite']),
                code: 'ccci123',
                name: 'English',
                description: 'lorem ipsum',
                imageUrl:
                    'https://cf.shopee.ph/file/5f2d90a41d8f6e4e16ef2e7c576bce8e',
              ),
              CourseCard(
                key: ValueKey(['123']),
                code: 'ssni-777',
                name: 'AP',
                description: 'lorem ipsum',
                imageUrl:
                    'https://cf.shopee.ph/file/5f2d90a41d8f6e4e16ef2e7c576bce8e',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
