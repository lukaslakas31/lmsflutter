import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmsflutter/screen/Course.dart';
import 'package:lmsflutter/screen/CourseList.dart';
import 'package:lmsflutter/screen/Dashboard.dart';
import 'package:lmsflutter/screen/Login.dart';
import 'package:lmsflutter/model/Student.dart';

void main() => runApp(const MyApp());

/// The main app.
class MyApp extends StatefulWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = true;
  Student? _user;
  List<Student> studentList = [];

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
                return CourseListScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'dashboard',
                  builder: (BuildContext context, GoRouterState state) {
                    return DashboardScreen(
                        isLoggedIn: _isLoggedIn, user: _user!);
                  },
                ),
                GoRoute(
                  path: 'login',
                  builder: (BuildContext context, GoRouterState state) {
                    return LoginScreen(
                      isLoggedIn: _isLoggedIn,
                      signUp: _signUp,
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
                    return CourseListScreen();
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
