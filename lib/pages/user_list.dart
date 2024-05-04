import 'package:api_with_getx/controller/user_data_controller.dart';
import 'package:api_with_getx/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserList extends StatelessWidget {
  UserList({super.key});

  final userController = Get.put(UserDataController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List From Api"),
      ),
      body: FutureBuilder(
        future: userController.fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
             return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final userdata = snapshot.data![index];
                  return ListTile(
                    leading: CircleAvatar(
                    backgroundImage: NetworkImage("${userdata.thumbnail}"),
                    ),
                    title: Text("${userdata.title} ${userdata.authorId}"),
                     subtitle: Text("Des: ${userdata.description}", maxLines: 4,),
                    trailing: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.teal,
                      child: IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(
                          Icons.navigate_next_sharp,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
          return Container(
         // color: Colors.redAccent,
          );
        },
      ),
    );
  }
}
