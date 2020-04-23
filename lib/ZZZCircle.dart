import 'dart:math';
import 'dart:ui' as UI;
import 'dart:ui';

import 'package:zerker/zerker.dart';

class ZZZCircle  {
  ZKImage circle;
  double rotate;
  double toPositionY;

  int Rcolor=0;
  int Gcolor=0;
  int Bcolor=0;

  ZZZCircle(double initX,double toPositionY,double windowX){
    Rcolor=Random().nextInt(255);
    Gcolor=Random().nextInt(255);
    Bcolor=Random().nextInt(255);
    this.toPositionY=toPositionY;
    rotate=(Random().nextInt(80)+20).toDouble()/100;
    rotate=1;
    var paint = new Paint();
    var nextDouble = Random().nextInt(50).toDouble()/100;
    paint.colorFilter=UI.ColorFilter.mode(UI.Color.fromARGB(255, Rcolor, Gcolor, Bcolor), UI.BlendMode.srcATop);
    circle = ZKImage("circle");
    circle.setPosition(initX,-Random().nextDouble()*1000);
    circle.setScale(0.3);
    circle.rotation=0.5;
    circle.paint=paint;
    ZKTween(circle).to({"x": Random().nextInt(initX.toInt())+initX, "y":toPositionY,"rotation":Random().nextInt(360)},  Random().nextInt(2000)+3000).easing(Ease.linear.easeOut).start().onComplete((d){
      circle.dispose();
    });

  }


}