import 'package:flutter/material.dart';
import 'package:traffic_weather/components/tab_items.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(title: Text("Test")),
            body: IndexedStack(
              index: _currentIndex,
              children: [
                for (final tabItem in TabNavigationItem.items) tabItem.page,
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (int index) => setState(() => _currentIndex = index),
              items: [
                for (final tabItem in TabNavigationItem.items)
                  BottomNavigationBarItem(
                    icon: tabItem.icon,
                    label: tabItem.title,
                  )
              ],
            )),
        onWillPop: () async => false);
  }
}
