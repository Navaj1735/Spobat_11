import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/fire_function.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/login.dart';


class Register_fire extends StatelessWidget {

  var email_ctrl=TextEditingController();
  var pass_ctrl=TextEditingController();
  var conf_pass_ctrl=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/STANBY_LOG_REG_BG.png'),
            fit: BoxFit.fill
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/logo-removebg.png',width: 100,height: 100,),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                        end: Alignment.centerRight,
                        colors: [Color.fromRGBO(226,240,255,1),Color.fromRGBO(254,235,255,1),Color.fromRGBO(232,243,252,1)]),
                    borderRadius: BorderRadius.circular(35)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Register Now',style: GoogleFonts.roboto(fontSize: 30,fontWeight: FontWeight.bold),),
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
                      Text('or',style: GoogleFonts.roboto(fontStyle: FontStyle.italic,fontSize: 16),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                        child: MaterialButton(
                          color: Colors.white,
                          height: 50,
                          minWidth: 30,
                          onPressed: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/image/google.png',width: 35,height: 35,),
                              SizedBox(width: 10,),
                              Text('Continue with Google',style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          String email = email_ctrl.text.trim();
                          String pass = pass_ctrl.text.trim();
                          FireBaseHelper()
                              .registerUser(email: email, pass: pass)
                              .then((result) {
                            if (result == null) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Login_fire()));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(result)));
                            }
                          });
                        },
                        child: Text('Register',style: TextStyle(color: Colors.black,fontSize: 20),),
                        style: ElevatedButton.styleFrom(fixedSize: Size(300, 50),backgroundColor: Color.fromRGBO(228, 245, 253, 1)),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already a user?'),
                          TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Login_fire()));
                              },
                              child: Text('Login here'))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
