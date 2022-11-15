
import 'package:design2/data.dart';
import 'package:design2/mediaquery.dart';
import 'package:design2/permission.dart';
import 'package:flutter/material.dart';
import 'package:before_after/before_after.dart';

class demoview extends StatefulWidget {
  const demoview({Key? key}) : super(key: key);

  @override
  State<demoview> createState() => _demoviewState();
}

class _demoviewState extends State<demoview> {

  PageController? controller;
  var currentposition  = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(
      initialPage: 0,
    );
  }
  @override
  Widget build(BuildContext context) {
    mediaquery(context);
    return Scaffold(backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(margin: EdgeInsets.only(top: 80,bottom: 30),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 80,right: 10),
                    // padding: EdgeInsets.only(left: 60),
                    // color: Colors.green,
                    height: mediaquery.width! * 0.15,
                    width: mediaquery.width! * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff7810F1),Color(0xff4E29FC)]
                        )
                    ),
                    child: Image(image: AssetImage("image/ff20 1.png"),),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    // color: Colors.orange,
                    height: mediaquery.height!* 0.10,
                    width: mediaquery.width! * 0.60,
                    child: Text("PHOTO",style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize: 50),),
                  )
                ],
              ),
            ),
            Container(
              height: mediaquery.height! * 0.45,
              child: PageView.builder(
                onPageChanged: (value) {
                  currentposition=value;
                  setState(() {
                  });
                },
                controller: controller,
                itemCount: data.title.length,
                itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                       margin: EdgeInsets.only(top: 10,bottom: 10),
                      height: mediaquery.height!*0.290,

                      child: BeforeAfter(
                        beforeImage: Image.asset("${data.image[index]}",fit: BoxFit.fill,),
                        afterImage: Image.asset("${data.simage[index]}",fit: BoxFit.fill,),
                        imageHeight: mediaquery.height!*0.290,
                        imageWidth: 500,
                        thumbRadius: 0,
                      ),
                    ),
                    Text("${data.title[index]}",style: TextStyle(color:Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),

                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text("${data.subtitle[index]}",style: TextStyle(color: Colors.grey.shade400,fontSize: 18),),
                    ),
                    Text("${data.subatitle[index]}",style: TextStyle(color: Colors.grey.shade400,fontSize: 18),),
                  ],
                );
              },),
            ),

            Container(

              height: 80,
             margin: EdgeInsets.only(top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 ...List.generate(10, (index) {
                    return Container(
                      margin: EdgeInsets.all(3),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: currentposition == index ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    );
                  }),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if(currentposition == 9)
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return permission();
                    },));
                  }
                else
                  {
                    controller!.nextPage(duration: Duration(seconds: 1),curve:Curves.ease);
                  }
              },
              child: Container(

                alignment: Alignment.center,
                height: mediaquery.height! * 0.07,
                width: mediaquery.width! * 0.90,
                decoration: BoxDecoration(
                    color: Color(0xff007AFF), borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            TextButton(onPressed: () {
              setState(() {
                controller!.jumpToPage(9);
              });
            }, child: Text("Skip"))

          ],
        ),
      ),
    );
  }
}
