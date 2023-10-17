import 'package:get/get.dart';
import 'package:random_user_mvvm_practice/model/user_model.dart';
import 'package:random_user_mvvm_practice/repository/user_repository.dart';

class UserController extends GetxController {
  late UserRepository userRepository;
  RxList<UserModel> userDataList = <UserModel>[].obs;
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    userRepository = UserRepository();
  }

  void loadUser() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    final userList = await userRepository.getUserInfo();
    userDataList.value = userList;
    loading = false;
  }
}
