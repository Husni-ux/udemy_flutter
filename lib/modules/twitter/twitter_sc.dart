import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TwitSc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 50.0,
                height: 50.0,
                child: Image(
                    image: NetworkImage(
                        'https://logos-world.net/wp-content/uploads/2020/04/Twitter-Logo.png')),
              ),
            ),
            SizedBox(
              height: 200.0,
            ),
            Container(
              width: double.infinity,
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '.شاهد ما يحدث في العالم الأن',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200.0,),
            Row(
              children: [
                Expanded(

                  child: Container(
                    margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          MaterialButton(
                            onPressed: (){
                            },

                            child: const Text(' Google الاستمرار من خلال '),

                          ),
                          Image(image:  NetworkImage('https://th.bing.com/th/id/R.1e01fe36388e7453ab926c23b190827c?rik=09zG2rwxYM4QTQ&pid=ImgRaw&r=0'),
                            width: 20.0,
                            height: 20.0,),

                        ],
                      ),
                    ),

                  ),

                ),

              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: [
                Expanded(

                  child: Container(
                    margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          MaterialButton(
                            onPressed: (){
                            },

                            child: const Text(' Apple الاستمرار من خلال '),

                          ),
                          Image(image:  NetworkImage('https://www.freepngimg.com/thumb/apple/58765-logo-computer-apple-icons-png-free-photo.png'),
                            width: 30.0,
                            height: 30.0,),

                        ],
                      ),
                    ),

                  ),

                ),

              ],
            ),
            Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 50.0, right: 15.0),
                    child: Divider(
                      color: Colors.grey,
                      height: 50,
                    )),
              ),

              Text("أو"),

              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 50.0),
                    child: Divider(
                      color: Colors.grey,
                      height: 50,
                    )),
              ),
            ]),

            Row(
              children: [

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.black,
                      
                    ),
                    child: MaterialButton(
                      onPressed: (){
                      },
                      child: const Text('إنشاء حساب',
                      style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Container(
              margin: const EdgeInsets.only(left: 0.0, right:0.0),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text('بالتسجيل, فإنك توافق على الشروط, وسياسة الخصوصية, واستخدام الكوكيز الخاصة بنا.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13.0,

                ),
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Text('هل لديك حساب بالفعل ؟ تسجيل الدخول',
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.grey
              ),),
            )
          ],
        ),
      ),
    );
  }
}
