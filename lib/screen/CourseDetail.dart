import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:lmsflutter/widget/Subjects.dart';
import 'package:lmsflutter/model/course_model.dart';
import 'package:go_router/go_router.dart';
import 'package:accordion/accordion.dart';

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
                const Text(
                  'Course Details',
                  style: TextStyle(
                    fontFamily: 'FredokaOne',
                    fontSize: 42,
                    color: Color.fromRGBO(251, 142, 55, 1),
                  ),
                ),
                const SizedBox(height: 16),
                for (final course in widget.courses)
                  if (course.code == widget.code)
                    Subjects(
                      key: ValueKey(course.code),
                      code: course.code,
                      name: course.name,
                      description: course.description,
                      imageUrl: course.source,
                    ),
                Accordion(
                  disableScrolling: true,
                  maxOpenSections: 2,
                  headerBackgroundColorOpened: Colors.black54,
                  scaleWhenAnimating: true,
                  openAndCloseAnimation: true,
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  children: [
                    AccordionSection(
                      isOpen: false,
                      leftIcon: const Icon(Icons.insights_rounded,
                          color: Colors.white),
                      headerBackgroundColor:
                          const Color.fromRGBO(251, 142, 55, 1),
                      headerBackgroundColorOpened:
                          const Color.fromRGBO(251, 142, 55, 1),
                      headerPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      header: const Text(
                        'Introduction',
                        style: TextStyle(
                          fontFamily: 'FredokaOne',
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      content: const Text(
                        '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 20,
                        ),
                      ),
                      contentHorizontalPadding: 20,
                      contentBorderWidth: 1,
                    ),
                    AccordionSection(
                      isOpen: false,
                      leftIcon: const Icon(Icons.movie, color: Colors.white),
                      headerBackgroundColor:
                          const Color.fromRGBO(251, 142, 55, 1),
                      headerBackgroundColorOpened:
                          const Color.fromRGBO(251, 142, 55, 1),
                      headerPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      header: const Text(
                        'Lesson #1',
                        style: TextStyle(
                          fontFamily: 'FredokaOne',
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      content: const Icon(
                        Icons.play_arrow,
                        size: 200,
                        color: Color(0xff999999),
                      ),
                      contentHorizontalPadding: 20,
                      contentBorderWidth: 1,
                    ),
                  ],
                ),
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
              switch (index) {
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
        ));
  }
}
