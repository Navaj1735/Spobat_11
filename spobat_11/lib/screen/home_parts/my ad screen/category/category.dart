import 'package:flutter/material.dart';
import 'package:spobat_11/screen/home_parts/my%20ad%20screen/my_ad/my_ad_bird.dart';
import 'package:spobat_11/screen/home_parts/my%20ad%20screen/my_ad/my_ad_car.dart';
import 'package:spobat_11/screen/home_parts/my%20ad%20screen/my_ad/my_ad_car_accessories.dart';
import 'package:spobat_11/screen/home_parts/my%20ad%20screen/my_ad/my_ad_cat.dart';
import 'package:spobat_11/screen/home_parts/my%20ad%20screen/my_ad/my_ad_dog.dart';
import 'package:spobat_11/screen/home_parts/my%20ad%20screen/my_ad/my_ad_furniture.dart';
import 'package:spobat_11/screen/home_parts/my%20ad%20screen/my_ad/my_ad_laptop.dart';
import 'package:spobat_11/screen/home_parts/my%20ad%20screen/my_ad/my_ad_property.dart';
import 'package:spobat_11/screen/home_parts/my%20ad%20screen/my_ad/my_ads_phone.dart';

class category_myad extends StatelessWidget {
  const category_myad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => My_ads_phone()));
                  },
                  leading: Image.asset('assets/icons/smartphone.png'),
                  title: Text('Smartphone'),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => My_ads_car()));
                  },
                  leading: Image.asset('assets/icons/car.png'),
                  title: Text('Car'),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => My_ads_cat()));
                  },
                  leading: Image.asset('assets/icons/cat.png'),
                  title: Text('Cat'),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => My_ads_car_accessories()));
                  },
                  leading: Image.asset('assets/icons/steering-wheel.png'),
                  title: Text('Car Accessories'),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => My_ads_laptop()));
                  },
                  leading: Image.asset('assets/icons/web-traffic.png'),
                  title: Text('Laptop'),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => My_ads_dog()));
                  },
                  leading: Image.asset('assets/icons/shiba.png'),
                  title: Text('Dog'),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => My_ads_bird()));
                  },
                  leading: Image.asset('assets/icons/bird.png'),
                  title: Text('Bird'),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => My_ads_furniture()));
                  },
                  leading: Image.asset('assets/icons/home-furniture.png'),
                  title: Text('Furniture'),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => My_ads_property()));
                  },
                  leading: Image.asset('assets/icons/property-insurance.png'),
                  title: Text('Property'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
