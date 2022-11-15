import 'package:design2/second.dart';
import 'package:flutter/material.dart';

class permission extends StatefulWidget {
  const permission({Key? key}) : super(key: key);

  @override
  State<permission> createState() => _permissionState();
}

class _permissionState extends State<permission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 80,bottom: 20),
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("image/per.png")
                )
              ),
            ),
            Text("Let's modify your.",style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
            Text("photos",style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Text("Allow access to your photos so that they",
                  style: TextStyle(color: Colors.grey,fontSize: 17),
                  ),
                  Text("can be magically transformed.",
                    style: TextStyle(color: Colors.grey,fontSize: 17),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return second();
                },));
              },
              child: Container(
                margin: EdgeInsets.only(top: 30,left: 20,right: 20),
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff007AFF),
                  borderRadius: BorderRadius.circular(10)
                ),

                child: Text("Give access to photos ",style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
