class Student {
  final String username;
  final String password;
  final List<String> courseCodes = [];

  Student(this.username, this.password);

  void addCourse(String code) {
    this.courseCodes.add(code);
  }

  int hasCode(String code){
    return this.courseCodes.indexOf(code);
  }

  String get getUserName {
    return this.username;
  }

  String get getPassword {
    return this.password;
  }

  List get getCourseCodes {
    return this.courseCodes;
  }
}
