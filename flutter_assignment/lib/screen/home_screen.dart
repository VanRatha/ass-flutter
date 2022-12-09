import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/people_model.dart';
import '../services/authentication.dart';
import '../services/people_service.dart';
import 'create_people_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(const CreatePeopleScreen());
          },
          icon: const Icon(Icons.add),
        ),
        title: const Text('Home Screen'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () async {
                await AuthenticationService().logout();
              },
              icon: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: StreamBuilder<List<PeopleModel>>(
        stream: PeopleService().getPeople(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              var data = snapshot.data![index];
              return ListTile(
                onTap: () {
                  //Get.to(DetailPeoplePage(people: data));
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    data.photo ??
                        'https://3znvnpy5ek52a26m01me9p1t-wpengine.netdna-ssl.com/wp-content/uploads/2017/07/noimage_person.png',
                  ),
                ),
                title: Text(data.name!),
                subtitle: Text(data.email!),
                trailing: Text(data.gender!),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: snapshot.data!.length,
          );
        },
      ),
    );
  }
}
