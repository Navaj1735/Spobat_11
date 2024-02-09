import 'package:flutter/material.dart';
import 'package:spobat_11/home_parts/ads_user/Category_crud/Car_access_Crud.dart';
import 'package:spobat_11/home_parts/ads_user/Category_crud/Car_crud.dart';
import 'package:spobat_11/home_parts/ads_user/Category_crud/Dog_Crud.dart';
import 'package:spobat_11/home_parts/ads_user/Category_crud/Laptop_crud.dart';
import 'package:spobat_11/home_parts/ads_user/Category_crud/Phone_crud.dart';
import 'package:spobat_11/home_parts/ads_user/Category_crud/bird_crud.dart';
import 'package:spobat_11/home_parts/ads_user/Category_crud/cat_crud.dart';
import 'package:spobat_11/home_parts/ads_user/Category_crud/furniture_crud.dart';
import 'package:spobat_11/home_parts/ads_user/Category_crud/property_crud.dart';

class Sell_page extends StatelessWidget {
  const Sell_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Category'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => PhoneCrud()));
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
                        context, MaterialPageRoute(builder: (context) => CarCrud()));
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
                        context, MaterialPageRoute(builder: (context) => CatCrud()));
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
                        context, MaterialPageRoute(builder: (context) => CaraccessoriesCrud()));
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
                        context, MaterialPageRoute(builder: (context) => LaptopCrud()));
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
                        context, MaterialPageRoute(builder: (context) => DogCrud()));
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
                        context, MaterialPageRoute(builder: (context) => BirdCrud()));
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
                        context, MaterialPageRoute(builder: (context) => FurnitureCrud()));
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
                        context, MaterialPageRoute(builder: (context) => PropertyCrud()));
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
