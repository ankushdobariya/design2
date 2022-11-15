import 'package:before_after/before_after.dart';
import 'package:design2/ad.dart';
import 'package:design2/data.dart';
import 'package:design2/mediaquery.dart';
import 'package:design2/multdesignpick.dart';
import 'package:design2/premium.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  int  currentindex=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ads.bannerad();
  }
  @override
  Widget build(BuildContext context) {
    mediaquery(context);
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentindex,
          children: const [
            home(),
            history(),
            setting(),
    ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade900,
        currentIndex: currentindex,
        unselectedItemColor: Colors.grey,
        type:BottomNavigationBarType.fixed,
        onTap: (int index) => setState(() => currentindex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.watch_later), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  } 
}
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController a1=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return premium();
                },));
              },
              child: Container(
                margin: EdgeInsets.only(top: 15,right: 290),
                height: mediaquery.height! * 0.04,
                width: mediaquery.width!* 0.21,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [Color(0xff7810F1),Color(0xff4E29FC)]
                    )
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      height: mediaquery.height! * 0.03,
                      child: Image(image:AssetImage("image/ff20 1.png"),),),
                    Text("PRO",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20),)
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 13,top: 10),
              child: Row(
                children: [
                  Text("AI Photo",style:TextStyle(fontSize:30,fontWeight:FontWeight.bold,color:Colors.white),),
                ],
              ),
            ),
            Container(alignment: Alignment.center,
                height: mediaquery.height! * 0.05,
                margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(controller:a1,
                  style: TextStyle(fontSize: 18,color: Colors.white),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search,color: Colors.grey,),
                    hintText: "Search Effect",
                  ),
                )),
            Container(
              height: mediaquery.height! * 0.68,
              margin: EdgeInsets.only(top: 30),
              child: ListView.builder(
                itemCount: data.title.length,
                itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return multd();
                    },));
                  },
                  child: Container(
                    child: Column(

                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)
                            )
                          ),
                          // color: Colors.green,
                          child: BeforeAfter(
                              beforeImage: Image.asset("${data.image[index]}",fit: BoxFit.fill,),
                              afterImage: Image.asset("${data.simage[index]}",fit: BoxFit.fill,),
                              imageCornerRadius: 10,
                              thumbRadius: 0.01,
                              imageWidth: mediaquery.width! * 0.88, imageHeight: mediaquery.height! * 0.28,),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 22,right: 22,bottom: 15),
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))
                          ),
                          child: Column(
                            children: [

                              Container(
                                // color: Colors.purple,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 10,left: 20),
                                child: Text("${data.title[index]}",style:TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.white),),
                              ),
                              Container(
                                 // color: Colors.red,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 10,left: 20,right: 15,bottom: 15),
                                child: Text("${data.subtitle[index]},${data.subatitle[index]}",style:TextStyle(fontSize: 16,color: Colors.white),),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },),
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      ads.bannerad();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,

      body: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return premium();
              },));
            },
            child: Container(
              margin: EdgeInsets.only(top: 21,right: 290),
              height: mediaquery.height! * 0.04,
              width: mediaquery.width!* 0.21,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      colors: [Color(0xff7810F1),Color(0xff4E29FC)]
                  )
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    height: mediaquery.height! * 0.03,
                    child: Image(image:AssetImage("image/ff20 1.png"),),),
                  Text("PRO",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 23.5,left: 10,right: 10),
              height: mediaquery.height! * 0.77,
              child: SingleChildScrollView(
                child:  Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10,),
                      child: Row(
                        children: [
                          Text("History",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerLeft,
                      width: mediaquery.width,
                      // /    color: Colors.white,
                      child: Text("6 May 2022",style: TextStyle(color: Colors.white,fontSize: 19),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: mediaquery.height! * 0.24,
                      // color: Colors.white,
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,crossAxisSpacing: 5),
                        itemCount: data.g1image.length,

                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage("${data.g1image[index]}",),fit: BoxFit.fill
                                )
                            ),
                          );
                        },),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      alignment: Alignment.centerLeft,
                      width: mediaquery.width,
                      // /    color: Colors.white,
                      child: Text("6 May 2022",style: TextStyle(color: Colors.white,fontSize: 19),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: mediaquery.height! * 0.50,
                      //
                      child: GridView.builder(

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,crossAxisSpacing: 5,mainAxisSpacing: 5),
                        itemCount: data.g2image.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage("${data.g2image[index]}",),fit: BoxFit.fill
                                )
                            ),
                          );
                        },),
                    )
                  ],
                ),
              )
            ),
          ),

        ],
      ),
    );
  }
}

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    body: SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: AdWidget(ad: ads.myBanner!),
        width: ads.myBanner!.size.width.toDouble(),
        height: ads.myBanner!.size.height.toDouble(),
        alignment: Alignment.center,
          ),
          // ElevatedButton(onPressed: () {
          //   ads.createRewardedAd();
          //   ads.showRewardedAd();
          // }, child: Text("add")),
          Container(
            margin: EdgeInsets.only(top: 15,right: 290),
            height: mediaquery.height! * 0.04,
            width: mediaquery.width!* 0.21,
          ),
          Container(
            margin: EdgeInsets.only(left: 13,top: 10),
            child: Row(
              children: [
                Text("Setting",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return premium();
              },));
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              // color: Colors.white,
              height: mediaquery.height! *0.35,
              width: double.infinity,
              child: Image.asset("image/AI Photo Pro.png",fit: BoxFit.fill,),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 20),
              child: Text("Restore Purchase",style: TextStyle(color: Colors.white,fontSize: 20),)),
          Container(alignment:Alignment.center,
              margin: EdgeInsets.only(left: 10,right:10,bottom: 1),
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),topRight: Radius.circular(10)
                )

              ),
              child: ListTile(
                leading: Icon(Icons.star_border,color: Colors.white,),
                title:Text("Rate Us",style: TextStyle(color: Colors.white),) ,
                trailing: Icon(Icons.navigate_next,color: Colors.white,),
              )
          ),
          InkWell(

            onTap: () {
              setState(() {
                Share.share('check out my website https://example.com');
              });
            },
            child: Container(alignment:Alignment.center,
                margin: EdgeInsets.only(left: 10,right:10,bottom: 1),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,

                ),
                child: ListTile(
                  leading: Icon(Icons.share,color: Colors.white,),
                  title:Text("Share App",style: TextStyle(color: Colors.white),) ,
                  trailing: Icon(Icons.navigate_next,color: Colors.white,),
                )
            ),
          ),
          Container(alignment:Alignment.center,
              margin: EdgeInsets.only(left: 10,right:10,bottom: 1),
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,

              ),
              child: ListTile(
                leading: Icon(Icons.help_outline_outlined,color: Colors.white,),
                title:Text("Help",style: TextStyle(color: Colors.white),) ,
                trailing: Icon(Icons.navigate_next,color: Colors.white,),
              )
          ),
          Container(alignment:Alignment.center,
              margin: EdgeInsets.only(left: 10,right:10,bottom: 1),
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
                )

              ),
              child: ListTile(
                leading: Icon(Icons.more_horiz_rounded,color: Colors.white,),
                title:Text("More Apps",style: TextStyle(color: Colors.white),) ,
                trailing: Icon(Icons.navigate_next,color: Colors.white,),
              )
          ),

          Container(alignment:Alignment.center,
              margin: EdgeInsets.only(left: 10,right:10,bottom: 1,top: 20),
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),topRight: Radius.circular(10)
                  )

              ),
              child: ListTile(
                leading: Icon(Icons.star_border,color: Colors.white,),
                title:Text("Rate Us",style: TextStyle(color: Colors.white),) ,
                trailing: Icon(Icons.navigate_next,color: Colors.white,),
              )
          ),
          Container(alignment:Alignment.center,
              margin: EdgeInsets.only(left: 10,right:10,bottom: 1),
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                  )
              ),
              child: ListTile(
                leading: Icon(Icons.more_horiz_rounded,color: Colors.white,),
                title:Text("More Apps",style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.navigate_next),
              )
          ),
        ],
      ),
    ),
    );
  }
}
class BeforeAfter extends StatefulWidget {
  final Widget beforeImage;
  final Widget afterImage;
  final double imageHeight;
  final double imageWidth;
  final double imageCornerRadius;
  final Color thumbColor;
  final double thumbRadius;
  final bool isVertical;

