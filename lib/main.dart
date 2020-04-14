import 'package:FloatBottomNavigationBar/pages/account.dart';
import 'package:FloatBottomNavigationBar/pages/home.dart';
import 'package:FloatBottomNavigationBar/pages/message.dart';
import 'package:FloatBottomNavigationBar/pages/search.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _centerPages[_selectedIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get bottomNavigationBar {
    const double _iconSize = 36;
    Widget _emptyText = Container(
      width: 0,
      height: 0,
    );
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_iconSize)),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: _emptyText),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              title: _emptyText),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
              ),
              title: _emptyText),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: _emptyText),
        ],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        iconSize: _iconSize,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
