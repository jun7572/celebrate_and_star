

import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/painting.dart' as painting;
import 'package:flutter/services.dart';

class Utils {
  final context;
  Utils({this.context}) :super();

  static double getWidth() {
    return  ui.window.physicalSize.width;
  }
  static double getlRatio () {
    return ui.window.devicePixelRatio;
  }
  static double getHeight() {
    return  ui.window.physicalSize.height;
  }
  static  ByteData star,circle,cube1,cube2;
  static Future init()async{
    star = await rootBundle.load("assets/images/star.png");
    circle = await rootBundle.load("assets/images/circle.png");
    cube1 = await rootBundle.load("assets/images/cube1.png");
    cube2 = await rootBundle.load("assets/images/cube2.png");
  return new Future(()=>null);
}
  static Future<ui.Image> getImageStar(int width,int height) async {
    Codec codec = await ui.instantiateImageCodec(star.buffer.asUint8List(),targetWidth: width,targetHeight: height);
    FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
  static Future<ui.Image> getImageCircle(int width,int height) async {
    Codec codec = await ui.instantiateImageCodec(circle.buffer.asUint8List(),targetWidth: width,targetHeight: height);
    FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
  static Future<ui.Image> getImageCube1(int width,int height) async {
    Codec codec = await ui.instantiateImageCodec(cube1.buffer.asUint8List(),targetWidth: width,targetHeight: height);
    FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
  static Future<ui.Image> getImageCube2(int width,int height) async {
    Codec codec = await ui.instantiateImageCodec(cube2.buffer.asUint8List(),targetWidth: width,targetHeight: height);
    FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
}
class CanvasOffset extends Offset {
  const CanvasOffset(double width, double height) : super(width, height) ;
}