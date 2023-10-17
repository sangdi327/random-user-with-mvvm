import 'package:flutter/material.dart';
import 'package:random_user_mvvm_practice/model/user_model.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: Image.network(user.userImage ?? '').image,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    user.fullName ?? '',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    user.cellphone ?? '',
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
