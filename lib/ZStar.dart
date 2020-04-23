import 'dart:math';
import 'dart:ui' as UI;
import 'dart:ui';

import 'package:zerker/zerker.dart';

class ZStar  {
  ZKImage star;
  double rotate;
  double toPositionY;

  int Rcolor=0;
  int Gcolor=0;
  int Bcolor=0;

  ZStar(double initX,double toPositionY,double windowX){
    Rcolor=Random().nextInt(255);
    Gcolor=Random().nextInt(255);
    Bcolor=Random().nextInt(255);

    this.toPositionY=toPositionY;
    rotate=(Random().nextInt(80)+20).toDouble()/100;
    rotate=1;
    var paint = new Paint();
    var nextDouble = Random().nextInt(50).toDouble()/100;
    paint.colorFilter=UI.ColorFilter.mode(UI.Color.fromARGB(255, Rcolor, Gcolor, Bcolor), UI.BlendMode.srcATop);
    star = ZKImage("star");
    star.setPosition(initX, -Random().nextDouble()*1000);
    star.setScale(0.2);
    star.rotation=0.5;
    star.paint=paint;
    ZKTween(star).to({"x": Random().nextInt(windowX.toInt()), "y":toPositionY,"rotation":Random().nextInt(200)+160},  Random().nextInt(2000)+3000).easing(Ease.linear.easeOut).start().onComplete((d){
      star.dispose();
    });

  }


}