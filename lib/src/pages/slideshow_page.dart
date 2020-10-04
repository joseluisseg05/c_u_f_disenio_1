import 'package:app_disenios_custom/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderShow(
        //puntosArriba: true,
        bulletPrimario: 25.0,
        bulletSecundario: 15.0,
        colorPrimario: Colors.cyan,
        slides: [
          SvgPicture.asset('assets/svgs/1.svg'),
          SvgPicture.asset('assets/svgs/2.svg'),
          SvgPicture.asset('assets/svgs/3.svg'),
          SvgPicture.asset('assets/svgs/4.svg'),
          SvgPicture.asset('assets/svgs/5.svg'),
        ],
      ),
    );
  }
}
