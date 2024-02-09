import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spobat_11/home_parts/Profile/viewmore.dart';
import 'package:spobat_11/home_parts/chat.dart';

void main() {
  runApp(MaterialApp(
    home: Home_main(),
  ));
}

class Home_main extends StatefulWidget {
  const Home_main({super.key});

  @override
  State<Home_main> createState() => _Home_mainState();
}

class _Home_mainState extends State<Home_main> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('users').snapshots();
}
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
          SizedBox(width: 20,),
          Icon(Icons.notifications_sharp),
          SizedBox(width: 20,)
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
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Category_page()));
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
              child: ListView.builder(
                physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _usersStream,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Text("Loading");
                        }
                        return Card(
                        child: Column(),
                        );
                  )
                  ),
            )
          ],
        ),
      ),
    );
  }
}
