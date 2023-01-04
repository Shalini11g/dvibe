import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator ProfilePage - FRAME
    var child2;
    var positioned3 = Positioned(
        top: 0.7999992370605469, left: 22.100006103515625, child: child2);
    var positioned2 = positioned3;
    var positioned = positioned2;
    return Container(
      width: 375,
      height: 816,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 144,
              left: 456,
              child: Container(
                  width: 89,
                  height: 89,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(64),
                      topRight: Radius.circular(64),
                      bottomLeft: Radius.circular(64),
                      bottomRight: Radius.circular(64),
                    ),
                    color: const Color.fromRGBO(211, 210, 220, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(254, 254, 254, 1),
                      width: 6,
                    ),
                  ))),
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 375,
                  height: 44,
                  decoration: const BoxDecoration(),
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 16.600000381469727,
                        left: 293.5,
                        child: Container(
                            width: 68,
                            height: 13,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0.55999755859375,
                                  left: 42.5,
                                  child: Container(
                                      width: 24.5,
                                      height: 11.5,
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 0, left: 0, child: child2),
                                        Positioned(
                                            top: 1.9166667461395264,
                                            left: 2,
                                            child: Container(
                                                width: 18,
                                                height: 7.666666507720947,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        1.600000023841858),
                                                    topRight: Radius.circular(
                                                        1.600000023841858),
                                                    bottomLeft: Radius.circular(
                                                        1.600000023841858),
                                                    bottomRight:
                                                    Radius.circular(
                                                        1.600000023841858),
                                                  ),
                                                  color: Color.fromRGBO(
                                                      30, 41, 59, 1),
                                                ))),
                                      ]))),
                              Positioned(
                                  top: 1,
                                  left: 1.7763568394002505e-15,
                                  child: child2),
                              positioned,
                            ]))),
                    Positioned(
                        top: 12,
                        left: 0,
                        child: Container(
                            width: 180,
                            height: 22,
                            decoration: const BoxDecoration(),
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 2,
                                  left: 29.5,
                                  child: Text(
                                    '19:27',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(30, 41, 59, 1),
                                        fontFamily: 'SF Pro Text',
                                        fontSize: 15,
                                        letterSpacing: -0.16500000655651093,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )),
                            ]))),
                  ]))),
          Positioned(
              top: 60,
              left: 24,
              child: Container(
                  width: 327,
                  height: 48,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 11,
                        left: 119,
                        child: Text(
                          'My Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(31, 44, 55, 1),
                              fontFamily: 'Inter',
                              fontSize: 18,
                              letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.4444444444444444),
                        )),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 48,
                            height: 48,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(254, 254, 254, 1),
                                        border: Border.all(
                                          color:
                                          Color.fromRGBO(242, 242, 245, 1),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(48, 48)),
                                      ))),
                              Positioned(
                                  top: 12,
                                  left: 12,
                                  child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                                width: 24,
                                                height: 24,
                                                child: Stack(children: <Widget>[
                                                  Positioned(
                                                      top: 0,
                                                      left: 0,
                                                      child: Container(
                                                          width: 24,
                                                          height: 24,
                                                          child: Stack(
                                                              children: <
                                                                  Widget>[
                                                                Positioned(
                                                                  top: 0,
                                                                  left: 24,
                                                                  child: Transform
                                                                      .rotate(
                                                                    angle: -90 *
                                                                        (math.pi /
                                                                            180),
                                                                    //child: SvgPicture.asset(
                                                                    //'assets/images/vector.svg',
                                                                    //semanticsLabel: 'vector'
                                                                  ),
                                                                )
                                                                //),Positioned(
                                                                //top: 4.998747825622559,
                                                                //left: 7.992512226104736,
                                                                //child: SvgPicture.asset(
                                                                //'assets/images/vector.svg',
                                                                //semanticsLabel: 'vector'
                                                                //);
                                                                //),
                                                              ]))),
                                                ]))),
                                      ]))),
                            ]))),
                    Positioned(
                        top: 0,
                        left: 279,
                        child: Container(
                            width: 48,
                            height: 48,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(254, 254, 254, 1),
                                        border: Border.all(
                                          color:
                                          Color.fromRGBO(242, 242, 245, 1),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(48, 48)),
                                      ))),
                              Positioned(
                                  top: 12,
                                  left: 12,
                                  child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(),
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 2.0002999305725098,
                                            left: 2.0000998973846436,
                                            child: Container(
                                                width: 20.336606979370117,
                                                height: 20.3684024810791,
                                                child: Stack(children: <Widget>[
                                                  Positioned(
                                                      top: 0,
                                                      left: 0,
                                                      child: Container(
                                                          width:
                                                          20.336606979370117,
                                                          height:
                                                          20.3684024810791,
                                                          child: Stack(
                                                              children: <
                                                                  Widget>[
                                                                //Positioned(
                                                                //top: 0,
                                                                //left: 0,
                                                                //child: SvgPicture.asset(
                                                                //'assets/images/combinedshape.svg',
                                                                //semanticsLabel: 'combinedshape'
                                                                // );
                                                                //),
                                                              ]))),
                                                ]))),
                                      ]))),
                            ]))),
                  ]))
            // ignore: dead_code
          ),
          Positioned(
              top: 256,
              left: 24,
              child: Container(
                  width: 327,
                  height: 78,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Text(
                          'Full Name',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(156, 164, 171, 1),
                              fontFamily: 'Inter',
                              fontSize: 14,
                              letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.5714285714285714),
                        )),
                    Positioned(
                        top: 38,
                        left: 0,
                        child: Container(
                            width: 327,
                            height: 40,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Text(
                                    'Shalini Gangarapu',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(31, 44, 55, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.5),
                                  )),
                              Positioned(
                                  top: 40,
                                  left: 0,
                                  child: Divider(
                                      color: Color.fromRGBO(242, 242, 245, 1),
                                      thickness: 1)),
                            ]))),
                  ]))),
          Positioned(
              top: 350,
              left: 24,
              child: Container(
                  width: 327,
                  height: 78,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Text(
                          'Email',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(156, 164, 171, 1),
                              fontFamily: 'Inter',
                              fontSize: 14,
                              letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.5714285714285714),
                        )),
                    Positioned(
                        top: 38,
                        left: 0,
                        child: Container(
                            width: 327,
                            height: 40,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Text(
                                    'shalini@gmail.com',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(31, 44, 55, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.5),
                                  )),
                              Positioned(
                                  top: 40,
                                  left: 0,
                                  child: Divider(
                                      color: Color.fromRGBO(242, 242, 245, 1),
                                      thickness: 1)),
                            ]))),
                  ]))),
          Positioned(
              top: 444,
              left: 24,
              child: Container(
                  width: 327,
                  height: 78,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Text(
                          'Phone Number',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(156, 164, 171, 1),
                              fontFamily: 'Inter',
                              fontSize: 14,
                              letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.5714285714285714),
                        )),
                    Positioned(
                        top: 38,
                        left: 0,
                        child: Container(
                            width: 327,
                            height: 40,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Text(
                                    '071562834',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(31, 44, 55, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.5),
                                  )),
                              Positioned(
                                  top: 40,
                                  left: 0,
                                  child: Divider(
                                      color: Color.fromRGBO(242, 242, 245, 1),
                                      thickness: 1)),
                            ]))),
                  ]))),
          Positioned(
              top: 538,
              left: 24,
              child: Container(
                  width: 327,
                  height: 102,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Text(
                          'Address',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(156, 164, 171, 1),
                              fontFamily: 'Inter',
                              fontSize: 14,
                              letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.5714285714285714),
                        )),
                    Positioned(
                        top: 38,
                        left: 0,
                        child: Container(
                            width: 327,
                            height: 64,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Text(
                                    'Snappahanevagen 1 lgh 1001,Karlskrona, 37141',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(31, 44, 55, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.5),
                                  )),
                              Positioned(
                                  top: 64,
                                  left: 0,
                                  child: Divider(
                                      color: Color.fromRGBO(242, 242, 245, 1),
                                      thickness: 1)),
                            ]))),
                  ]))),
          Positioned(
            top: 147,
            left: 137,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(36, 36, 36, 1),
                  width: 1,
                ),
                //image : DecorationImage(
                //image: AssetImage('assets/images/Ellipse.png'),
                //fit: BoxFit.fitWidth
                //),
                //borderRadius : BorderRadius.all(Radius.elliptical(100, 100))

                //}
              ),
            ),
          ),
        ],
      ),
    );
  }
}