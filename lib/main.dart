import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmsflutter/screen/Course.dart';
import 'package:lmsflutter/screen/CourseList.dart';
import 'package:lmsflutter/screen/Dashboard.dart';
import 'package:lmsflutter/screen/Login.dart';
import 'package:lmsflutter/model/Student.dart';
import 'package:lmsflutter/model/course_model.dart';

void main() => runApp(const MyApp());

/// The main app.
class MyApp extends StatefulWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  Student? _user;
  List<Student> studentList = [];
  List<Course> _courses = [
    Course('SSNI777', 'Hekasi', 'Heograpiya, Kasaysayan at Sibika.', 'https://cf.shopee.ph/file/4959bda3eb63003cb0dc84642c0799e4'),
    Course('SSNI778', 'Katekesis', 'Mga aral ng diyos.', 'https://cf.shopee.ph/file/5f2d90a41d8f6e4e16ef2e7c576bce8e'),
    Course('SSNI779', 'E.S.P.', 'Edukasyon sa pagpapakatao', 'https://th.bing.com/th/id/OIP.3m_Vl4PYAdU9MD2_C51kIgHaKJ?pid=ImgDet&w=584&h=800&rs=1'),
  ];

  void _logOut(){
    setState(() {
      _user = null;
      _isLoggedIn = false;
    });
  }

  void _logIn(username, password) {
    bool isMatched = false;
    Student? matchedUser;
    if(studentList.length != 0) {
      for (int i = 0; i < studentList.length; i++) {
        if (username == studentList[i].getUserName && password == studentList[i].getPassword) {
          matchedUser = studentList[i];
          isMatched = true;
          break;
        }
      }
      if(isMatched){
        setState(() {
          _user = matchedUser;
          _isLoggedIn = true;
        });
      }
    }
  }

  void _signUp(username, password, cpassword) {
    bool isMatched = false;
    print(username);
    if (studentList.length == 0) {
      if (password == cpassword) {
        studentList.add(Student(username, password));
        print('user created');
        print(studentList);
        setState(() {
          _user = studentList[studentList.length - 1];
          _isLoggedIn = true;
        });
      }
    } else {
      for (int i = 0; i < studentList.length; i++) {
        if (username == studentList[i].getUserName) {
          isMatched = true;
          print('user existed');
          break;
        }
      }
      if (!isMatched) {
        studentList.add(Student(username, password));
        print('user created');
        print(studentList);
        setState(() {
          _user = studentList[studentList.length - 1];
          _isLoggedIn = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (BuildContext context, GoRouterState state) {
                return DashboardScreen(
                    isLoggedIn: _isLoggedIn,
                    user: _user ?? Student('', ''),
                    logOut: _logOut,
                );
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'dashboard',
                  builder: (BuildContext context, GoRouterState state) {
                    return DashboardScreen(
                      isLoggedIn: _isLoggedIn,
                      user: _user!,
                      logOut: _logOut,
                    );
                  },
                ),
                GoRoute(
                  path: 'login',
                  builder: (BuildContext context, GoRouterState state) {
                    return LoginScreen(
                      isLoggedIn: _isLoggedIn,
                      signUp: _signUp,
                      logIn: _logIn,
                    );
                  },
                ),
                GoRoute(
                  path: 'course',
                  builder: (BuildContext context, GoRouterState state) {
                    return const CourseScreen();
                  },
                ),
                GoRoute(
                  path: 'course_list',
                  builder: (BuildContext context, GoRouterState state) {
                    return CourseListScreen(courses: _courses);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
