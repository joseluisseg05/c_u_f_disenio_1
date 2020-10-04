import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  SliderShow({
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.teal,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).colorPrimario =
                  this.colorPrimario;
              Provider.of<_SlideshowModel>(context).colorSecundario =
                  this.colorSecundario;

              Provider.of<_SlideshowModel>(context).bulletPrimario =
                  this.bulletPrimario;
              Provider.of<_SlideshowModel>(context).bulletSecundario =
                  this.bulletSecundario;
              return _Estructura(puntosArriba: puntosArriba, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _Estructura extends StatelessWidget {
  const _Estructura({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.puntosArriba) _Dots(this.slides.length),
        Expanded(
          child: _Sliders(this.slides),
        ),
        if (!this.puntosArriba) _Dots(this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  _Dots(this.totalSlides);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    double tam = 0.0;
    Color color;

    if (ssModel.curretPage >= index - 0.5 && ssModel.curretPage < index + 0.5) {
      tam = ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
    } else {
      tam = ssModel.bulletSecundario;
      color = ssModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      width: tam,
      height: tam,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
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
      Provider.of<_SlideshowModel>(context, listen: false).curretPage =
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

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0.0;
  Color _colorPrimario = Colors.teal;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12.0;
  double _bulletSecundario = 12.0;

  double get curretPage => this._currentPage;

  set curretPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario(Color color) {
    this._colorPrimario = color;
  }

  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color color) {
    this._colorSecundario = color;
  }

  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double tam) {
    this._bulletPrimario = tam;
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double tam) {
    this._bulletSecundario = tam;
  }
}
