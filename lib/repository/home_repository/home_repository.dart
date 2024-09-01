
import 'package:flutter_getx_mvvm_masterclass/data/network/network_api_service.dart';
import 'package:flutter_getx_mvvm_masterclass/models/home/user_list_model.dart';
import 'package:flutter_getx_mvvm_masterclass/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiService();

  Future<UserListModel> userList() async {
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}