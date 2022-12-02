import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Model/CreatedModel.dart';
import '../Model/UserModel.dart';
import '../Services/Get_Call.dart';
import '../Services/Post.dart';
import '../Utils.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool showData = false;
  Data postData = Data();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "Post Users",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {});
        },
        backgroundColor: Colors.amber.shade600,
        child: const Icon(
            Icons.refresh,
        color: Colors.white,
        size: 28),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 10,
                        color: Colors.amber.shade800
                      )
                  ),
                  hintText: "ENTER FIRST NAME",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3
                      )
                    )
                ),
              onChanged: (value){
                postData.firstName = value.toString();
                  // setState(() {
                  //   postData.firstName = value.toString();
                  // });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 10,
                            color: Colors.amber.shade800
                        )
                    ),
                    hintText: "ENTER LAST NAME",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3
                        )
                    )
                ),
              onChanged: (value){
                postData.lastName = value.toString();
                // setState(() {
                //   postData.firstName = value.toString();
                // });
              },
            ),
          ),
          Center(
            child: MaterialButton(
              height: 40,
              minWidth: 200,
              color: Colors.amber,
              onPressed: (){
             if(
                  postData.firstName.toString() != "null" && postData.firstName.toString() != "" &&
                 postData.lastName.toString() != "null" && postData.lastName.toString() != ""
             ){
               setState(() {
                 showData = !showData;
               });
             }else{
               if(showData){
                setState(() {
                  showData = !showData;
                });
               }
               const snackdemo = SnackBar(
                 content: Text('Please Enter Something in Name Fields'),
                 backgroundColor: Colors.red,
                 elevation: 10,
                 behavior: SnackBarBehavior.floating,
                 margin: EdgeInsets.all(5),
               );
               ScaffoldMessenger.of(context).showSnackBar(snackdemo);
             }
              },
              child: Text(
                showData ? "Post & Hide" :"Post & Show",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),),
            ),
          ),
          AnimatedCrossFade(
              firstChild: firstChild(),
              secondChild: const SizedBox(),
              crossFadeState: showData ?
              CrossFadeState.showFirst :
              CrossFadeState.showSecond,
              duration: const Duration(
                milliseconds: 500
              )),

        ],
      ),
    );
  }

  Widget firstChild(){
    return
      FutureBuilder(
      future: Post().data(postData),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Center(child: CircularProgressIndicator(
              backgroundColor: Colors.amber,
            )),
          );
        }
        else if (snapshot.hasData) {
          CreatedModel? data = snapshot.data;
          String? firstName = data!.firstName,
              lastName = data.lastName,
              created = data.created,
                   id = data.id;

          return
           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:Center(
                      child: Container(
                        height: 300,
                        width: 330,
                        decoration: BoxDecoration(
                          color: Colors.amber.shade800,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(title:"First Name",
                            content: firstName.toString(),),
                            CustomText(title:"Last Name",
                              content: lastName.toString(),),
                            CustomText(title:"Created At",
                              content: created.toString(),),
                            CustomText(title:"ID",
                              content: id.toString(),),
                          ],
                        ),
                      ),
                    )
                  );

        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }

        return const SizedBox();

      },
    );
  }
}
