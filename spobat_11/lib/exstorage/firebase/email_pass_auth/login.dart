import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/fire_function.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/home.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/register.dart';
import 'package:spobat_11/home_parts/Bottom_nav.dart';


class Login_fire extends StatelessWidget {
  var email_ctrl=TextEditingController();
  var pass_ctrl=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image:AssetImage('assets/image/STANBY_ORG_BACK.png'),
            fit: BoxFit.fill
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/logo-removebg.png',width: 100,height: 100,),
              SizedBox(height: 20,),
              Text('Login',style: GoogleFonts.roboto(fontSize: 30,fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: CircleAvatar(backgroundColor: Color.fromRGBO(228, 245, 253, 1),backgroundImage: AssetImage('assets/image/google.png'),)),
                  SizedBox(width: 35,),
                  IconButton(
                      onPressed: (){},
                      icon: CircleAvatar(backgroundColor: Color.fromRGBO(228, 245, 253, 1),child: Image.asset('assets/image/facebook_r.png'),)),
                ],
              ),
              Text('or',style: GoogleFonts.roboto(fontStyle: FontStyle.italic,fontSize: 16),),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: email_ctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    hintText: 'Email'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: pass_ctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    hintText: 'Password'
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: (){},
                      child: Text('Forgot your password?')),
                ],
              ),
              ElevatedButton(
                  onPressed: (){
                    String email=email_ctrl.text.trim();
                    String pass=pass_ctrl.text.trim();
                    FireBaseHelper().loginUser(email: email, pass: pass).then((result) {
                      if(result==null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Botton_navigation()));
                      }else{
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
                      }
                    });
                  },
                  child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.black),),
                style: ElevatedButton.styleFrom(fixedSize: Size(300, 50),backgroundColor: Color.fromRGBO(228, 245, 253, 1)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a user?'),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Register_fire()));
                  },
                      child: Text('Register now'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
