import 'dart:async';
import 'package:day3/pages/sign_up_page.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer()
  {
    Timer(Duration(seconds: 4), ()async{
      Navigator.push(context, MaterialPageRoute(builder: (c) =>const SignUpScreen()));
    });
  }
  @override //this fuction runs automatically when user come to the slpashscreen
  void initState(){
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black38,
            child:SizedBox(
              width: 500,
              height: 500,
              child: Image.asset("images/splash.png"),
            ),
          ),
          const SizedBox(height: 15,),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Food Delivery Online",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                letterSpacing: 3,
              ),
            ),
          )
        ],
      ),
    );
  }
}
