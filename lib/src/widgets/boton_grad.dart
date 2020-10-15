import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGradiente extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color primario;
  final Color color1;
  final Color color2;
  final Function onPress;

  BotonGradiente({
    @required this.icon,
    @required this.texto,
    @required this.primario,
    @required this.onPress,
    this.color1 = Colors.cyan,
    this.color2 = Colors.teal,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPress,
      child: Stack(
        children: [
          _BotonGradibackground(
            icon: this.icon,
            color1: this.color1,
            color2: this.color2,
            primario: this.primario,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140.0, width: 40.0),
              FaIcon(
                this.icon,
                size: 40.0,
                color: this.primario,
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Text(
                  this.texto,
                  style: TextStyle(
                    color: this.primario,
                    fontSize: 18,
                  ),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                size: 25.0,
                color: this.primario,
              ),
              SizedBox(width: 40.0),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGradibackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;
  final Color primario;

  _BotonGradibackground({
    Key key,
    this.color1,
    this.color2,
    this.icon,
    this.primario,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.teal,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(4, 6),
            blurRadius: 10.0,
          )
        ],
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: [
            this.color1,
            this.color2,
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                this.icon,
                size: 150.0,
                color: this.primario.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
