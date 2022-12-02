import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/UserModel.dart';




class Get{
  String url = "https://reqres.in/api/users?page=2";
  bool? isLoading = true ;

  Future<UserModel>data()async{
    var response = await http.get((Uri.parse(url)));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      UserModel.fromJson(jsonResponse);
      isLoading = false;
      return UserModel.fromJson(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      isLoading = false;
      return UserModel();
    }
  }
}