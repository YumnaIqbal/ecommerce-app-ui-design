import 'package:day3/pages/login_page.dart';
import 'package:day3/pages/registration_page.dart';
import 'package:flutter/material.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>(); //making instane for form
  TextEditingController passwordController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 50,),
            Container(
                alignment: Alignment.center,

                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                )),
            Text("Full Name",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black38,
              ),),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  labelText: 'User Name',
                ),
              ),
            ),
            Text("Email",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black38,
              ),),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Text("Password",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black38,
              ),),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal
                  ),
                  child: const Text('Login',
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c) => const RegistrationScreen()));
                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 15,
                        color: Colors.teal),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c) => Loginpage()));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}


