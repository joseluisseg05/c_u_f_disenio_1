import 'dart:math';

import 'package:flutter/material.dart';

class RadiaProgess extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecun;
  final double grosorFond;
  final double grosorRell;

  RadiaProgess({
    @required this.porcentaje,
    this.colorPrimario = Colors.red,
    this.colorSecun = Colors.grey,
    this.grosorFond = 4,
    this.grosorRell = 10,
  });

  @override
  _RadiaProgessState createState() => _RadiaProgessState();
}

class _RadiaProgessState extends State<RadiaProgess>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double porcentajeAnte;

  @override
  void initState() {
    porcentajeAnte = widget.porcentaje;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferencia = widget.porcentaje - porcentajeAnte;
    porcentajeAnte = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      //child: child,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              ((widget.porcentaje - diferencia) +
                  (diferencia * controller.value)),
              widget.colorPrimario,
              widget.colorSecun,
              widget.grosorFond,
              widget.grosorRell,
            ),
          ),
        );
      },
    );
/*
    */
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorP;
  final Color colorS;
  final double grosorF;
  final double grosorR;

  _MiRadialProgress(
      this.porcentaje, this.colorP, this.colorS, this.grosorF, this.grosorR);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = grosorF
      ..color = colorS
      ..style = PaintingStyle.stroke;

    final Offset centro = Offset(size.width * 0.5, size.height / 2);
    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(centro, radio, paint);

    //relleno
    final paintAr = Paint()
      ..strokeWidth = grosorR
      ..color = colorP
      ..strokeCap = StrokeCap.round
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
