import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/login.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/register.dart';

class Intro_page extends StatelessWidget {
  const Intro_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/STANBY_ORG_BACK.png'),
          fit: BoxFit.fill)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/logo-removebg.png',width: 125,height: 125),
              Text('STANBY',style: GoogleFonts.oswald(fontSize: 25,color: Colors.blue,fontWeight: FontWeight.w500),),
              SizedBox(height: 50,),
              Text('Welcome!!',style: GoogleFonts.roboto(fontSize: 35,fontWeight: FontWeight.bold),),
              Image.asset('assets/image/intro image.png',height: 300,width: 300,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login_fire()));
                    },
                    child: Text('Login',style: GoogleFonts.roboto(),),
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(228, 245, 253, 1),fixedSize: Size(100, 50)),
                  ),
                  SizedBox(width: 30,),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Register_fire()));
                      },
                      child: Text('Register',style: GoogleFonts.roboto(),),
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(228, 245, 253, 1),fixedSize: Size(120, 50)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
