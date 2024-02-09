import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

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
      home: CatCrud()));
}

class CatCrud extends StatefulWidget {
  const CatCrud({super.key});

  @override
  State<CatCrud> createState() => _CatCrudState();
}

class _CatCrudState extends State<CatCrud> {
  var title_ctrl=TextEditingController();
  var price_ctrl=TextEditingController();
  var desc_ctrl=TextEditingController();
  var location_ctrl=TextEditingController();
  late CollectionReference _userCollection;
  FirebaseStorage storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  List<XFile> _selectedFiles = [];
  List<String> _arrImageUrls=[];
  @override
  void initState() {
    _userCollection= FirebaseFirestore.instance.collection('Cat');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell Cat',style: GoogleFonts.rubik(color: Colors.blue),),
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
                            uploadproduct();
                            uploadFunction(_selectedFiles);
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

  Future <void> uploadproduct() async{
    return _userCollection.add({
      'title': title_ctrl.text,
      'price':price_ctrl.text,
      'location':price_ctrl.text,
      'description':desc_ctrl.text
    }).then((value) {
      print('Product uploaded successfully');
      title_ctrl.clear();
      price_ctrl.clear();
      location_ctrl.clear();
      desc_ctrl.clear();
    }).catchError((error) {
      print("Failed to upload $error");
    });
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
  Future<String> uploadFile(XFile _image) async{
    Reference reference=storage.ref().child('Cat').child(_image.name);
    UploadTask uploadTask=reference.putFile(File(_image.path));
    await uploadTask.whenComplete(() => {
    });
    return await reference.getDownloadURL();
  }
  void uploadFunction(List<XFile> _images){
    for(int i=0;i<_images.length;i++){
      var imageUrl = uploadFile(_images[i]);
      _arrImageUrls.add(imageUrl.toString());
    }
  }
}
