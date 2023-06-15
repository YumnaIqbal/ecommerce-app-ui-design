import 'package:day3/pages/forget_password_page.dart';
import 'package:day3/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  var name = '';
  final _formKey = GlobalKey<FormState>();
  // function goto home page

  movetoHome(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        //backgroundColor:MyTheme.whiteColor,    //MyTheme is class name
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(children: [
              CircleAvatar(
backgroundColor: Colors.transparent,
                child: SizedBox(
                  height: 1000,
                  width: 1000,
                  child: Image.asset(
                    'assets/images/login.png',
                    fit: BoxFit.cover,

                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Welcome ${name}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: " Enter UserName",
                      labelText: "UserName",
                    ),
                    validator: (value) {
                      //value variable
                      if (value!.isEmpty) {
                        return 'Username cannot be empty';
                      }
                    },
                    onChanged: (value) {
                      setState(
                        () {
                          name = value;
                        },
                      );
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (value.length < 6) {
                        return 'Password should be greater than 5';
                      }
                    },
                  ),
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  movetoHome(context);
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(150, 35),
                ),
                child: Text("Login"),
              ),
              SizedBox(height: 100,),
              TextButton(
                onPressed: () {
                  //forgot password screen
                  Navigator.push(context, MaterialPageRoute(builder: (c) => const ForgetPassword()));
                },
                child: const Text('Forgot Password',
                  style: TextStyle(
                      color: Colors.orange
                  ),),
              ),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 15,
                          color: Colors.orange),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) => SignUpScreen()));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
            ),
            ),
          ),
        ),
    );
  }
}
