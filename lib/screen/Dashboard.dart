import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmsflutter/model/student_model.dart';

class DashboardScreen extends StatefulWidget {
  /// Constructs a [DashboardScreen]
  const DashboardScreen({super.key, required this.user, required this.logOut});

  final Student user;
  final VoidCallback logOut;
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
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'app_',
            style: TextStyle(
              color: Color.fromRGBO(251, 142, 55, 1),
              fontSize: 42,
              fontFamily: 'FredokaOne',
            ),
          ),
          actions: [
            //LOGOUT BUTTON
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
              child: ElevatedButton(
                onPressed: () {
                  widget.logOut();
                },
                child: Icon(
                  Icons.logout,
                  color: Colors.black,
                  size: 24,
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(24, 24),
                  backgroundColor: const Color.fromRGBO(251, 142, 55, 1),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(8),
                ),
              ),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              width: screenWidth * 1,
              height: 120,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(251, 142, 55, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'welcome,',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.user.getUserName,
                      style: const TextStyle(
                        fontSize: 50,
                        fontFamily: 'Lexend',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 40, 20, 20),
              width: screenWidth * 1,
              height: 225,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 114, 53, 236),
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
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  height: 115,
                  width: 155,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(253, 247, 204, 1),
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
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 27, 0, 15),
                  height: 115,
                  width: 155,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(253, 247, 204, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.rocket_launch, color: Colors.blue, size: 45),
                      Text(
                        'Beginner',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lexend',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                'Add Course +',
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
          ]),
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
            selectedItemColor: Color.fromRGBO(163, 90, 33, 1),
          ),
        ));
  }
}
