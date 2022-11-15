import 'dart:async';

import 'package:flutter/material.dart';

 class multd extends StatefulWidget{

  const multd({Key? key}) : super(key: key);

  @override
  State<multd> createState() => _multdState();
}
class _multdState extends State<multd> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 550,
              // color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children:[
                    Container(
                      child: BeforeAfter(
                          beforeImage: Image.asset("image/f1.png"),
                        afterImage: Image.asset("image/ff1.png",fit:BoxFit.fitWidth,),
                          thumbRadius: 0.01,
                        imageCornerRadius: 0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:20,left:13),
                      alignment: Alignment.centerLeft,
                      child: Text("Childish",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                      fontSize: 30),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 13,right: 10),
                      child: Text("Using our advanced AI cartoonizer, transform your photos into really unique pieces of art.",
                        style: TextStyle(color: Colors.grey,
                          fontSize: 18),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,bottom: 15,right: 10,top: 10),
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("image/Group 1.png"),fit: BoxFit.fill
                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,bottom: 10,right: 10),
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("image/Group 2.png"),fit: BoxFit.fill
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 198,
              width:double.infinity,
              decoration:BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius:BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25,bottom:10,right: 15,left: 15),
                    height: 70,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      border:Border.all(
                        color: Color(0xff007AFF)
                      )
                    ),
                    child:  Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Icon(Icons.image_outlined,color:Color(0xff007AFF),),
                        Text("  Single Photo",style: TextStyle(
                            color: Color(0xff007AFF),fontSize: 20,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 5,right: 15,left: 15),
                    height: 70,
                    decoration: BoxDecoration(
                        color: Color(0xff007AFF),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image_outlined,color:Colors.white,),
                        Text("  Multiple Photos",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
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
    this.imageHeight = 260,
    this.imageWidth = 400,
    this.imageCornerRadius = 8.0,
    this.thumbColor = Colors.white,
    this.thumbRadius = 16.0,
    this.isVertical = false,
  })  : assert(beforeImage != null),
        assert(afterImage != null),
        super(key : key);


  @override
  _BeforeAfterState createState() => _BeforeAfterState();
}

class _BeforeAfterState extends State<BeforeAfter> {

  double _clipFactor = 0.5;

  @override
  void initState() {
    // TODO: implement initStatew
    super.initState();
    Timer(Duration(seconds: 5),() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedImage(
          widget.afterImage,
          widget.imageHeight,
          widget.imageWidth,
          widget.imageCornerRadius,
        ),
        ClipPath(
          clipper:widget.isVertical
              ? RectClipperVertical(_clipFactor)
              : RectClipper(_clipFactor),
          child: SizedImage(
            widget.beforeImage,
            widget.imageHeight,
            widget.imageWidth,
            widget.imageCornerRadius,
          ),
        ),
        Positioned.fill(
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 0,
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
      {Key? key}) : super(key: key);

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
            center: center, width: 2, height: parentBox!.size.height),
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
