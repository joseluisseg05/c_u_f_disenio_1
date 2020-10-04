import 'package:app_disenios_custom/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  SliderShow({
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.teal,
    this.colorSecundario = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (this.puntosArriba)
                _Dots(this.slides.length, colorPrimario, colorSecundario),
              Expanded(
                child: _Sliders(this.slides),
              ),
              if (!this.puntosArriba)
                _Dots(this.slides.length, colorPrimario, colorSecundario),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  final Color colorPrimario;
  final Color colorSecundario;

  _Dots(this.totalSlides, this.colorPrimario, this.colorSecundario);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides,
            (index) => _Dot(index, colorPrimario, colorSecundario)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color colorPrimario;
  final Color colorSecundario;

  _Dot(this.index, this.colorPrimario, this.colorSecundario);

  @override
  Widget build(BuildContext context) {
    final pageIndex = Provider.of<SliderModel>(context).curretPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      width: 12.0,
      height: 12.0,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageIndex >= index - 0.5 && pageIndex < index + 0.5)
            ? colorPrimario
            : colorSecundario,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Sliders extends StatefulWidget {
  final List<Widget> slides;

  _Sliders(this.slides);
  @override
  __SlidersState createState() => __SlidersState();
}

class __SlidersState extends State<_Sliders> {
  final pageVcontroller = PageController();

  @override
  void initState() {
    super.initState();
    pageVcontroller.addListener(() {
      //print('pagina ${pageVcontroller.page}');
      //actualizar el provider
      Provider.of<SliderModel>(context, listen: false).curretPage =
          pageVcontroller.page;
    });
  }

  @override
  void dispose() {
    pageVcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
      controller: pageVcontroller,
      /*children: [
        _Slider('assets/svgs/1.svg'),
        _Slider('assets/svgs/2.svg'),
        _Slider('assets/svgs/3.svg'),
      ],*/
      children: widget.slides.map((slide) => _Slider(slide)).toList(),
    ));
  }
}

class _Slider extends StatelessWidget {
  final Widget slide;

  _Slider(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}
