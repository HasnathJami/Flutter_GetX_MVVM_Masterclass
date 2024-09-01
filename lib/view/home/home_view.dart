import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_masterclass/data/response/status.dart';
import 'package:flutter_getx_mvvm_masterclass/res/components/general_exception_widget.dart';
import 'package:flutter_getx_mvvm_masterclass/res/components/internet_exceptions_widget.dart';
import 'package:flutter_getx_mvvm_masterclass/res/routes/routes_name.dart';
import 'package:flutter_getx_mvvm_masterclass/view_models/home/home_view_model.dart';
import 'package:flutter_getx_mvvm_masterclass/view_models/user_preference/user_preference.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeViewModel = Get.put(HomeViewModel());
  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    super.initState();
    homeViewModel.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Users'),
        actions: [
          IconButton(
              onPressed: () {
                userPreference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginView);
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Obx(() {
        switch (homeViewModel.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(
              child: CircularProgressIndicator(),
            );
          case Status.ERROR:
            if(homeViewModel.error.value == 'No internet') {
              return InternetExceptionsWidget(onPress: (){
                homeViewModel.refreshApi();
              });
            } else {
              return GeneralExceptionWidget(onPress: (){
                homeViewModel.refreshApi();
              });
              // return Text(homeViewModel.error.value.toString());
            }
          case Status.COMPLETED:
            return ListView.builder(
                itemCount: homeViewModel.userList.value.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeViewModel
                            .userList.value.data![index].avatar
                            .toString()),
                      ),
                      title: Text(homeViewModel
                          .userList.value.data![index].firstName
                          .toString()),
                      subtitle:  Text(homeViewModel
                          .userList.value.data![index].email
                          .toString()),
                    ),
                  );
                });
        }
        // return Container();
      }),
    );
  }
}
