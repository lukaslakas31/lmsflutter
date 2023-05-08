import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('https://static6.businessinsider.com/image/56a8f50ddd089553198b4731-1200/ditch-the-smirk-when-it-comes-to-profile-pictures-only-2-of-the-top-ranked-profiles-on-okcupid-featured-people-hiding-their-smiles-instead-try-smiling-with-your-teeth.jpg'),
                ),
                SizedBox(width: 5,),
                Text(
                  'Someone Special',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            SizedBox(height: 5,),
            Text('⭐⭐⭐⭐⭐'),
            SizedBox(height: 5,),
            Text('''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''',)
          ],
        )
      ),
    );
  }
}
