//import 'package:app_disenios_custom/src/pages/animacion_page.dart';
//import 'package:app_disenios_custom/src/labs/circular_progress_page.dart';
//import 'package:app_disenios_custom/src/pages/graficas_circular_page.dart';
//import 'package:app_disenios_custom/src/pages/home_page.dart';
//import 'package:app_disenios_custom/src/labs/slidershow_page.dart';
//import 'package:app_disenios_custom/src/retos/cuadrado_animado_page.dart';
import 'package:app_disenios_custom/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños 1',
      home: SlideshowPage(),
    );
  }
}
