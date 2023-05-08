import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmsflutter/model/student_model.dart';
import 'package:lmsflutter/model/course_model.dart';
import 'package:lmsflutter/widget/RecommendCard.dart';

class DashboardScreen extends StatefulWidget {
  /// Constructs a [DashboardScreen]
  const DashboardScreen({
    super.key,
    required this.user,
    required this.logOut,
    required this.courses
  });

  final Student user;
  final VoidCallback logOut;
  final List<Course> courses;
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // if(!widget.isLoggedIn) {
    //   context.go('/login');
    // }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: false,
          title: const Text(
            'app_',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Color.fromRGBO(251, 142, 55, 1),
              fontSize: 32,
              fontFamily: 'FredokaOne',
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 21, 0),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      widget.user.getUserName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Lexend',
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://static6.businessinsider.com/image/56a8f50ddd089553198b4731-1200/ditch-the-smirk-when-it-comes-to-profile-pictures-only-2-of-the-top-ranked-profiles-on-okcupid-featured-people-hiding-their-smiles-instead-try-smiling-with-your-teeth.jpg'),
                      ),
                      onTap: (){
                        widget.logOut();
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
          // actions: [
          //   //LOGOUT BUTTON
          //   Padding(
          //     padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
          //     child: ElevatedButton(
          //       onPressed: () {
          //         widget.logOut();
          //       },
          //       child: Icon(
          //         Icons.logout,
          //         color: Colors.black,
          //         size: 24,
          //       ),
          //       style: ElevatedButton.styleFrom(
          //         minimumSize: const Size(24, 24),
          //         backgroundColor: const Color.fromRGBO(251, 142, 55, 1),
          //         shape: const CircleBorder(),
          //         padding: const EdgeInsets.all(8),
          //       ),
          //     ),
          //   )
          // ],
        ),
        body: SingleChildScrollView(
          //padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              padding: const EdgeInsets.fromLTRB(30, 40, 20, 20),
              width: screenWidth * 1,
              height: 225,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 79, 53, 236),
                    Color.fromARGB(255, 118, 62, 171),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: RichText(
                text: const TextSpan(
                    text: 'Learn\nEverything\nat ',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: 'FredokaOne',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'App_',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.orange,
                          fontFamily: 'FredokaOne',
                        ),
                      )
                    ]),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  height: 130,
                  width: 165,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(124, 244, 216, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.user.getCourseCodes.length}',
                        style: const TextStyle(
                          fontSize: 64,
                          fontFamily: 'Lexend',
                        ),
                      ),
                      const Text(
                        'Courses',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lexend',
                          color: Color.fromRGBO(46, 46, 46, 1)
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  padding: const EdgeInsets.fromLTRB(0, 27, 0, 15),
                  height: 130,
                  width: 165,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(124, 192, 255, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      // Icon(Icons.rocket_launch, color: Colors.blue, size: 60),
                      Text(
                          '🚀',
                        style: TextStyle(
                          fontSize: 54,
                          fontFamily: 'Lexend',
                        ),
                      ),
                      Text(
                        'Beginner',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lexend',
                          color: Color.fromRGBO(46, 46, 46, 1)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: ElevatedButton(
                child: Text(
                  'Explore courses 🔎',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Lexend',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(251, 142, 55, 1),
                  minimumSize: Size(screenWidth * 1, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  context.go('/course_list');
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Recommend for you',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 20,

              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  for(final course in widget.courses)
                    RecommendCard(name: course.name, source: course.source,),
                ],
              ),
            )
          ]),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
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
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'My Account',
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
                case 2:
                  context.go('/user');
                  break;
                default:
                  const Text('Screen not found.');
              }
              setState(() {
                _selectedIndex = index;
              });
            },
            unselectedItemColor: const Color.fromRGBO(251, 142, 55, 1),
            selectedItemColor: Color.fromRGBO(150, 85, 33, 1),
          ),
        ));
  }
}
