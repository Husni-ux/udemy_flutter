import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreenFacebook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[900],
        child: Column(
          children: [
            const Image(
              image: NetworkImage(
                  'https://scontent.famm2-3.fna.fbcdn.net/v/t1.15752-9/292758314_561791695676012_7802758658262926534_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=ae9488&_nc_eui2=AeFy2onKzVKd-9fGl4KIDehMmT_8IaIjImmZP_whoiMiaWIsXxsA79p5V-cSuZeD8FTeQHXUCREnU4GgQIhuj4Nq&_nc_ohc=rkrVJ4ilmygAX9qUwZ1&_nc_ht=scontent.famm2-3.fna&oh=03_AVLWatq5xY1q1z4wFyWHlL3f7Jh8MvM5Rtwp_kwjl2qppg&oe=62F73E8D'),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // SizedBox(
            //   height: 10.0,
            // ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'English . ',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    'العربية . ',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    'More... ',
                    style: TextStyle(
                      color: Colors.blue[500],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Phone number or email address',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 18.0,
                      ),
                    ),
                    maxLines: 1,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 18.0,
                      ),

                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  ElevatedButton(
                    style:  ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 170.0
                         ),
                    ),
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Text('Login'),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              const  Text(
                    'Forgotten',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.w900
                ),),
               const Text(
                    'Password?',
                style: TextStyle(
                    fontSize: 15.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.w900
                ),),
              ],
              ),
            ),
            Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 15.0),
                    child: Divider(
                      color: Colors.grey,
                      height: 50,
                    )),
              ),

              Text("OR",
              style: TextStyle(color: Colors.grey),),

              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 20.0),
                    child: Divider(
                      color: Colors.grey,
                      height: 50,
                    )),
              ),
            ]),
            Expanded(
              child: Row(

                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                ElevatedButton(
                  style:  ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text('Create New Facebook Account'),
                ),

              ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
