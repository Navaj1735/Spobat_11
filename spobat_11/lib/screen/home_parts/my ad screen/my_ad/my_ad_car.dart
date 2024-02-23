import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBhwA83qhdJwDH7_8UakB6bC_0Qb_1ypco",
          appId: "1:674664608234:android:d33060dc29fefa40708293",
          messagingSenderId: "",
          projectId: "spobat11",
          storageBucket: "spobat11.appspot.com")
  );
  User? user=FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
      home: My_ads_car()));
}
class My_ads_car extends StatefulWidget {

  @override
  State<My_ads_car> createState() => _My_adsState();
}

class _My_adsState extends State<My_ads_car> {
  late CollectionReference _userCollection;
  @override
  void initState() {
    _userCollection= FirebaseFirestore.instance.collection('Smartphone');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Ads',style: GoogleFonts.rubik(color: Colors.blue),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(stream: getUser(), builder: (context,snapshot){
            if(snapshot.hasError){
              return Text('Error ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            final products=snapshot.data!.docs;
            return Expanded(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context,index) {
                      final product = products[index];
                      final productID= product.id;
                      final title=product['title'];
                      final price= product['price'];
                      return ListTile(
                        title: Text('$title'),
                        subtitle: Text('$price'),
                        trailing: Wrap(
                          children: [
                            IconButton(onPressed: (){
                              deleteProduct(productID);
                            }, icon: Icon(Icons.delete))
                          ],
                        ),
                      );
                    }));
          })
        ],
      ),
    );
  }
  Stream<QuerySnapshot> getUser() {
    return _userCollection.snapshots();
  }

  Future<void> deleteProduct(var id) {
    return _userCollection.doc(id).delete().then((value) {
      print("Ad Deleted Successfully");
    }).catchError((error) {
      print("Ad deletion failed $error");
    });
  }
}