import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spobat_11/exstorage/firebase/chat/model/chat_model.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/fire_function.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/login.dart';
import 'package:spobat_11/exstorage/firebase/userprofle/profileinfo.dart';


class Register_fire extends StatefulWidget {

  @override
  State<Register_fire> createState() => _Register_fireState();
}

class _Register_fireState extends State<Register_fire> {
  var email_ctrl=TextEditingController();

  var pass_ctrl=TextEditingController();

  var conf_pass_ctrl=TextEditingController();

  Future<String?> registerUser({required String email,required String pass}) async{
    UserCredential? credential;
    try{
      credential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:email,
        password:pass,
      );
    }on FirebaseAuthException catch (ex) {
      print(ex.code.toString());
    }
    if(credential != null){
      String uid=credential.user!.uid;
      userModel newUser=userModel(
          uid: uid,
          email: email,
          fullname: '',
          profilepic: '',
          phonenumber: ''
      );
      await FirebaseFirestore.instance.collection('Users').doc(uid).set
        (newUser.toMap()).then((value) {
        print('Registered Successfully');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CompleteProfile(usermodel: newUser, firebaseUser: credential!.user!)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/STANBY_ORG_BACK.png'),
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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: conf_pass_ctrl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              hintText: 'Confirm Password'
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
                          String conf_pass=conf_pass_ctrl.text.trim();



                          if(email.isEmpty || pass.isEmpty || conf_pass.isEmpty){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('All fields are required')));
                            return;
                          }
                          if(pass!=conf_pass){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password mismatched')));
                            return;
                          }
                          if(pass.length<8){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password should be minimum 8 letters')));
                            return;
                          }
                          else{
                            registerUser(email: email, pass: pass);
                          }


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
