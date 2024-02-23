import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AllAdsScreen extends StatefulWidget {
  const AllAdsScreen({super.key});

  @override
  State<AllAdsScreen> createState() => _AllAdsScreenState();
}

class _AllAdsScreenState extends State<AllAdsScreen> {
  late Stream<QuerySnapshot> _usersStream;
  @override
  void initState() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    _usersStream = FirebaseFirestore.instance
        .collection('products')
        .where('UID', isEqualTo: uid)
        .orderBy('postedAt', descending: true)
        .snapshots();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: _usersStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                if (snapshot.hasError) {
                  return Center(child: const Text('Something went wrong'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: const Text("Loading"));
                }
                final products = snapshot.data!.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context,int index){
                    var productData = products[index].data() as Map<String,dynamic>;
                    List<String> imageUrl = List<String>.from(productData['imageUrls']);
                    return Card(
                      // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // Set the clip behavior of the card
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      // Define the child widgets of the card
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                          Image.network(
                            imageUrl[0],
                            height: 160,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          // Add a container with padding that contains the card's title, text, and buttons
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Display the card's title using a font size of 24 and a dark grey color
                                Text(
                                  productData['title'],
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Container(height: 10),
                                Text(
                                  productData['price'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                                Container(height: 10),
                                Text(
                                  productData['location'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const Spacer(),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.transparent,
                                      ),
                                      child: const Text(
                                        "REMOVE",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      onPressed: () {},
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.transparent,
                                      ),
                                      child: const Text(
                                        "EDIT",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(height: 5),
                        ],
                      ),
                    );
                  }
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
