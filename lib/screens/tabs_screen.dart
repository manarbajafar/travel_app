import 'package:flutter/material.dart';
import 'package:travel/models/trip.dart';
import 'package:travel/widgets/app_drawer.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;

  const TabsScreen(this.favoriteTrips);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  List<Map<String, Object>> _screens;

  @override
  void initState() {
    // TODO: implement initState
    _screens = [
      {'screen': CategoriesScreen(), 'title': 'تصنيفات الرحلات'},
      {
        'screen': FavoritesScreen(widget.favoriteTrips),
        'title': 'الرحلات المفضلة'
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}

// tob bar
/*

class TabsScreen extends StatelessWidget {
  // const TabsScreen ({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('دليل سياحي'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.dashboard),
              text: 'التصنيفات',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'المفضلة',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
*/