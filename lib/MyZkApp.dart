import 'dart:math';

import 'package:celebrateandstar/ZCube1.dart';
import 'package:celebrateandstar/ZZCube2.dart';
import 'package:flutter/material.dart';
import 'package:zerker/zerker.dart';
import 'dart:ui' as UI;

import 'ZStar.dart';
import 'ZZZCircle.dart';
class MyZkApp extends ZKApp{
  ZKScene _scene;
  bool _loaded=false;
  int startRotate=0;
  ZKContainer  _container = ZKContainer();

  @override
  init() {
    stage.color = Color(0x66666666);
    _preload();


  }
  void _preload() {
    Map<String, dynamic> urls = {
      "circle": "images/circle.png",
      "cube1": "images/cube1.png",
      "star": "images/star.png",
      "cube2": "images/cube2.png",
      "star_light": "images/star_light.png",

    };

    ZKAssets.preload(
        baseUrl: "assets/",
        urls: urls,
        onProgress: (scale) {
          print("Assets loading ${scale * 100}%");
        },
        onLoad: () {
          _initScene();
          _loaded=true;
          print("Assets load Complete");
        });
  }


  ZKScene zKScene;
  _initScene(){
    zKScene= new ZKScene();
//    stage.addChild();
    for(int i=0;i<50;i++){
      gen();
    }
    stage.addChild(zKScene);
    var paint = new Paint();



    paint.colorFilter=UI.ColorFilter.mode(UI.Color.fromARGB(255,255, 255, 0), UI.BlendMode.modulate);

    ZKImage star_light=ZKImage("star_light");
    star_light.paint=paint;
    star_light.setScale(0.8);
    star_light.setPosition(size.width/2, size.height-100);
    ZKTween(star_light).to({"x":size.width/2,"y":size.height-150,"rotation":360},2000).easing(Ease.back.easeInOut).chain(
        ZKTween(star_light).to({"x":size.width-50,"y":50,"rotation":360,"scaleX":0.3,"scaleY":0.3},1000).easing(Ease.back.easeInOut).onComplete((d){
          //执行星星的炸裂效果
            for(int i=0;i<20;i++){
              ZKImage star_light1=ZKImage("star_light");
              star_light1.paint=paint;
              star_light1.setScale((Random().nextInt(15)+20)/100);
              star_light1.setPosition(size.width-50, 50);
              ZKTween(star_light1).to({"x":size.width-50+Random().nextInt(100)-50,"y":50+Random().nextInt(100)-50,"rotation":360,"scaleX":0,"scaleY":0},1000).easing(Ease.linear.easeIn).start().onComplete((d){
                star_light1.dispose();

              });
              stage.addChild(star_light1);
            }
        })

    ).start();
//    ZKTween(star_light).to({"x":size.width,"y":0})
    stage.addChild(star_light);




  }

  @override
  update(int time) {
    if (!_loaded) return;

//    for(int i=0;i<50;i++){
//     if(zKScene.getChild(i).position.y>=size.height.toInt()){
//       zKScene.removeChild(zKScene.getChild(i));
//     }
//
//
//    }
    super.update(time);
  }
  gen(){
    var nextInt = Random().nextInt(4);

    if(nextInt==1){
      zKScene.addChild(ZStar(Random().nextDouble()*size.width,size.height,size.width).star);
    }
    if(nextInt==2){
      zKScene.addChild(ZZZCircle(Random().nextDouble()*size.width,size.height,size.width).circle);
    }
    if(nextInt==3){
      zKScene.addChild(ZCube1(Random().nextDouble()*size.width,size.height,size.width).cube1);
    }
    if(nextInt==0){
      zKScene.addChild(ZZCube2(Random().nextDouble()*size.width,size.height,size.width).cube2);
    }

  }
  @override
  void dispose() {
    super.dispose();

    ZKBus.off("SHOW");
  }
}