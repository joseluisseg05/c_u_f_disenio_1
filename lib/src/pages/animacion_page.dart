import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionPage extends StatelessWidget {
  const AnimacionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> moverDer;
  Animation<double> escalar;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );
    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.easeOut)));

    moverDer = Tween(begin: 0.0, end: 200.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut));

    escalar = Tween(begin: 0.5, end: 3.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
      /*else if (controller.status == AnimationStatus.dismissed) {
        controller.forward();
      }*/
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
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(moverDer.value, 0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value,
              child: Transform.scale(
                scale: escalar.value,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
