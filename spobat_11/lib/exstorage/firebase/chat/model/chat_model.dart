class userModel {
  String? uid;
  String? fullname;
  String? email;
  String? profilepic;

  userModel({this.uid,this.fullname,this.email,this.profilepic});

  userModel.fromMap(Map<String,dynamic> map) {
    uid=map['uid'];
    fullname=map['fullname'];
    email=map['email'];
    profilepic=map['profilepic'];
  }
}