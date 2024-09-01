
import 'package:flutter_getx_mvvm_masterclass/data/network/network_api_service.dart';
import 'package:flutter_getx_mvvm_masterclass/res/app_url/app_url.dart';

class LoginRepository {
   final _apiService = NetworkApiService();

   Future<dynamic> loginApi(var data) async {
     dynamic response = _apiService.postApi(data, AppUrl.loginApi
     );
     return response;
   }
}