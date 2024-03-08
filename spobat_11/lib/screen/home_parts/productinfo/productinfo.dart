import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

class productInfo extends StatefulWidget {
  @override
  State<productInfo> createState() => _productInfoState();
}

class _productInfoState extends State<productInfo> {
  late Stream<QuerySnapshot> _usersStream;
  bool isLoading = true;
  final _format=NumberFormat('##,##,##0');

  @override
  void initState() {
    _usersStream = FirebaseFirestore.instance
        .collection('products')
        .orderBy('postedAt', descending: true)
        .snapshots();
    Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _usersStream,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: const Text('Something went wrong'));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: const Text("Loading"));
                    }
                    final products = snapshot.data!.docs;
                    return ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: products.map((DocumentSnapshot document) {
                        var productData = document.data() as Map<String, dynamic>;
                        List<String> imageUrl = List<String>.from(productData['imageUrls']);
                        var _price = int.parse(productData['price']);
                        String price = _format.format(_price);
                        return Container(
                          child: Column(
                            children: [
                              Stack(
                                  children: [
                                    SizedBox(
                                      height: 350,
                                        child: Center(
                                            child: Image.network(imageUrl[0])
                                        )
                                    )
                                  ]
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text(productData['title']),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text('\₹ $price'),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Divider(),
                              SizedBox(height: 10,),
                              Text('Details'),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Text('Category')),
                                      Expanded(child: Text(':')),
                                      Expanded(child: Text(productData['category'])),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  if(productData['category']=='phone' || productData['category'] == 'caraccessory' || productData['category'] == 'car' || productData['category'] == 'laptop')
                                    Row(
                                      children: [
                                        Expanded(child: Text('Brand')),
                                        Expanded(child: Text(':')),
                                        Expanded(child: Text(productData['brand'])),
                                      ],
                                    ),
                                  SizedBox(height: 10,),
                                  if(productData['category'] == 'car')
                                    Row(
                                      children: [
                                        Expanded(child: Text('Model')),
                                        Expanded(child: Text(':')),
                                        Expanded(child: Text(productData['model'])),
                                      ],
                                    ),
                                  SizedBox(height: 10,),
                                  if(productData['category'] == 'car')
                                    Row(
                                      children: [
                                        Expanded(child: Text('Year')),
                                        Expanded(child: Text(':')),
                                        Expanded(child: Text(productData['year'])),
                                      ],
                                    ),SizedBox(height: 10,),
                                  if(productData['category'] == 'car')
                                    Row(
                                      children: [
                                        Expanded(child: Text('Km/h')),
                                        Expanded(child: Text(':')),
                                        Expanded(child: Text(productData['km'])),
                                      ],
                                    ),SizedBox(height: 10,),
                                  if(productData['category'] == 'car')
                                    Row(
                                      children: [
                                        Expanded(child: Text('Type')),
                                        Expanded(child: Text(':')),
                                        Expanded(child: Text(productData['type'])),
                                      ],
                                    ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text('Description'),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text(productData['description']),
                                ],
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}