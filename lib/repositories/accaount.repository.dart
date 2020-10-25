import 'package:flutter_masterclass/models/user.model.dart';
import 'package:flutter_masterclass/view-models/signup.viewmodel.dart';

class AccountRepository {
  Future<UserModel> createAccount(SignupViewModel model) async {
    await Future.delayed(new Duration(milliseconds: 1500));
    return new UserModel(
      id: "1",
      name: "Felipe Pintio",
      email: "felipepinto@email.com",
      picture: "https://picsum.photos/200/200",
      role: "Student",
      token: "010203",
    );
  }
}
