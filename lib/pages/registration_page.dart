
import 'package:day3/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final countryPicker = const  FlCountryCodePicker();
  CountryCode? countryCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Enter Your Phone Number to Registration",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 10,
            ),),
          SizedBox(height: 10,),
          TextFormField
            (
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: "Enter Phone Number",
              border: InputBorder.none,
              prefixIcon: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () async{

                        final code =await countryPicker.showPicker(context: context);
                        setState(() {
                          countryCode = code;
                        });
                      },
                      child: Row(

                        children: [
                          Container(
                            child: countryCode!= null
                                ? countryCode!.flagImage()
                                : null,
                          ),
                          SizedBox(width: 10,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16,
                                vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(countryCode?.dialCode ??"+92",
                              style: TextStyle(
                                color: Colors.white,
                              ),),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              labelStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            Fluttertoast.showToast(msg: "Registration Completed");
            Navigator.push(context,
                MaterialPageRoute(builder: (c) => HomePage()));
          }, child: Text(
            "Send",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
            style: ElevatedButton.styleFrom(
                primary: Colors.teal
            ),)
        ],
      ),
    );
  }
}
