import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  const RecommendCard({Key? key, required this.name, required this.source}) : super(key: key);

  final String name;
  final String source;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 250,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 140,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: NetworkImage(source),
                fit: BoxFit.cover,
              )
            ),
          ),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Lexend',
            ),
          ),
          // SizedBox(height: 6,),
          Text(
            'Austin Dalida & Luke Lejano',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Lexend',
              color: Color.fromRGBO(84, 84, 84, 1)
            ),
          ),
          SizedBox(height: 3,),
          Text(
            '⭐⭐⭐⭐⭐',
            style: TextStyle(
                fontSize: 12,
                fontFamily: 'Lexend',
                color: Color.fromRGBO(84, 84, 84, 1)
            ),
          )
        ],
      ),
    );
  }
}
