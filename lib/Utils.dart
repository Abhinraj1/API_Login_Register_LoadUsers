import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String title, content;
   CustomText({Key? key,
  required this.title,
     required this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: SizedBox(
        width: 250,
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: "$title : ",
              style:
              const TextStyle(
                  color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800)),

          TextSpan(
              text: content,
              style: const TextStyle(
                  color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500
              )),



            ],

          ),

        ),
      ),
    );
  }
}
