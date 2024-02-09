import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: phone_auth(),
  ));
}

class phone_auth extends StatelessWidget {
  const phone_auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.close),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/hellofoodlogo.png',
              height: 200,
              width: 200,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          hintText: 'First Name',
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          hintText: 'Last Name',
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    fillColor: Colors.white70,
                    hintText: 'Phone Number',
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: TextField(
                decoration: InputDecoration(
                    focusColor: Colors.white70,
                    prefixIcon:
                        Icon(CupertinoIcons.chevron_left_slash_chevron_right),
                    fillColor: Colors.white70,
                    hintText: 'Invitation Code',
                    helperText:
                        "ⓘLeave empty if you don't have Invitation Code",
                    border: OutlineInputBorder()),
              ),
            ),
            Container(
              height: 50,
              width: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Colors.pinkAccent,
                  Colors.orangeAccent,
                ]),
              ),
              child: Center(
                child: Text('Sign Up'),
              )
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.7,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 10,
                  ),
                  child: Text(
                    'Or',
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.7,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/image/facebookpink.png'),
                ),
                SizedBox(width: 20,),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/image/googlepink.png'),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                TextButton(onPressed: (){}, child: Text('Sign In',style: TextStyle(color: Colors.pinkAccent),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
