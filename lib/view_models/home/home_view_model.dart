import 'package:flutter_getx_mvvm_masterclass/data/response/status.dart';
import 'package:flutter_getx_mvvm_masterclass/models/home/user_list_model.dart';
import 'package:flutter_getx_mvvm_masterclass/repository/home_repository/home_repository.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setUserList(UserListModel value) => userList.value = value;

  void setError(String value) => error.value = value;

  void userListApi() {
    _api.userList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
       setError(error.toString());
       setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.userList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
