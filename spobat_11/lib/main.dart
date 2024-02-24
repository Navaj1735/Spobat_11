import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/Intro_Page.dart';
import 'package:spobat_11/screen/home_parts/Bottom_nav.dart';
import 'package:spobat_11/screen/home_parts/productinfo/product_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBhwA83qhdJwDH7_8UakB6bC_0Qb_1ypco",
          appId: "1:674664608234:android:d33060dc29fefa40708293",
          messagingSenderId: "",
          projectId: "spobat11",
          storageBucket: "spobat11.appspot.com"
      )
  );
  User? user=FirebaseAuth.instance.currentUser;
  runApp(ChangeNotifierProvider(
    create: (context) => ProductProvider(),
    child: MaterialApp(
        home: user==null? Splash_screen() : Botton_navigation()),
  ));
}
class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Intro_page()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(1, 255, 244, 244)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 25,),
              Image.asset('assets/image/logo-removebg.png',width: 140,height: 140,),
              AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('STANBY',
                        textStyle: GoogleFonts.oswald(color: Colors.blue,fontSize: 25,fontWeight: FontWeight.w500),
                      speed: Duration(milliseconds: 70),
                      cursor: ' '
                    )
                  ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