  const BeforeAfter({
    Key? key,
    required this.beforeImage,
    required this.afterImage,
    required this.imageHeight,
    required this.imageWidth,
    this.imageCornerRadius = 8.0,
    this.thumbColor = Colors.white,
    this.thumbRadius = 16.0,
    this.isVertical = false,
  })  : assert(beforeImage != null),
        assert(afterImage != null),
        super(key: key);

  @override
  _BeforeAfterState createState() => _BeforeAfterState();
}

class _BeforeAfterState extends State<BeforeAfter> {
  double _clipFactor = 0.5;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Padding(
          padding: widget.isVertical
              ? const EdgeInsets.symmetric(vertical: 24.0)
              : const EdgeInsets.symmetric(horizontal: 24.0),
          child: SizedImage(
            widget.afterImage,
            widget.imageHeight,
            widget.imageWidth,
            widget.imageCornerRadius,
          ),
        ),
        Padding(
          padding: widget.isVertical
              ? const EdgeInsets.symmetric(vertical: 24.0)
              : const EdgeInsets.symmetric(horizontal: 24.0),
          child: ClipPath(
            clipper: widget.isVertical
                ? RectClipperVertical(_clipFactor)
                : RectClipper(_clipFactor),
            child: SizedImage(
              widget.beforeImage,
              widget.imageHeight,
              widget.imageWidth,
              widget.imageCornerRadius,
            ),
          ),
        ),
        Positioned.fill(
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 0.0,
              // overlayColor: widget.overlayColor,
              thumbShape:
              CustomThumbShape(widget.thumbRadius, widget.thumbColor),
            ),
            child: widget.isVertical
                ? RotatedBox(
              quarterTurns: 1,
              child: Slider(
                value: _clipFactor,
                onChanged: (double factor) =>
                    setState(() => this._clipFactor = factor),
              ),
            )
                : Slider(
              value: _clipFactor,
              onChanged: (double factor) =>
                  setState(() => this._clipFactor = factor),
            ),
          ),
        ),
      ],
    );
  }
}

