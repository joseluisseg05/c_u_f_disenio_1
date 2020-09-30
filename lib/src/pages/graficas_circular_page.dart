import 'package:app_disenios_custom/src/widgets/radial_progess.dart';
import 'package:flutter/material.dart';

class GraficasCircularPage extends StatefulWidget {
  @override
  _GraficasCircularPageState createState() => _GraficasCircularPageState();
}

class _GraficasCircularPageState extends State<GraficasCircularPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.blue,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.cyan,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.deepPurple,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.green,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final double porcentaje;
  final Color color;

  CustomRadialProgress({@required this.porcentaje, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      child: RadiaProgess(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecun: Colors.grey,
        grosorFond: 20.0,
        grosorRell: 15.0,
      ),
    );
  }
}
