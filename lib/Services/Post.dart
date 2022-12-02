import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/CreatedModel.dart';
import '../Model/UserModel.dart';




class Post{
  String url = "https://reqres.in/api/users";
  bool? isLoading = true ;

  Future<CreatedModel>data(Data model)async{

    var response =  await http.post((Uri.parse(url)),
    body: {
      "firstName" : model.firstName,
      "lastName" : model.lastName
    });
    if (response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      UserModel.fromJson(jsonResponse);
      isLoading = false;
      return CreatedModel.fromJson(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      isLoading = false;
      return CreatedModel();
    }

  }
}