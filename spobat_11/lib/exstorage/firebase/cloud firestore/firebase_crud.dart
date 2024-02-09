import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      home: FirebaseCrud()));
}

class FirebaseCrud extends StatefulWidget {
  const FirebaseCrud({super.key});

  @override
  State<FirebaseCrud> createState() => _FirebaseCrudState();
}

class _FirebaseCrudState extends State<FirebaseCrud> {
  var name_ctrl=TextEditingController();
  var email_ctrl=TextEditingController();
  late CollectionReference _userCollection;
  @override
  void initState() {
    _userCollection= FirebaseFirestore.instance.collection('Users');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase cloud storage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: name_ctrl,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder()
              ),
            ),
            TextField(
              controller: email_ctrl,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
                onPressed: (){
                  addUser();
                },
                child: Text('Add User')),
            StreamBuilder<QuerySnapshot>(stream: getUser(), builder: (context,snapshot){
              if(snapshot.hasError){
                return Text('Error ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              final users=snapshot.data!.docs;
              return Expanded(
                  child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context,index) {
                        final user = users[index];
                        final userID= user.id;
                        final username=user['name'];
                        final userEmail= user['email'];
                    return ListTile(
                      title: Text('$username'),
                      subtitle: Text('$userEmail'),
                      trailing: Wrap(
                        children: [
                          IconButton(onPressed: (){
                            editUser(userID);
                          }, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                        ],
                      ),
                    );
                  }));
            })
          ],
        ),
      ),
    );
  }

  Future <void> addUser() async{
    return _userCollection.add({
      'name': name_ctrl.text,
      'email': email_ctrl.text
    }).then((value) {
      print('User data added successfully');
      name_ctrl.clear();
      email_ctrl.clear();
    }).catchError((error) {
      print("Failed to add User $error");
    });
  }

  Stream<QuerySnapshot> getUser() {
    return _userCollection.snapshots();
  }
  void editUser(var id) {
    showDialog(context: context, builder: (context) {
      final newname_ctrl=TextEditingController();
      final newemail_ctrl=TextEditingController();
      
      return AlertDialog(
        title: Text('Update User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newname_ctrl,
              decoration: InputDecoration(
                hintText: 'Enter name',
                border: OutlineInputBorder()
              ),
            ),
            TextField(
              controller: newemail_ctrl,
              decoration: InputDecoration(
                hintText: 'Enter email',
                border: OutlineInputBorder()
              ),
            )
          ],
        ),
        actions: [
          TextButton(
              onPressed: (){
                updateUser(id,newname_ctrl.text,newemail_ctrl.text).then((value) {
                  return Navigator.pop(context);
                });
              },
              child: Text('Update'))
        ],
      );
    });
  }

  Future<void> updateUser(var id, String newname, String newemail) {
    return _userCollection
        .doc(id)
        .update({'name': newname,'email': newemail}).then((value) {
          print('User updated successfully');
    }).catchError((error) {
      print('user data updation failed $error');
    });
  }
}
