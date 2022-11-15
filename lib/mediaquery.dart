import 'package:flutter/material.dart';

class mediaquery
{
  static double? width,height,stheight,btheight,appheight,bdheight;
  mediaquery(BuildContext context)
  {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    stheight=MediaQuery.of(context).padding.top;
    btheight=MediaQuery.of(context).padding.bottom;
    appheight=kToolbarHeight;
    bdheight=height!-stheight!-btheight!-appheight!;

  }

}