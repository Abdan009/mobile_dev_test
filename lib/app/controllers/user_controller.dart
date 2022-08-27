import 'package:get/get.dart';
import 'package:test_mobile_dev/app/data/models/user_model.dart';
import 'package:test_mobile_dev/app/data/providers/user_provider.dart';
import 'package:test_mobile_dev/shared/shared.dart';

class UserController extends GetxController {
  var myUser = Rxn<User>();

  Future getMyUser() async {
    var result = await UserProvider().getUser(1);
    if (result.value != null) {
      myUser.value = result.value;
    } else {
      snackbarCustom(
        typeSnackbar: TypeSnackbar.error,
        message: result.message!,
      );
    }
  }
}