class SizedImage extends StatelessWidget {
  final Widget _image;
  final double _height, _width, _imageCornerRadius;

  const SizedImage(
      this._image, this._height, this._width, this._imageCornerRadius,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(_imageCornerRadius),
      topLeft: Radius.circular(_imageCornerRadius)),
      child: SizedBox(
        height: _height,
        width: _width,
        child: _image,
      ),
    );
  }
}


class CustomThumbShape extends SliderComponentShape {
  final double _thumbRadius;
  final Color _thumbColor;

  CustomThumbShape(this._thumbRadius, this._thumbColor);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(_thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double>? activationAnimation,
        Animation<double>? enableAnimation,
        bool? isDiscrete,
        TextPainter? labelPainter,
        RenderBox? parentBox,
        SliderThemeData? sliderTheme,
        TextDirection? textDirection,
        double? value,
        double? textScaleFactor,
        Size? sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 4.0
      ..color = _thumbColor
      ..style = PaintingStyle.fill;

    final Paint paintStroke = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 4.0
      ..color = _thumbColor
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      center,
      _thumbRadius,
      paintStroke,
    );

    canvas.drawCircle(
      center,
      _thumbRadius - 6,
      paint,
    );

    canvas.drawRect(
        Rect.fromCenter(
            center: center, width: 4.0, height: parentBox!.size.height),
        paint);
  }
}
class RectClipper extends CustomClipper<Path> {
  final double clipFactor;

  RectClipper(this.clipFactor);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * clipFactor, 0.0);
    path.lineTo(size.width * clipFactor, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class RectClipperVertical extends CustomClipper<Path> {
  final double clipFactor;

  RectClipperVertical(this.clipFactor);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height * clipFactor);
    path.lineTo(size.width, size.height * clipFactor);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}