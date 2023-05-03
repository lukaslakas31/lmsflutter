class Student {
  final String username;
  final String password;
  final List course_list = [];

  Student(this.username, this.password);

  String get getUserName {
    return this.username;
  }

  List get getCourse {
    return this.course_list;
  }
}