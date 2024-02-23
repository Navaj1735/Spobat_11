import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spobat_11/exstorage/firebase/chat/model/chat_model.dart';
import 'package:spobat_11/screen/home_parts/Bottom_nav.dart';

class CompleteProfile extends StatefulWidget {
  final userModel usermodel;
  final User firebaseUser;

  const CompleteProfile({super.key, required this.usermodel, required this.firebaseUser});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {

  void checkValues(){
    String fullname=fullname_ctrl.text.trim();
    String phone=phone_ctrl.text.trim();

    if(fullname==null || phone==null){
      print('Please fill all the field');
    }
    if (imageFile==null) {
      print('Choose a profile picture');
    }
    else{
      uploadData();
    }
  }
  void uploadData() async{
    UploadTask uploadprofile = FirebaseStorage.instance.ref('ProfilePicture').
    child(widget.usermodel.uid.toString()).putFile(imageFile!);
    TaskSnapshot snapshot = await uploadprofile;

    String imageUrl=await snapshot.ref.getDownloadURL();
    String fullName=fullname_ctrl.text.trim();
    String phoneNo=phone_ctrl.text.trim();

    widget.usermodel.fullname=fullName;
    widget.usermodel.phonenumber=phoneNo;
    widget.usermodel.profilepic=imageUrl;

    await FirebaseFirestore.instance.collection('Users').doc(widget.usermodel.uid).set(widget.usermodel.toMap()).then((value) {
      log('Updated successfully');
      print('Updated Successfully');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Botton_navigation()));
    });
  }

  File? imageFile;
  var fullname_ctrl=TextEditingController();
  var phone_ctrl=TextEditingController();

  void selectImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  void addImageOption(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: (){
                Navigator.pop(context);
                selectImage(ImageSource.gallery);
              },
              leading: Icon(CupertinoIcons.photo_on_rectangle),
              title: Text('Gallery'),
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                selectImage(ImageSource.camera);
              },
              leading: Icon(CupertinoIcons.camera),
              title: Text('Camera'),
            ),
          ],
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Tell Me About Yourself'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: () {
              addImageOption();
            },
            child: Center(
              child: CircleAvatar(
                backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
                radius: 80,
                child: imageFile == null ? Icon(Icons.person) : null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: fullname_ctrl,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: phone_ctrl,
              decoration: InputDecoration(
                labelText: 'Phone number',
              ),
            ),
          ),
          CupertinoButton(
            color: Colors.blue,
              child: Text('Submit'),
              onPressed: () {
              checkValues();
              })
        ],
      ),
    );
  }
}
