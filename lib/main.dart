import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]).then((_) {
      runApp(MyApp());
    }).catchError((error) {
      print(error);
    });

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parallax',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _topZero = 0;
  double _topOne = 0;
  double _topTwo = 0;
  double _topThree = 0;
  double _topFour = 0;
  double _topFive = 0;
  double _topSix = 0;
  double _topSeven = 0;
  double _topEight = 90;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
          onNotification: (v) {
            if (v is ScrollUpdateNotification) {
              setState(() {
                _topEight -= v.scrollDelta / 1;
                _topSeven -= v.scrollDelta / 1.5;
                _topSix -= v.scrollDelta / 2;
                _topFive -= v.scrollDelta / 2.5;
                _topFour -= v.scrollDelta / 3;
                _topThree -= v.scrollDelta / 3.5;
                _topTwo -= v.scrollDelta / 4;
                _topOne -= v.scrollDelta / 4.5;
                _topZero -= v.scrollDelta / 5;
              });
            }
          },
          child: Stack(
            children: <Widget>[
              ParallaxItem(asset: 'parallax0', top: _topZero),
              ParallaxItem(asset: 'parallax1', top: _topOne),
              ParallaxItem(asset: 'parallax2', top: _topTwo),
              ParallaxItem(asset: 'parallax3', top: _topThree),
              ParallaxItem(asset: 'parallax4', top: _topFour),
              ParallaxItem(asset: 'parallax5', top: _topFive),
              ParallaxItem(asset: 'parallax6', top: _topSix),
              ParallaxItem(asset: 'parallax7', top: _topSeven),
              ParallaxItem(asset: 'parallax8', top: _topEight),
              ListView(
                children: <Widget>[
                  Container(
                    height: 600,
                    color: Colors.transparent,
                  ),
                  Container(
                    color: Color(0xff210002),
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Parallax In',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Montserrt-Etralight',
                            letterSpacing: 1.8,
                            color: Color(0xffffaf00),
                          ),
                        ),
                        Text(
                          'Flutter',
                          style: TextStyle(
                            fontSize: 51,
                            fontFamily: 'Montserrat-Regular',
                            letterSpacing: 1.8,
                            color: Color(0xffffaf00),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 190,
                          child: Divider(
                            height: 1,
                            color: Color(0xffffaf00),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Made By',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrt-Etralight',
                            letterSpacing: 1.3,
                            color: Color(0xffffaf00),
                          ),
                        ),
                        Text(
                          '轻剑快马🐎',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Montserrt-Etralight',
                            letterSpacing: 1.8,
                            color: Color(0xffffaf00),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}

class ParallaxItem extends StatelessWidget {
  const ParallaxItem({
    Key key,
    @required this.asset,
    @required this.top,
  }) : super(key: key);

  final String asset;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: -45,
      child: Container(
        width: 900,
        height: 550,
        child: Image.asset(
          'assets/images/$asset.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
