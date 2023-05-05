import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef SignUpCallback = int Function(String, String, String);
typedef LogInCallback = bool Function(String, String);

class LoginScreen extends StatefulWidget {
  /// Constructs a [LoginScreen]
  const LoginScreen({
    super.key,
    required this.signUp,
    required this.logIn,
  });

  final SignUpCallback signUp;
  final LogInCallback logIn;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameControllerLogin =
      TextEditingController();
  final TextEditingController _passwordControllerLogin =
      TextEditingController();
  final TextEditingController _userNameControllerSignup =
      TextEditingController();
  final TextEditingController _passwordControllerSignup =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  var test = 1; //FOR TESTING LAMANG

  @override
  Widget build(BuildContext context) {
    // if(widget.isLoggedIn){
    //   context.go('/');
    // }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                'App_',
                style: TextStyle(
                  fontFamily: 'FredokaOne',
                  fontSize: 100,
                  color: Color.fromRGBO(251, 142, 55, 1),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _userNameControllerLogin,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      filled: true,
                      fillColor: const Color.fromRGBO(253, 247, 204, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _passwordControllerLogin,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: const Color.fromRGBO(253, 247, 204, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 100,
                child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(251, 142, 55, 1),
                        width: 2,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        var result = widget.logIn(_userNameControllerLogin.text,
                            _passwordControllerLogin.text);
                        if(!result){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Log in'),
                              content: const Text('Invalid Credentials'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Close');
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          color: Color.fromRGBO(251, 142, 55, 1),
                          fontSize: 18,
                        ),
                      ),
                    )),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                      fontFamily: 'Lexend',
                      color: Color.fromRGBO(251, 142, 55, 1),
                      fontSize: 12,
                      decoration: TextDecoration.underline),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _userNameControllerSignup,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      filled: true,
                      fillColor: const Color.fromRGBO(253, 247, 204, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _passwordControllerSignup,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: const Color.fromRGBO(253, 247, 204, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      filled: true,
                      fillColor: const Color.fromRGBO(253, 247, 204, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 100,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: const BorderSide(
                      color: Color.fromRGBO(251, 142, 55, 1),
                      width: 2,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      var content;
                      var result = widget.signUp(
                          _userNameControllerSignup.text,
                          _passwordControllerSignup.text,
                          _confirmPasswordController.text);
                      if(result == -1){
                        content = const Text('Username already exists.');
                      }
                      else if(result == -2) {
                        content = const Text('Password did not match.');
                      }
                      else if(result == -3){
                        content = const Text('Fill the required fields.');
                      }

                      if(result < 0){
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Sign up'),
                            content: content,
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Close');
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontFamily: 'Lexend',
                        color: Color.fromRGBO(251, 142, 55, 1),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
