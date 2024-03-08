import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spobat_11/screen/home_parts/ads_user/Category_crud/donepage.dart';

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
      home: DogCrud()));
}

class DogCrud extends StatefulWidget {
  const DogCrud({super.key});

  @override
  State<DogCrud> createState() => _DogCrudState();
}

class _DogCrudState extends State<DogCrud> {
  var brand_ctrl = TextEditingController();
  var title_ctrl = TextEditingController();
  var price_ctrl = TextEditingController();
  var desc_ctrl = TextEditingController();
  var location_ctrl = TextEditingController();
  late CollectionReference _userCollection;
  FirebaseStorage storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  List<XFile> _selectedFiles = [];

  @override
  void initState() {
    _userCollection = FirebaseFirestore.instance.collection('products');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell Dog',style: GoogleFonts.rubik(color: Colors.blue),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xD4EEFAFF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
                shrinkWrap: true,
                children:[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Title'),
                      TextField(
                        controller: title_ctrl,
                        decoration: InputDecoration(
                            hintText: 'Title',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(),
                      ),
                      Text('Price'),
                      TextField(
                        controller: price_ctrl,
                        decoration: InputDecoration(
                            hintText: 'Price',
                            prefixText: 'INR ',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(),
                      ),
                      Text('Location'),
                      TextField(
                        controller: location_ctrl,
                        decoration: InputDecoration(
                            hintText: 'Location',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(),
                      ),
                      Text('Description on product'),
                      TextField(
                        controller: desc_ctrl,
                        decoration: InputDecoration(
                            hintText: 'Description',
                            helperText: 'Include condition, features and reason for selling',
                            helperStyle: TextStyle(fontSize: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: InkWell(
                          onTap: () {
                            addImage();
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset:
                                    Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                Text('Add Image'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: GridView.builder(
                              itemCount: _selectedFiles.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5),
                              itemBuilder: (BuildContext context,int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.file(
                                    File(_selectedFiles[index].path),
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      ElevatedButton(
                          onPressed: (){
                            uploadFunction(_selectedFiles, () => Navigator.push(
                                context, MaterialPageRoute(builder: (context) => completed_page())),
                            );
                          },
                          child: Text('Upload')),
                    ],
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addImage() async {
    if (_selectedFiles != null) {
      _selectedFiles.clear();
    }
    try {
      final List<XFile> images = await _picker.pickMultiImage();
      if (images!.isNotEmpty) {
        _selectedFiles.addAll(images);
      }
    } catch (e) {
      print('Something went wrong' + e.toString());
    }
    setState(() {

    });
  }

  Future<String> uploadFile(XFile _image) async {
    Reference reference = storage.ref().child('Dog').child(_image.name);
    UploadTask uploadTask = reference.putFile(File(_image.path));
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }
  void uploadFunction(List<XFile> _images, Function() onSuccess) async {
    List<String> imageUrls = [];
    String uid = FirebaseAuth.instance.currentUser!.uid;
    Random random = Random();
    int adId = random.nextInt(9000000) + 1000000;
    for (int i = 0; i < _images.length; i++) {
      String imageUrl = await uploadFile(_images[i]);
      imageUrls.add(imageUrl);
    }

    // Now that all images are uploaded, add the image URLs to Firestore
    try {
      await _userCollection.add({
        'UID':uid,
        'adID':adId,
        'category':'dog',
        'title': title_ctrl.text,
        'price': price_ctrl.text,
        'location': location_ctrl.text,
        'description': desc_ctrl.text,
        'postedAt': DateTime.now().microsecondsSinceEpoch,
        'imageUrls': imageUrls // Add image URLs to Firestore
      }).then((value) {
        print('Product uploaded successfully');
        title_ctrl.clear();
        price_ctrl.clear();
        location_ctrl.clear();
        desc_ctrl.clear();

        // Call the success callback function
        onSuccess();
      });
    } catch (error) {
      print("Failed to upload product: $error");
    }
  }
}
