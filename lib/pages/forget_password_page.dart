import 'package:day3/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            SizedBox(height: 50,),
            Container(
                alignment: Alignment.center,

                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                )),
            const Text("Please enter your email address to request reset password",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black38,
              ),),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  labelText: 'Email',
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              Fluttertoast.showToast(msg: "Password Reseted");
              Navigator.push(context, MaterialPageRoute(builder: (c)=>const HomePage()));
            },
              child: const Text("SEND NEW PASSWORD",
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
