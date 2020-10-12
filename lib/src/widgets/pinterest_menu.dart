import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.icon, @required this.onPressed});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  /*
  final List<PinterestButton> items = [
    PinterestButton(
      icon: Icons.pie_chart,
      onPressed: () {
        print('pie_chrt');
      },
    ),
    PinterestButton(
      icon: Icons.search,
      onPressed: () {
        print('search');
      },
    ),
    PinterestButton(
      icon: Icons.notifications,
      onPressed: () {
        print('notifications');
      },
    ),
    PinterestButton(
      icon: Icons.supervised_user_circle,
      onPressed: () {
        print('supervised_user_circle');
      },
    )
  ];
  */
  PinterestMenu({
    this.mostrar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.teal,
    this.inactiveColor = Colors.blueGrey,
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        opacity: (mostrar) ? 1 : 0,
        duration: Duration(milliseconds: 300),
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor =
                this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
            return _PinterestMenuBackground(
              child: _MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  _PinterestMenuBackground({@required this.child});
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          )
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSelect = Provider.of<_MenuModel>(context).itemSelect;

    Color activeColor = Provider.of<_MenuModel>(context).activeColor;
    Color inactiveColor = Provider.of<_MenuModel>(context).inactiveColor;
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelect = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSelect == index) ? 35 : 25,
          color: (itemSelect == index) ? activeColor : inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelect = 0;

  Color backgroundColor = Colors.white;
  Color activeColor = Colors.teal;
  Color inactiveColor = Colors.blueGrey;

  int get itemSelect => this._itemSelect;
  set itemSelect(int index) {
    this._itemSelect = index;
    notifyListeners();
  }
}
