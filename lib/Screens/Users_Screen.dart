import 'package:flutter/material.dart';
import 'package:zigy/Screens/Post_Screen.dart';

import '../Model/UserModel.dart';
import '../Services/Get_Call.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "List Of Users",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (BuildContext context)=> const PostScreen()));
        },
        backgroundColor: Colors.amberAccent.shade700,
        label:const Text("Go To Post Screen",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800
          ),),
      ) ,
      body: FutureBuilder(
        future: Get().data(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const  Center(child: CircularProgressIndicator(
              backgroundColor: Colors.amber,
            ));
          }
          else if (snapshot.hasData) {
            UserModel? data = snapshot.data;
            return
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: data!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        subtitle:  Text(data.data![index].email.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          ),),
                        tileColor: Colors.amber.shade700,
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(data.data![index].avatar.toString()),
                        ),
                        title: Text("${data.data![index].firstName.toString()} ${data.data![index].lastName.toString()}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800
                          ),),
                      ),
                    );
                  }
              );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return const SizedBox();

        },
      ),
    );
  }
}
