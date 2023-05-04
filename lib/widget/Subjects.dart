import 'package:flutter/material.dart';

class Subjects extends StatelessWidget {
  final String code;
  final String name;
  final String description;
  final String imageUrl;
  final Key key;

  const Subjects({
    required this.code,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 200,
        ),
        const SizedBox(height: 16),
        Text(
          'English\n$code',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Lexend',
          ),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'Lexend',
          ),
        ),
      ],
    );
  }
}
