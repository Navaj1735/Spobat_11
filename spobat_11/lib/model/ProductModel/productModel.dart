import 'package:cloud_firestore/cloud_firestore.dart';

class AdModel {
  final String? uid;
  final int adId;
  final String category;
  final String brand;
  final String title;
  final String price;
  final String location;
  final String description;
  final List<String> imageUrls;
  final DateTime postedAt;

  AdModel({
    this.uid,
    required this.adId,
    required this.category,
    required this.brand,
    required this.title,
    required this.price,
    required this.location,
    required this.description,
    required this.imageUrls,
    required this.postedAt,
  });

  factory AdModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return AdModel(
      uid: data['UID'],
      adId: data['adID'],
      category: data['category'],
      brand: data['brand'],
      title: data['title'],
      price: data['price'],
      location: data['location'],
      description: data['description'],
      imageUrls: List<String>.from(data['imageUrls']),
      postedAt: DateTime.fromMillisecondsSinceEpoch(data['postedAt']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'UID': uid,
      'adID': adId,
      'category': category,
      'brand': brand,
      'title': title,
      'price': price,
      'location': location,
      'description': description,
      'imageUrls': imageUrls,
      'postedAt': postedAt.millisecondsSinceEpoch,
    };
  }
}