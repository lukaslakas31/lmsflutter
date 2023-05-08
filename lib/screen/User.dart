import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {

    var _selectedIndex = 2;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Text(
            'app_',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(251, 142, 55, 1),
              fontSize: 32,
              fontFamily: 'FredokaOne',
            ),
          ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: screenWidth * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            CircleAvatar(
              radius: 100,
              backgroundColor: Color.fromRGBO(251, 142, 55, 1),
              child: CircleAvatar(
                radius: 95,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1547721064-da6cfb341d50'),
              ),
            ),
            SizedBox(height: 30,),
            Text(
              'Username',
              style: const TextStyle(
                fontSize: 36,
                fontFamily: 'Lexend',
              ),
            ),
            SizedBox(height: 60,),
            SizedBox(
              width: 100,
              child: OutlinedButton(
                onPressed: (){print('logout mo na');},
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
                child: const Text(
                  'Sign out',
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    color: Color.fromRGBO(251, 142, 55, 1),
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
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