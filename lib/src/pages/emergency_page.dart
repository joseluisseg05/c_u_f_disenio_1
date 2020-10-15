import 'package:animate_do/animate_do.dart';
import 'package:app_disenios_custom/src/widgets/boton_grad.dart';
import 'package:app_disenios_custom/src/widgets/header_cua_wdg.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:animate_do/animate_do.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    //Mapear de la lista las propiedades del boton
    List<Widget> itemMap = items
        .map(
          (item) => FadeInLeftBig(
            duration: Duration(milliseconds: 800),
            child: BotonGradiente(
              icon: item.icon,
              texto: item.texto,
              color1: item.color1,
              color2: item.color2,
              primario: Colors.white,
              onPress: () {
                print('CLick');
              },
            ),
          ),
        )
        .toList();

    return Scaffold(
      //body: PageHeader(),

      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 50.0),
                ...itemMap, //agregar la lista
              ],
            ),
          ),
          _Encabezado()
        ],
      ),
    );
  }
}

class _Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia Medica',
          subtitulo: 'Haz Solicitado',
          primario: Colors.white,
        ),
        Positioned(
          right: -10,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.0),
            child: FaIcon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class Boton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotonGradiente(
      icon: FontAwesomeIcons.carCrash,
      texto: 'Este es un texto',
      primario: Colors.white,
      onPress: () {
        print('Click');
      },
    );
  }
}

class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plusCircle,
      titulo: 'Asistencia Medica',
      subtitulo: 'Haz Solicitado',
      primario: Colors.white,
      color1: Colors.teal[800],
      color2: Colors.teal,
    );
  }
}
