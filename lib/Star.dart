import 'dart:math';

import 'package:celebrateandstar/Utils.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as UI;

class Star{
  //位置
  double positionX;
  double positionY;
  //速度
  double speedX;
  double speedY;

  int Rcolor=0;
  int Gcolor=0;
  int Bcolor=0;

  UI.Image image;
  Future  init()async{
      image = await Utils.getImageStar(50, 50);
      return new Future(()=>null);
    }
//   setTranslate(float dx,float dy)
//   preTranslate(float dx,float dy)
//   postTranslate(float dx,float dy)
//  其中pre前缀和post前缀分别对应了矩阵乘法中的右乘（前乘） 和左乘（后乘）,可能flutter没有?
//  矩阵左乘相当于行变换 矩阵右乘相当于列变换
  void paint(Canvas canvas, Size size) {

    Paint p1=Paint();
    p1.colorFilter=UI.ColorFilter.mode(UI.Color.fromARGB(255, 0, 0, 255), UI.BlendMode.srcATop);
    canvas.drawImage(image, Offset(0,0), p1);

    canvas.rotate(-pi/10);

    Paint p=Paint();



    Matrix4 matrix4 = Matrix4.translationValues(1,0, 0);
    var column = matrix4.getColumn(3);
   

    matrix4.rotateZ(pi/15);
    p.imageFilter=UI.ImageFilter.matrix(matrix4.storage);
    p.colorFilter=UI.ColorFilter.mode(UI.Color.fromARGB(255, 255, 0, 0), UI.BlendMode.srcATop);

    canvas.drawImage(image, Offset(0,0), p);

  }
}