import 'package:flutter/cupertino.dart';

class ScannScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image:NetworkImage('https://th.bing.com/th/id/R.d507109f1747897d7e93df9d16ce5b89?rik=RldyJLuMtbR8pQ&pid=ImgRaw&r=0'),
            fit: BoxFit.cover,
            height: 200.0,
            width:200.0 ,
          ),

        ],

      ),
    );
  }
}
