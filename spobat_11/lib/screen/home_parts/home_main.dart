import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spobat_11/exstorage/firebase/email_pass_auth/fire_function.dart';
import 'package:spobat_11/screen/home_parts/productinfo/productinfo.dart';
import 'package:spobat_11/screen/home_parts/productinfo/product_provider.dart';
import 'package:spobat_11/screen/home_parts/viewmore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBhwA83qhdJwDH7_8UakB6bC_0Qb_1ypco",
          appId: "1:674664608234:android:d33060dc29fefa40708293",
          messagingSenderId: "",
          projectId: "spobat11",
          storageBucket: "spobat11.appspot.com"));
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(home: Home_main()));
}

class Home_main extends StatefulWidget {
  const Home_main({super.key});

  @override
  State<Home_main> createState() => _Home_mainState();
}

class _Home_mainState extends State<Home_main> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('products')
      .orderBy('postedAt', descending: true)
      .snapshots();
  FireBaseHelper _service = FireBaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "STANBY",
          style: GoogleFonts.oswald(
              fontWeight: FontWeight.w500, color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        actions: [
          Icon(Icons.search_outlined),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.notifications_sharp),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Categories',
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 20),
              ),
              trailing: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Category_page()));
                },
                child: Text('View more...'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(227, 238, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/smartphone.png',
                              height: 80,
                              width: 100,
                            ),
                            Expanded(
                              child: Text(
                                'Smartphone',
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(227, 238, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/car.png',
                              height: 80,
                              width: 100,
                            ),
                            Expanded(
                              child: Text(
                                'Cars',
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(227, 238, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/cat.png',
                              height: 80,
                              width: 100,
                            ),
                            Expanded(
                              child: Text(
                                'Cats',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(227, 238, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/steering-wheel.png',
                              height: 60,
                              width: 80,
                            ),
                            Expanded(
                              child: Text(
                                'CarAccessories',
                                style: TextStyle(fontSize: 9),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(227, 238, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/web-traffic.png',
                              height: 80,
                              width: 100,
                            ),
                            Expanded(
                              child: Text(
                                'Laptop',
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(227, 238, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/shiba.png',
                              height: 80,
                              width: 100,
                            ),
                            Expanded(
                              child: Text(
                                'Dogs',
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(227, 238, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/bird.png',
                              height: 80,
                              width: 100,
                            ),
                            Expanded(
                              child: Text(
                                'Birds',
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(227, 238, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/home-furniture.png',
                              height: 80,
                              width: 100,
                            ),
                            Expanded(
                              child: Text(
                                'Furniture',
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(227, 238, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      height: 150,
                      width: 150,
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/property-insurance.png',
                              height: 80,
                              width: 100,
                            ),
                            Expanded(
                              child: Text(
                                'Properties',
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Recent',
              style: GoogleFonts.rubik(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder<QuerySnapshot>(
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
                        return InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => productInfo()));
                          },
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: products.length,
                              itemBuilder: (BuildContext context, int index) {
                                var productData = products[index].data()
                                    as Map<String, dynamic>;
                                List<String> imageUrl =
                                    List<String>.from(productData['imageUrls']);
                                return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Image.network(imageUrl[0],
                                                  height: 100,
                                                  width: 100,
                                                  fit: BoxFit.cover),
                                              Container(width: 20),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(height: 5),
                                                    Text(
                                                      productData['title'],
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    Container(height: 5),
                                                    Text(
                                                      'INR ' +
                                                          productData['price'],
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 20,
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Container(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        productData['category']
                                                    ),
                                                    Container(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      productData["location"],
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[500],
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                  child: Icon(Icons.favorite_rounded)
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                              }),
                        );
                      })),
            )
          ],
        ),
      ),
    );
  }
}
