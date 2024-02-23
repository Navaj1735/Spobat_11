import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spobat_11/screen/home_parts/my%20ad%20screen/all/allscreen.dart';
import 'package:spobat_11/screen/home_parts/my%20ad%20screen/category/category.dart';
import 'package:spobat_11/screen/home_parts/my%20ad%20screen/favourite/favourite.dart';

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
  runApp(MaterialApp(
      home: myAds_page()));
}
class myAds_page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Ads'),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.blue,
              labelStyle: TextStyle(fontWeight: FontWeight.w500),
              labelColor: Colors.blue,
              indicatorWeight: 4,
              tabs: [
                Tab(
                  child: Text('All Ads'),
                ),
                Tab(
                  child: Text('Category'),
                ),
                Tab(
                  child: Text('Favourite'),
                )
              ]
          ),
        ),
        body: TabBarView(
          children: [
            AllAdsScreen(),
            category_myad(),
            Favourite_myad()
          ],
        ),
      ),
    );
  }
}
