import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  double porcentaje = 0.0;
  double auxPorc = 0.0;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener(() {
      //print('valor controller ${controller.value}');

      setState(() {
        porcentaje = lerpDouble(porcentaje, auxPorc, controller.value);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 30.0),
        onPressed: () {
          porcentaje = auxPorc;
          auxPorc += 10;
          if (auxPorc > 100) {
            auxPorc = 0;
            porcentaje = 0;
          }
          controller.forward(from: 0.0);
          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300,
          height: 300,
          //color: Colors.teal,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset centro = Offset(size.width * 0.5, size.height / 2);
    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(centro, radio, paint);

    //relleno
    final paintAr = Paint()
      ..strokeWidth = 10
      ..color = Colors.teal
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle(center: centro, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      paintAr,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
