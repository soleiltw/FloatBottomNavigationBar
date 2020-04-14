import 'package:flutter/material.dart';

import '../layout.dart';

class FloatButtonNavigationBar extends StatelessWidget {
  final List<FloatBottonBarButtonItem> items;
  final FloatBottonBarTapCallback onTap;
  final int selectIndex;
  final Color selectedColor;
  final Color unselectedColor;
  const FloatButtonNavigationBar(
      {Key key,
      this.items,
      this.onTap,
      this.selectIndex,
      this.selectedColor,
      this.unselectedColor})
      : super(key: key);

  Widget build(BuildContext context) {
    const double _iconSize = 44;
    int index = 0;
    List<FloatBottonBarButton> _buttons = List();
    for (final _buttonItem in this.items) {
      _buttons.add(FloatBottonBarButton(
        color: (index == this.selectIndex)
            ? this.selectedColor
            : this.unselectedColor,
        tapCallBack: (selectIndex) {
          if (this.onTap != null) {
            this.onTap(selectIndex);
          }
        },
        index: index,
        iconData: _buttonItem.iconData,
      ));

      index++;
    }

    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(_iconSize)),
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buttons,
              ),
            )));
  }
}

typedef void FloatBottonBarTapCallback(int selectIndex);

class FloatBottonBarButtonItem {
  final IconData iconData;

  FloatBottonBarButtonItem({this.iconData});
}

class FloatBottonBarButton extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final Color color;
  final int index;
  final FloatBottonBarTapCallback tapCallBack;

  const FloatBottonBarButton(
      {Key key,
      this.iconData,
      this.iconSize,
      this.index,
      this.color,
      this.tapCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _homeButton = InkWell(
      onTap: () {
        if (tapCallBack != null) {
          tapCallBack(index);
        }
      },
      child: Container(
        padding: EdgeInsets.all(ConstLayout.PagePadding),
        child: Icon(
          this.iconData,
          color: this.color,
          size: (this.iconSize != null) ? this.iconSize : 36,
        ),
      ),
    );
    return _homeButton;
  }
}
