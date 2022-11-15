import 'dart:async';
import 'package:design2/firstpage.dart';
import 'package:design2/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: design2(),

  ));
}

class design2 extends StatefulWidget {
  const design2({Key? key}) : super(key: key);

  @override
  State<design2> createState() => _design2State();
}

class _design2State extends State<design2> {


  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),() {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
        return first();
      },));
    });
  }
  @override
  Widget build(BuildContext context) {
    mediaquery(context);
    return Scaffold(
      body: SafeArea(
        child:
            Container(
              height: mediaquery.height,
              width: mediaquery.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff7810F1),Color(0xff4E29FC)]
                )
              ),
              child: Column(
                children: [
                  Container(margin: EdgeInsets.only(top:300),
                    // color: Colors.orange,
                    height:mediaquery.height!/7,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 60),
                          // color: Colors.green,
                          height: mediaquery.height!* 0.10,
                          width: mediaquery.width! * 0.40,
                        child: Image(image: AssetImage("image/ff20 1.png"),),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          // color: Colors.orange,
                          height: mediaquery.height!* 0.10,
                          width: mediaquery.width! * 0.60,
                          child: Text("PHOTO",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 50),),
                        )
                      ],
                    ),
                    ),
                  Container(
                    margin: EdgeInsets.only(top:150),
                    // color: Colors.green,
                    height: mediaquery.width!/9,
                    width: mediaquery.width!/9,
                    child: CircularProgressIndicator(
                      color:Colors.white,
                    ),
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(bottom:30),
                      child: Text("Version 2.67.2",style: TextStyle(color: Colors.white,fontSize: 20),))
                ],
              ),
            ),
      ),
    );
  }
}
