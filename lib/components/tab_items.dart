import 'package:flutter/material.dart';
import 'package:traffic_weather/screens/seven_days.dart';
import 'package:traffic_weather/screens/today.dart';
import 'package:traffic_weather/screens/tomorrow.dart';

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: Today(),
          icon: Icon(Icons.home),
          title: "AZI",
        ),
        TabNavigationItem(
          page: Tomorrow(),
          icon: Icon(Icons.agriculture),
          title: "MÂINE",
        ),
        TabNavigationItem(
          page: SevenDays(),
          icon: Icon(Icons.calendar_today),
          title: "7 ZILE",
        ),
      ];
}
