import 'package:before_after/before_after.dart';
import 'package:design2/mediaquery.dart';
import 'package:flutter/material.dart';

class premium extends StatefulWidget {
  const premium({Key? key}) : super(key: key);

  @override
  State<premium> createState() => _premiumState();
}

class _premiumState extends State<premium> {
  @override
  Widget build(BuildContext context) {
    mediaquery(context);
    return Scaffold(backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: BeforeAfter(
                      beforeImage: Image.asset("image/f1.png"),
                      afterImage: Image.asset("image/ff1.png"),

                    imageCornerRadius: 0,
                    thumbRadius: 0,
                  ),
                ),
                Container(margin: EdgeInsets.only(top: 15,bottom: 15),
                  child: Text("Premium",style: TextStyle(color: Colors.white,fontSize: 50),),
                ),
                Container(
                   margin: EdgeInsets.only(left: 20,bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.file_download_outlined,color: Colors.blue,size: 30),

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Downlod Multiple Photos in One Tap",style:TextStyle(color: Colors.white,fontSize: 17),),
                      )
                    ],
                  ),
                ),
                Container(
                   margin: EdgeInsets.only(left: 20,bottom: 10),
                  child: Row(
                    children:[

                      Icon(Icons.arrow_forward_ios_sharp,color: Colors.blue,size:25),
                      Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Text("Save Time by Faster Processing",style:TextStyle(color: Colors.white,fontSize: 17),),
                      )

                    ],
                  ),
                ),
                Container(
                   margin: EdgeInsets.only(left: 20,bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.no_adult_content_sharp,color: Colors.blue,size: 25),
                      Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Text("Enjoy App without Annoting Ads",style:TextStyle(color: Colors.white,fontSize: 17),),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10,right: 10,top: 20),
                  height: mediaquery.height! * 0.10,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: ListTile(
                    leading: Icon(Icons.circle_outlined,color: Colors.white,size: 30,),
                    title: Text("RS.20 / Week",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                  height: mediaquery.height! * 0.10,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: ListTile(
                    leading: Icon(Icons.circle_outlined,color: Colors.white,size: 30,),
                    title: Text("RS.20 / Year",style: TextStyle(color: Colors.white,fontSize: 20),),
                    subtitle: Text("3 days FREE TRIAL",style: TextStyle(color: Colors.white,fontSize: 15),),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 10),
                  height: mediaquery.height! * 0.07,
                  decoration: BoxDecoration(
                      color: Color(0xff007AFF),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  alignment:Alignment.center,
                  child: Text("Try It Free",style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15,top:10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Privacy",style: TextStyle(color: Colors.white),),

                      Text("Restore Purchase",style: TextStyle(color: Colors.white,fontSize: 20),),

                      Text("Terms",style: TextStyle(color: Colors.white),),


                    ],
                  ),
                )
              ],
            ),
          ))
    );
  }
}
