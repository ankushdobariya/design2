import 'package:design2/demoview.dart';
import 'package:design2/mediaquery.dart';
import 'package:design2/second.dart';
import 'package:design2/third.dart';
import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    mediaquery(context);
    return Scaffold(backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            child: Image(
              image: AssetImage("image/ss 1.png"),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              // color: Colors.orange,
              child: Column(
                children: [
                  Text(
                    "Try it with your",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,color: Colors.white),
                  ),
                  Text(
                    "photos",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,color: Colors.white),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: mediaquery.width! * 0.90,
            child: Column(
              children: [
                Text(
                  "It was popularised in the 1960s with the",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Text(
                  "relee of Letraset sheets containing Photo",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Text(
                  "restora...",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return demoview();
          },));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          alignment: Alignment.center,
          height: mediaquery.height! * 0.08,
          width: mediaquery.width! * 0.90,
          decoration: BoxDecoration(
              color: Color(0xff007AFF), borderRadius: BorderRadius.circular(20)),
          child: Text(
            "Get started",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
