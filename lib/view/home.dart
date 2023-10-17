import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_user_mvvm_practice/components/user_widget.dart';
import 'package:random_user_mvvm_practice/controller/user_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final userListController = Get.put(UserController());

  Widget loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random user'),
      ),
      body: GetX<UserController>(builder: (_) {
        if (userListController.loading == true) {
          return loading();
        } else {
          return ListView.builder(
            itemCount: userListController.userDataList.length,
            itemBuilder: (context, index) => UserWidget(
              user: userListController.userDataList[index],
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userListController.loading = true;
          userListController.loadUser();
        },
        child: const Icon(Icons.verified_user_outlined),
      ),
    );
  }
}
