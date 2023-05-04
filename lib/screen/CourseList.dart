import 'package:flutter/material.dart';
import 'package:lmsflutter/widget/CourseCard.dart';
import 'package:lmsflutter/model/course_model.dart';
import 'package:lmsflutter/model/student_model.dart';
import 'package:go_router/go_router.dart';

class CourseListScreen extends StatefulWidget {
  CourseListScreen({Key? key, required this.courses, required this.user}) : super(key: key);

  final List<Course> courses;
  final Student user;

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Course List',
                style: TextStyle(
                  fontFamily: 'FredokaOne',
                  fontSize: 42,
                  color: Color.fromRGBO(251, 142, 55, 1),
                ),
              ),
             const  SizedBox(height: 16),
              for(final course in widget.courses)
                if(widget.user.hasCode(course.code) == -1)
                  CourseCard(
                    key: ValueKey(course.code),
                    // code: course.code,
                    // name: course.name,
                    // description: course.description,
                    // imageUrl: course.source,
                    course: course,
                    buttonText: 'Enroll Course',
                    addCode: widget.user.addCourse,
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
