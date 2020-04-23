import 'package:celebrateandstar/MyPainter.dart';
import 'package:celebrateandstar/Star.dart';
import 'package:celebrateandstar/Utils.dart';
import 'package:flutter/material.dart';
import 'package:zerker/zerker.dart';

import 'MyZkApp.dart';

void main() => runApp(MyApp());
enum StarStatus { loading, loaded }
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StarStatus status=StarStatus.loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    initData();
  }
  Star star;
  initData()async{
  await  Utils.init();
  star= Star();
  await star.init();
//  await  Utils.getImageCircle(50, 50);
//  await  Utils.getImageCube1(50, 50);
//  await  Utils.getImageCube2(50, 50);
//  setState(() {
//    status=StarStatus.loaded;
//  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          status=StarStatus.loaded;
          setState(() {

          });
        },
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
//      body: Center(
//        child: status==StarStatus.loading?Container():
//        SizedBox(
//          width: MediaQuery.of(context).size.width,
//          height: MediaQuery.of(context).size.height,
//          child: CustomPaint(
//            painter: MyPainter(star),
//          ),
//        ),
//      ),
    body:Stack(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          color: Colors.black,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: status==StarStatus.loading?Container():Zerker(app: MyZkApp(), clip: true, interactive: true),
          ),
        ),
      ],
    )

    );
  }
}
