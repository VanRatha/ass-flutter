import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import '../model/people_model.dart';

class PeopleService {
  String tbPeople = 'tbPeople';
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> createPeople(PeopleModel people) async {
    try {
      firestore.collection(tbPeople).add(people.toMap());
    } catch (e) {
      debugPrint('Error create people => $e');
    }
  }

  Stream<List<PeopleModel>> getPeople() {
    return firestore
        .collection(tbPeople)
        .orderBy('name', descending: false)
        .snapshots()
        .map((event) {
      List<PeopleModel> list = [];
      for (var element in event.docs) {
        list.add(PeopleModel.fromDocumentSnapshot(element));
      }
      return list;
    });
  }

  Future<void> updatePeople(PeopleModel people) async {
    try {
      firestore.collection(tbPeople).doc(people.id).update(people.toMap());
    } catch (e) {
      debugPrint('Error update people => $e');
    }
  }

  Future<void> deletePeople(String id) async {
    try {
      firestore.collection(tbPeople).doc(id).delete();
    } catch (e) {
      debugPrint('Error delete people => $e');
    }
  }

  Future<String?> uploadAndDownloadPhoto(File? image) async {
    if (image == null) {
      return null;
    } else {
      await storage.ref('people/${image.path.split("/").last}').putFile(image);
      String downloadURL = await storage
          .ref('people/${image.path.split("/").last}')
          .getDownloadURL();
      debugPrint("URL : $downloadURL");
      return downloadURL;
    }
  }
}
