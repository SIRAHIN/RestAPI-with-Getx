import 'dart:convert';

import 'package:api_with_getx/services/api_service.dart';
import 'package:get/get.dart';

import '../model/all_user_model.dart';
import '../model/user_model.dart';

class UserDataController extends GetxController {
  UserModel? userModelData ;

  AllUserModel? allUserModel;

  RxList<Result> resultList = RxList([]);



  // @override
  // onInit(){
  //   super.onInit();
  // fetchUserList();
  // }


  Future <UserModel> fetchUserList() async {
    var fetchData = await ApiService.getUserInfo();
    // for(var item in fetchData){
    //   userModelData.add(UserModel.fromJson(item));
    // }
    
    userModelData = UserModel.fromJson(fetchData);
   // update();
    return userModelData!;
}

  Future<List<Result>> fetchUserData () async{
    String response = await ApiService.allUserInfo();
    var decodedResponse = jsonDecode(response);
    List data = decodedResponse["results"];
    data.forEach((element) {
      resultList.add(Result.fromJson(element));
    });
     return resultList;
    }

}
