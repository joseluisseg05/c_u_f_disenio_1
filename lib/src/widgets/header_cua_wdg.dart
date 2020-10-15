import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class HeaderOlaGradi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Colors.teal,
      child: CustomPaint(
        painter: _OlaGradiPainter(),
      ),
    );
  }
}

class _OlaGradiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: Offset(0.0, 120.0),
      radius: 200,
    );

    final Gradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.teal[100],
          Colors.teal,
          Colors.teal[700],
        ]);

    final paint = Paint()..shader = gradient.createShader(rect);
    //propiedades
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

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;
  final Color primario;

  IconHeader({
    @required this.icon,
    @required this.titulo,
    @required this.subtitulo,
    @required this.primario,
    this.color1 = Colors.teal,
    this.color2 = Colors.cyan,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = this.primario.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBackground(color1: this.color1, color2: this.color2),
        Positioned(
          top: -50.0,
          left: -70.0,
          child: FaIcon(
            this.icon,
            size: 250.0,
            color: this.primario.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            SizedBox(height: 80.0, width: double.infinity),
            Text(
              this.subtitulo,
              style: TextStyle(fontSize: 20.0, color: color),
            ),
            SizedBox(height: 20.0),
            Text(
              this.titulo,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            FaIcon(
              this.icon,
              size: 80.0,
              color: this.primario,
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  _IconHeaderBackground({
    Key key,
    @required this.color1,
    @required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            this.color1,
            this.color2,
          ],
        ),
      ),
    );
  }
}
