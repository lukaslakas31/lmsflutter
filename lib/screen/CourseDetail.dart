import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lmsflutter/widget/Subjects.dart';
import 'package:lmsflutter/model/course_model.dart';
import 'package:go_router/go_router.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key, required this.courses, required this.code});

  final List<Course> courses;
  final String code;

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  int _selectedIndex = 0;
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
              for(final course in widget.courses)
                if(course.code == widget.code)
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
      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          child: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(251, 142, 55, 1),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.class_,
                ),
                label: 'My Course',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (int index) {
              switch(index){
                case 0:
                  context.go('/dashboard');
                  break;
                case 1:
                  context.go('/course');
                  break;
                default:
                 const Text('Screen not found.');
              }
              setState(() {
                _selectedIndex = index;
              });
            },
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
          ),
        )
    );
  }
}
