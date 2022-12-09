import 'package:cloud_firestore/cloud_firestore.dart';

class PeopleModel {
  String? id;
  String? name;
  String? gender;
  String? address;
  String? email;
  String? photo;

  PeopleModel({
    this.id,
    this.name,
    this.gender,
    this.address,
    this.email,
    this.photo,
  });

  PeopleModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    name = doc['name'];
    gender = doc['gender'];
    address = doc['address'];
    email = doc['email'];
    photo = doc['photo'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'address': address,
      'email': email,
      'photo': photo,
    };
  }
}
