import 'dart:math';
import 'dart:ui' as UI;
import 'dart:ui';

import 'package:zerker/zerker.dart';

class ZZCube2 {
  ZKImage cube2;
  double rotate;
  double toPositionY;

  int Rcolor=0;
  int Gcolor=0;
  int Bcolor=0;

  ZZCube2(double initX,double toPositionY,double windowX){
    Rcolor=Random().nextInt(255);
    Gcolor=Random().nextInt(255);
    Bcolor=Random().nextInt(255);

    this.toPositionY=toPositionY;
    rotate=(Random().nextInt(80)+20).toDouble()/100;
    rotate=1;
    var paint = new Paint();
    var nextDouble = Random().nextInt(50).toDouble()/100;
    paint.colorFilter=UI.ColorFilter.mode(UI.Color.fromARGB(255,Rcolor, 255, 0), UI.BlendMode.srcATop);
    cube2 = ZKImage("cube2");
    cube2.setPosition(windowX,-Random().nextDouble()*1000);
    cube2.setScale(0.5);
    cube2.rotation=0.5;
    cube2.paint=paint;
    ZKTween(cube2).to({"x": initX, "y":toPositionY,"rotation":Random().nextInt(360)},  Random().nextInt(2000)+3000).easing(Ease.linear.easeOut).start().onComplete((d){
      cube2.dispose();
    });

  }


}