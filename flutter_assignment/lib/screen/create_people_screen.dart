import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../model/people_model.dart';
import '../services/people_service.dart';
import '../widget/show_message.dart';

class CreatePeopleScreen extends StatefulWidget {
  const CreatePeopleScreen({Key? key}) : super(key: key);

  @override
  State<CreatePeopleScreen> createState() => _CreatePeopleScreenState();
}

class _CreatePeopleScreenState extends State<CreatePeopleScreen> {
  final name = TextEditingController();
  final gender = TextEditingController();
  final address = TextEditingController();
  final email = TextEditingController();
  XFile? imageFile;

  final ImagePicker _picker = ImagePicker();
  Future<void> _onImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        imageQuality: 100,
      );
      setState(() {
        imageFile = pickedFile;
      });
    } catch (e) {
      debugPrint('Image Picker error => $e');
    }
  }

  _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _onImage(ImageSource.camera);
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  _onImage(ImageSource.gallery);
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create People'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  _showPicker(context);
                },
                child: Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3.0, color: Colors.grey),
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageFile != null
                          ? Image.file(File(imageFile!.path)).image
                          : const NetworkImage(
                              'D:\Users\ASUS\Pictures\2022-08-12',
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 26.0),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
              ),
              const SizedBox(height: 26.0),
              TextField(
                controller: gender,
                decoration: const InputDecoration(
                  hintText: 'Gender',
                ),
              ),
              const SizedBox(height: 26.0),
              TextField(
                controller: address,
                decoration: const InputDecoration(hintText: 'Address'),
              ),
              const SizedBox(height: 26.0),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 26.0),
              ElevatedButton.icon(
                onPressed: () async {
                  ShowMessage.showLoading(context);
                  await Future.delayed(const Duration(seconds: 2));
                  String? photoUrl = await PeopleService()
                      .uploadAndDownloadPhoto(File(imageFile!.path));
                  PeopleModel people = PeopleModel(
                    name: name.text,
                    gender: gender.text,
                    address: address.text,
                    email: email.text,
                    photo: photoUrl,
                  );
                  await PeopleService().createPeople(people);
                  Get.back();
                  Get.back();
                },
                icon: const Icon(Icons.add),
                label: const Text('SAVE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
