import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class permissionHandling extends StatelessWidget {
  const permissionHandling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            askCameraPermission();
          }, child: Text('Camera')),
          ElevatedButton(onPressed: (){
            askMultiplePermission();
          }, child: Text('Multiple Permission')),
          ElevatedButton(onPressed: (){
            askSettingPermission();
          }, child: Text('Settings'))
        ],
      ),
    );
  }

  void askCameraPermission() async{
    var status = await Permission.camera.status;
    if(status.isGranted){
      var picker = ImagePicker();
      picker.pickImage(source: ImageSource.camera);
    }else if(status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Permission Denied')));
      if(await Permission.camera.request().isGranted) {
        print('Granted');
      }
    }
  }

  void askMultiplePermission() async{
    Map<Permission, PermissionStatus> status = await [
      Permission.location,
      Permission.contact,
      Permission.phone
    ].request();
  }

  void askSettingPermission() {
    openAppSettings();
  }
}
