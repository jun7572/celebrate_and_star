import 'dart:math';
import 'dart:ui' as UI;
import 'dart:ui';

import 'package:zerker/zerker.dart';

class ZCube1  {
  ZKImage cube1;
  double rotate;
  double toPositionY;

  int Rcolor=0;
  int Gcolor=0;
  int Bcolor=0;

  ZCube1(double initX,double toPositionY,double windowX){
    Rcolor=Random().nextInt(255);
    Gcolor=Random().nextInt(255);
    Bcolor=Random().nextInt(255);

    this.toPositionY=toPositionY;
    rotate=(Random().nextInt(80)+20).toDouble()/100;
    rotate=1;
    var paint = new Paint();
    var nextDouble = Random().nextInt(50).toDouble()/100;
    paint.colorFilter=UI.ColorFilter.mode(UI.Color.fromARGB(255,Rcolor, Gcolor, Bcolor), UI.BlendMode.srcATop);
    cube1 = ZKImage("cube1");
    cube1.setPosition(0, -Random().nextDouble()*1000);
    cube1.setScale(0.5);
    cube1.rotation=0.5;
    cube1.paint=paint;
    ZKTween(cube1).to({"x": initX, "y":toPositionY,"rotation":Random().nextInt(360)}, Random().nextInt(2000)+3000).easing(Ease.linear.easeOut).start().onComplete((d){
      cube1.dispose();
    });

  }


}