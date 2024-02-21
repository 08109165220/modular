import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(100))),
          ),
          width: 360,
          height: 490,
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          width: 400,
          height: 200,
          top: 490,
          right: 150,
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(100))),
          ),
          width: 360,
          height: 350,
          top: 490,
        ),
        Positioned(
            top: 180,
            right: 150,
            child: Text(
              "LOG-IN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
        Positioned(
            top: 235,
            left: 50,
            right: 50,
            child: TextFormField(
              style: TextStyle(fontSize: 15, color: Colors.white),
              decoration: InputDecoration(
                label: Text("USERNAME:",style:TextStyle(color:Colors.white38)),
                contentPadding:
                    EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 5),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,
                    width: 15,
                  ),
                  borderRadius: BorderRadius.circular(20),

                ),
              ),
            )),
        Positioned(
            top: 320,
            left: 50,
            right: 50,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: 15, color: Colors.white),
              decoration: InputDecoration(
                label: Text("E-MAIL:",style:TextStyle(color:Colors.white38)),
                contentPadding:
                    EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 5),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 15,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )),
        Positioned(
            top: 405,
            left: 50,
            right: 50,
            child: TextFormField(textInputAction: TextInputAction.unspecified,
              style: TextStyle(fontSize: 15, color: Colors.white),
              decoration: InputDecoration(
                label: Text("PASSWORD:",style:TextStyle(color:Colors.white38)),
                contentPadding:
                    EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 5),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 15,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )),
        Positioned(
            top: 500,
            left: 140,
            right: 140,
            child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(10))),
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    overlayColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () {if (TextFormField==null){debugPrint("Input Login credentials");
                }else {Navigator.push(context,MaterialPageRoute(builder:(context) =>Scaffold() ,));}
                },
                child: Text("LOGIN", style: TextStyle(color: Colors.black))))
      ]),
    );
  }
}
