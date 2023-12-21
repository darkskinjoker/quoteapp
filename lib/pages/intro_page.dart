import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quoteapp/pages/login_page.dart';

class Intropage extends StatelessWidget {
@override
Widget build(BuildContext context){
  double height = 40;
  double width = 40;
return Scaffold(
  backgroundColor: Colors.white70,
  body: Container(
    margin: EdgeInsets.only(left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: [
        Spacer(),
        Image.asset("assets/quote.png",
        height: height,
          width: width,
        ),
        SizedBox(
          height:50,
        ),
        RichText(
            text: TextSpan(

                children: [
                  TextSpan(text: "Get\n"),
                  TextSpan(text: "Motivated", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
  ),
        Spacer(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.black,
            ),
            child: Text('Let\'s go'),
          ),
        )
      ],
    ),
  )
);
}
}