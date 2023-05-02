import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';

class DashboardScreen extends StatefulWidget {
  /// Constructs a [DashboardScreen]
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: Column(
          children: [
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
                      'Welcome,',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                  ),
                ],
              ),
          
            ),
            const SizedBox(height: 20),
            Container(
              width: screenWidth * 1,
              height: 225,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(253, 247, 204, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: screenWidth * 1,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(251, 142, 55, 1),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.zero, bottomRight: Radius.zero),
                    ),
                    child: const Text(
                      'Calendar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 115,
                  width: 160,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(253, 247, 204, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '3',
                        style: TextStyle(
                          fontSize: 64,
                        ),
                      ),
                      Text(
                        'Courses',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ),
                Container(
                  height: 115,
                  width: 160,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(253, 247, 204, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              width: screenWidth * 1,
              height: 60,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(251, 142, 55, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Join Course +',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ]
        ),
      )
    );
  }
}
