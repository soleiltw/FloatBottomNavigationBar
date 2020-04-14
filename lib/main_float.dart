import 'dart:io';

import 'package:FloatBottomNavigationBar/pages/account.dart';
import 'package:FloatBottomNavigationBar/pages/home.dart';
import 'package:FloatBottomNavigationBar/pages/message.dart';
import 'package:FloatBottomNavigationBar/pages/search.dart';
import 'package:FloatBottomNavigationBar/widgets/float_nav_bar.dart';
import 'package:flutter/material.dart';

import 'layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> _centerPages = <Widget>[
      HomePage(),
      SearchPage(),
      MessagePage(),
      AccountPage(),
    ];

    double _bottomBarPadding = ConstLayout.PageMediumPadding;
    if (Platform.isIOS) {
      _bottomBarPadding = ConstLayout.PageLargePadding;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(children: [
        _centerPages[_selectedIndex],
        Positioned(
          left: ConstLayout.PageMediumPadding,
          right: ConstLayout.PageMediumPadding,
          bottom: _bottomBarPadding,
          child: bottomNavigationBar,
        )
      ]),
    );
  }

  Widget get bottomNavigationBar {
    const double _iconSize = 36;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_iconSize)),
      child: FloatButtonNavigationBar(
        selectIndex: _selectedIndex,
        selectedColor: Colors.blueAccent,
        unselectedColor: Colors.blueGrey[300],
        items: <FloatBottonBarButtonItem>[
          FloatBottonBarButtonItem(
            iconData: Icons.home,
          ),
          FloatBottonBarButtonItem(
            iconData: Icons.search,
          ),
          FloatBottonBarButtonItem(
            iconData: Icons.message,
          ),
          FloatBottonBarButtonItem(
            iconData: Icons.person,
          ),
        ],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
