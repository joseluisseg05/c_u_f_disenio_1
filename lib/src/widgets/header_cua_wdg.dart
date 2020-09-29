import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.teal,
    );
  }
}

class HeaderBorderRen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Colors.teal,
      child: CustomPaint(
        painter: _DiagonalPainter(),
      ),
    );
  }
}

class _DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades
    paint.color = Colors.teal;
    //paint.style = PaintingStyle.stroke; //dibuja la linea
    paint.style = PaintingStyle.fill; //rellena
    paint.strokeWidth = 5.0;

    final path = Path();
    //dibujar
    path.moveTo(0, size.height * 0.35); //mover a la mitad
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Colors.teal,
      child: CustomPaint(
        painter: _TrianguloPainter(),
      ),
    );
  }
}

class _TrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades
    paint.color = Colors.teal;
    //paint.style = PaintingStyle.stroke; //dibuja la linea
    paint.style = PaintingStyle.fill; //rellena
    paint.strokeWidth = 5.0;

    final path = Path();
    //dibujar
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Colors.teal,
      child: CustomPaint(
        painter: _PicoPainter(),
      ),
    );
  }
}

class _PicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades
    paint.color = Colors.teal;
    //paint.style = PaintingStyle.stroke; //dibuja la linea
    paint.style = PaintingStyle.fill; //rellena
    paint.strokeWidth = 5.0;

    final path = Path();
    //dibujar
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Colors.teal,
      child: CustomPaint(
        painter: _CurvoPainter(),
      ),
    );
  }
}

class _CurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades
    paint.color = Colors.teal;
    //paint.style = PaintingStyle.stroke; //dibuja la linea
    paint.style = PaintingStyle.fill; //rellena
    paint.strokeWidth = 5.0;

    final path = Path();
    //dibujar
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.5, // estas dos lineas es el punto donde realiza la curva
      size.height * 0.4,
      size.width, //estas dos lineas corresponde a donde termina la curva
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderOla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Colors.teal,
      child: CustomPaint(
        painter: _OlaPainter(),
      ),
    );
  }
}

class _OlaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades
    paint.color = Colors.teal;
    //paint.style = PaintingStyle.stroke; //dibuja la linea
    paint.style = PaintingStyle.fill; //rellena
    paint.strokeWidth = 5.0;

    final path = Path();
    //dibujar
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25, // estas dos lineas es el punto donde realiza la curva
      size.height * 0.35,
      size.width * 0.5, //estas dos lineas corresponde a donde termina la curva
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75, // estas dos lineas es el punto donde realiza la curva
      size.height * 0.15,
      size.width, //estas dos lineas corresponde a donde termina la curva
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
