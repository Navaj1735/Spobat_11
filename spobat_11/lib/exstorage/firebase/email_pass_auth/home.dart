import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/fire_function.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/login.dart';

class Home_fire extends StatelessWidget {
  const Home_fire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome User'),
        actions: [
          IconButton(
              onPressed: (){
                FireBaseHelper().logout().then((value) =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login_fire())));
                },
              icon: Icon(Icons.logout_rounded))
        ],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){},
                child: Text('Hello'))
          ],
        ),
      ),
    );
  }
}
