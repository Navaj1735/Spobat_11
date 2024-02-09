import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/fire_function.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/login.dart';

class Profile_page extends StatelessWidget {
  const Profile_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
                bottomRight: Radius.circular(90)
              )
            ),
            child: Column(
              children: [
                SizedBox(height: 50,),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 60),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/image/profile image.jpg'),
                  ),
                  title: Text('User 68AS2Y',style: TextStyle(fontSize: 20),),
                  subtitle: Row(
                    children: [
                      Icon(Icons.edit_outlined,size: 12,),
                      Text('Edit Profile',style: TextStyle(fontSize: 12),)
                    ],
                  ),
                  trailing: Icon(Icons.notifications),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Card(
                      child: ListTile(
                        leading: Icon(Icons.person_outline_rounded),
                        title: Text('Account Overview'),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.help),
                        title: Text('Help'),
                      ),
                    ),
                  ),
                  SizedBox(height: 150,),
                  MaterialButton(
                    onPressed: (){
                      FireBaseHelper().logout().then((value) =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login_fire())));
                    },
                    elevation: 5,
                    height: 50,
                    minWidth: 100,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    color: Colors.lightBlueAccent,
                    child: Text('LOGOUT',style: GoogleFonts.rubik(),),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
