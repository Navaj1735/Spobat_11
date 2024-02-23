import 'package:firebase_core/firebase_core.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:spobat_11/screen/home_parts/Likelist.dart';
import 'package:spobat_11/screen/home_parts/Profile/profile_page.dart';
import 'package:spobat_11/screen/home_parts/ads_user/sell_category.dart';
import 'package:spobat_11/screen/home_parts/chat.dart';
import 'package:spobat_11/screen/home_parts/home_main.dart';
import 'package:spobat_11/screen/home_parts/my%20ad%20screen/all/my_ad_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBhwA83qhdJwDH7_8UakB6bC_0Qb_1ypco",
          appId: "1:674664608234:android:d33060dc29fefa40708293",
          messagingSenderId: "",
          projectId: "spobat11",
          storageBucket: "spobat11.appspot.com"));
  runApp(MaterialApp(home: Botton_navigation()));
}
class Botton_navigation extends StatefulWidget {
  const Botton_navigation({super.key});

  @override
  State<Botton_navigation> createState() => _Botton_navigationState();
}

class _Botton_navigationState extends State<Botton_navigation> {
  int index = 0;
  var screen=[
    Home_main(),
    Chat_page(),
    likelist(),
    Profile_page(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        barColor: Colors.white,
        controller: FloatingBottomBarController(initialIndex: 0),
        bottomBar: [
          BottomBarItem(
            icon: Icon(Icons.home),
            iconSelected: Icon(Icons.home,color: Colors.blue,),
            title: 'Home',
            dotColor: Colors.blue,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
          ),
          BottomBarItem(
            icon:Icon(Icons.chat_bubble_outlined),
            iconSelected: Icon(Icons.chat_bubble_outlined,color: Colors.blue,),
            title: 'Chat',
            dotColor: Colors.blue,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
          ),
          BottomBarItem(
            icon:Icon(Icons.shopify_sharp),
            iconSelected: Icon(Icons.shopify_sharp,color: Colors.blue,),
            title: 'Buylist',
            dotColor: Colors.blue,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
          ),
          BottomBarItem(
            icon:Icon(Icons.person),
            iconSelected: Icon(Icons.person,color: Colors.blue,),
            title: 'Profile',
            dotColor: Colors.blue,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
          ),
        ],
        bottomBarCenterModel: BottomBarCenterModel(
          centerBackgroundColor: Colors.blue,
          centerIcon: const FloatingCenterButton(
            child: Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
          centerIconChild: [
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.add_circle_outline,
                color: AppColors.white,
              ),
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Sell_page()));
              },
            ),
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.shopping_bag_rounded,
                color: AppColors.white,
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => myAds_page()));
              },
            ),
          ],
        ),
      ),
      body: screen[index],
    );
  }
}
