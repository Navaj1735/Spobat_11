import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class productInfo extends StatefulWidget {

  @override
  State<productInfo> createState() => _productInfoState();
}

class _productInfoState extends State<productInfo> {
  late Stream<QuerySnapshot> _usersStream;
  bool isLoading = true;
  String adId = '';

  @override
  void initState() {
    _usersStream = FirebaseFirestore.instance
        .collection('products')
        .where('adID', isEqualTo: adId)
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
          Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: Colors.grey[500],
              child: isLoading
                  ? Center(
                      child: Column(
                      children: [
                        CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Loading Ad'),
                      ],
                    ))
                  : StreamBuilder<QuerySnapshot>(
                      stream: _usersStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                              child: const Text('Something went wrong'));
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: const Text("Loading"));
                        }
                        final products = snapshot.data!.docs;
                        final product = products[0];
                        var productData =
                            product.data() as Map<String, dynamic>;
                        adId = productData['adID'];
                        List<Widget> imageWidgets = productData['imageUrls']
                            .map((url) => Container(
                                  child: Image.network(url),
                                ))
                            .toList();
                        return ListView.builder(
                            itemCount: productData.length,
                            itemBuilder: (context, index) {
                              final entry =
                                  productData.entries.elementAt(index);
                              return Column(
                                children: [
                                  Image.network(productData['imageUrls'][0]),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(productData['title']),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.grey[500],
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(child: Text('Title')),
                                            Expanded(child: Text(':')),
                                            Expanded(child: productData['title'])
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(child: Text('brand')),
                                            Expanded(child: Text(':')),
                                            Expanded(child: productData['brand'])
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(child: Text('Location')),
                                            Expanded(child: Text(':')),
                                            Expanded(child: productData['location'])
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(child: Text('Description')),
                                            Expanded(child: Text(':')),
                                            Expanded(child: productData['description'])
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            });
                      }))
        ],
      )),
    );
  }
}
