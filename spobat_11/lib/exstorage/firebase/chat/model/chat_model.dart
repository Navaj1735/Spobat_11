class userModel {
  String? uid;
  String? fullname;
  String? email;
  String? profilepic;
  String? phonenumber;

  userModel({this.uid,this.fullname,this.email,this.profilepic,this.phonenumber});

  userModel.fromMap(Map<String,dynamic> map) {
    uid=map['uid'];
    fullname=map['fullname'];
    email=map['email'];
    profilepic=map['profilepic'];
    phonenumber=map['phonenumber'];
  }

  Map<String,dynamic> toMap() {
    return {
      'uid':uid,
      'fullname':fullname,
      'email':email,
      'profilepic':profilepic,
      'phonenumber':phonenumber
    };
  }
}