import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class productInfo extends StatefulWidget {
  static String id='product_info_screen';
  final String adId;
  const productInfo({Key? key, required this.adId}) : super(key: key);

  @override
  State<productInfo> createState() => _productInfoState();
}

class _productInfoState extends State<productInfo> {
  late Stream<QuerySnapshot> _usersStream;
  bool isLoading=true;
  @override
  void initState() {
    _usersStream = FirebaseFirestore.instance
        .collection('products')
        .where('adID', isEqualTo: widget.adId)
        .snapshots();
    Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading=false;
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
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  color: Colors.grey[500],
                  child: isLoading? Center(child: Column(
                    children: [
                      CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                      SizedBox(height: 10,),
                      Text('Loading Ad'),
                    ],
                  )) : ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: _usersStream,
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Center(child: const Text('Something went wrong'));
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: const Text("Loading"));
                          }
                          final products = snapshot.data!.docs;
                          if (products.isNotEmpty) {
                            final product = products[0];
                            var productData = product.data() as Map<String,dynamic>;
                            List<String> imageUrl = List<String>.from(productData['imageUrls']);
                            return Column(
                              children: [
                                Image.network(imageUrl as String),
                              ],
                            );
                          } else {
                            return Center(child: const Text("No products found"));
                          }
                        }
                      ),
                    ]
                  )
              )
            ],
          )
      ),
    );
  }
}