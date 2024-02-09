import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: phone_in(),));
}
class phone_in extends StatelessWidget {
  const phone_in({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.close),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/hellofoodlogo.png',
                height: 200,
                width: 200,
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
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_open),
                      suffixIcon: Icon(Icons.remove_red_eye_rounded),
                      fillColor: Colors.white70,
                      hintText: 'Password',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot your password?')
                  ],
                ),
              ),
              SizedBox(height: 10,),
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
                    child: Text('SIGN IN',style: TextStyle(color: Colors.white),),
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
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(onPressed: (){}, child: Text('Sign Up',style: TextStyle(color: Colors.pinkAccent),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
