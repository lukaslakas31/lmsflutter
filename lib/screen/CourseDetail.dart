import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:lmsflutter/widget/Subjects.dart';
import 'package:lmsflutter/model/course_model.dart';
import 'package:go_router/go_router.dart';
import 'package:accordion/accordion.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:lmsflutter/widget/Review.dart';

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
                for (final course in widget.courses)
                  if (course.code == widget.code)
                    Subjects(
                      key: ValueKey(course.code),
                      code: course.code,
                      name: course.name,
                      description: course.description,
                      imageUrl: course.source,
                      url: course.youtubeUrl,
                    ),
                Accordion(
                  disableScrolling: true,
                  maxOpenSections: 1,
                  headerBackgroundColorOpened: Colors.black54,
                  scaleWhenAnimating: true,
                  openAndCloseAnimation: true,
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  children: [
                    AccordionSection(
                      isOpen: true,
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
                      isOpen: true,
                      leftIcon: const Icon(Icons.edit_note,
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
                        'Course content',
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
                      // contentHorizontalPadding: 20,
                      contentBorderWidth: 1,
                    ),
                    AccordionSection(
                      isOpen: true,
                      contentVerticalPadding: 20,
                      leftIcon: const Icon(Icons.person,
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
                        'Author',
                        style: TextStyle(
                          fontFamily: 'FredokaOne',
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage('https://static6.businessinsider.com/image/56a8f50ddd089553198b4731-1200/ditch-the-smirk-when-it-comes-to-profile-pictures-only-2-of-the-top-ranked-profiles-on-okcupid-featured-people-hiding-their-smiles-instead-try-smiling-with-your-teeth.jpg'),
                          ),
                          Text(
                            'Bro Instructor',
                            style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      // contentHorizontalPadding: 20,
                      contentBorderWidth: 1,
                    )
                  ],
                ),
                Text(
                  'Featured reviews',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Review(),
                    Review(),
                    Review()
                  ],
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
