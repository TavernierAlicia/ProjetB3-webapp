import 'package:flutter/material.dart';
import 'package:projet_b3/pages/page_account.dart';
import 'package:projet_b3/pages/page_bars.dart';
import 'package:projet_b3/pages/page_favorites.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int   _selectedPageIndex = 0 ;
  final _pagesList = [
    PageBars(),
    PageFavorites(),
    PageAccount(),
  ] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pagesList[_selectedPageIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  /// Generates our Bottom Navigation Bar.
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedPageIndex,
      items: [
        _bottomNavigationBarItem(Icons.list, "Bars"),
        _bottomNavigationBarItem(Icons.favorite, "Favorites"),
        _bottomNavigationBarItem(Icons.account_circle, "Account"),
      ],
      onTap: ((index) { _switchPage(index); }),
    );
  }

  /// Generate a BottomNavigationBarItem, given an IconData and a String.
  BottomNavigationBarItem _bottomNavigationBarItem(IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(title),
    );
  }

  /// When the user switch to another page, this is triggered to change the
  /// selectedPageIndex.
  void _switchPage(int index) {
    setState(() {
      _selectedPageIndex = index ;
    });
  }
}