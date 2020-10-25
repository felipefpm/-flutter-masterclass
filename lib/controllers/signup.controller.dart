import 'package:flutter_masterclass/models/user.model.dart';
import 'package:flutter_masterclass/repositories/accaount.repository.dart';
import 'package:flutter_masterclass/view-models/signup.viewmodel.dart';

class SignupController {
  AccountRepository repository;

  SignupController() {
    repository = new AccountRepository();
  }

  Future<UserModel> create(SignupViewModel model) async {
    model.busy = true;
    var user = await repository.createAccount(model);
    model.busy = false;
    return user;
  }
}
