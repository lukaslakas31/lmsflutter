import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmsflutter/screen/MyCourse.dart';
import 'package:lmsflutter/screen/CourseDetail.dart';
import 'package:lmsflutter/screen/CourseList.dart';
import 'package:lmsflutter/screen/Dashboard.dart';
import 'package:lmsflutter/screen/Login.dart';
import 'package:lmsflutter/screen/User.dart';
import 'package:lmsflutter/model/student_model.dart';
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
    Course(
      'CC321',
      'Data Structures & Algorithms',
      'Study the fundamentals of Programming',
      'https://images.unsplash.com/photo-1542831371-29b0f74f9713?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
      'https://www.youtube.com/watch?v=lf641ItPkM4'
    ),
    Course(
      'CC123',
      'Psychology',
      'Explore the human psyche',
      'https://th.bing.com/th/id/OIP.VRo8OKH0lOWdrFSmYTTGaQHaE8?pid=ImgDet&rs=1',
      'https://www.youtube.com/watch?v=yRAmvLV_EmY'
    ),
    Course(
        'CC41',
        'History',
        'Explore the past',
        'https://i.pinimg.com/originals/bb/82/2d/bb822dc439cbe22cb4337fc84a4fee7b.jpg',
        'https://www.youtube.com/watch?v=xuCn8ux2gbs'
    ),
    Course(
        'CC541',
        'Music',
        'It is not rocket science',
        'https://th.bing.com/th/id/R.81cbf1bb8e96b7df8d53595e419899d1?rik=6dqoFLumlL8LUw&riu=http%3a%2f%2fwallpapercave.com%2fwp%2fpVTEkzk.jpg&ehk=r1uv7fY6YEyjCeT3B8tuqLmhkCP3Csox1Oar0qtlIZo%3d&risl=&pid=ImgRaw&r=0',
        'https://www.youtube.com/watch?v=OKaBQlZAqUA'
    ),
    Course(
        'CC641',
        'Biology',
        'Study life\'s greatest gifts',
        'https://northelectives.weebly.com/uploads/1/3/5/7/135704380/published/hero-biology.jpg?1611862181',
        'https://www.youtube.com/watch?v=ax0yjzbSBa4'
    ),
  ];

  void _logOut() {
    setState(() {
      _user = null;
      _isLoggedIn = false;
    });
  }

  bool _logIn(username, password) {
    bool isMatched = false;
    Student? matchedUser;
    if (studentList.length != 0) {
      for (int i = 0; i < studentList.length; i++) {
        if (username == studentList[i].getUserName &&
            password == studentList[i].getPassword) {
          matchedUser = studentList[i];
          isMatched = true;
          break;
        }
      }
      if (isMatched) {
        print('matched');
        setState(() {
          _user = matchedUser;
          _isLoggedIn = true;
        });
        return true;
      }else{
        return false;
      }
    }
    return false;
  }

  int _signUp(username, password, cpassword) {
    bool isMatched = false;
    if(username == '' || password == '' || cpassword == '') {
      return -3;
    }

    if (studentList.length == 0) {
      if (password == cpassword) {
        studentList.add(Student(username, password));
        print('user created');
        print(studentList);
        setState(() {
          _user = studentList[studentList.length - 1];
          _isLoggedIn = true;
        });
        return 1;
      }
      else {
        return -2;
      }
    } else {
      for (int i = 0; i < studentList.length; i++) {
        if (username == studentList[i].getUserName) {
          isMatched = true;
          print('user existed');
          return -1;
        }
      }
      if (!isMatched) {
        if(password == cpassword){
          studentList.add(Student(username, password));
          print('user created');
          print(studentList);
          setState(() {
            _user = studentList[studentList.length - 1];
            _isLoggedIn = true;
          });
          return 1;
        }
        else {
          return -2;
        }
      }
    }
    return -1;
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
                if (_isLoggedIn) {
                  return DashboardScreen(
                    user: _user!,
                    logOut: _logOut,
                    courses: _courses,
                  );
                } else {
                  context.go('/login');
                  return LoginScreen(
                    signUp: _signUp,
                    logIn: _logIn,
                  );
                }
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'dashboard',
                  builder: (BuildContext context, GoRouterState state) {
                    if (_isLoggedIn) {
                      return DashboardScreen(
                        user: _user!,
                        logOut: _logOut,
                        courses: _courses,
                      );
                    } else {
                      context.go('/login');
                      return LoginScreen(
                        signUp: _signUp,
                        logIn: _logIn,
                      );
                    }
                  },
                ),
                GoRoute(
                  path: 'login',
                  builder: (BuildContext context, GoRouterState state) {
                    if (_isLoggedIn) {
                      context.go('/dashboard');
                      return DashboardScreen(
                        user: _user!,
                        logOut: _logOut,
                        courses: _courses,
                      );
                    } else {
                      return LoginScreen(
                        signUp: _signUp,
                        logIn: _logIn,
                      );
                    }
                  },
                ),
                GoRoute(
                  path: 'course',
                  builder: (BuildContext context, GoRouterState state) {
                    return MyCourseScreen(courses: _courses, user: _user!,);
                  },
                ),
                GoRoute(
                  path: 'course_list',
                  builder: (BuildContext context, GoRouterState state) {
                    return CourseListScreen(courses: _courses, user: _user!,);
                  },
                ),
                GoRoute(
                  path: 'course_detail/:code',
                  builder: (BuildContext context, GoRouterState state) {
                    return CourseDetail(courses: _courses, code: state.pathParameters['code']!,);
                  },
                ),
                GoRoute(
                  path: 'user',
                  builder: (BuildContext context, GoRouterState state) {
                    return UserScreen();
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
