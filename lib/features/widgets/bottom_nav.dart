// ignore_for_file: prefer_final_fields

import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/Account/account_screen.dart';
import 'package:flutter_node_auth/features/Chart/chart.dart';
import 'package:flutter_node_auth/features/news/news.dart';
import 'package:flutter_node_auth/features/portfolio/Widget/portfolio.dart';
import 'package:flutter_node_auth/features/watchlist/screens/watchlist.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  List<Widget> pages = const [
    WatchList(),
    Charting(),
    PortFolio(),
    NewsSection(),
    AccountScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: pages[_currentIndex]),
        bottomNavigationBar: Container(
          color: Colors.blue,
          child: FluidNavBar(
            onChange: (selectedIndex) {
              setState(() {
                  _currentIndex =selectedIndex;
              });
            },defaultIndex: _currentIndex,
            style: FluidNavBarStyle(iconSelectedForegroundColor: Colors.blue, 
            iconUnselectedForegroundColor: Colors.black),animationFactor:0.9,
            icons:[
            FluidNavBarIcon(svgPath: 'assets/navbar/home.svg',),
            FluidNavBarIcon(svgPath: 'assets/navbar/chart.svg'),
            FluidNavBarIcon(svgPath: 'assets/navbar/portfolio.svg'),
            FluidNavBarIcon(svgPath: 'assets/navbar/news.svg'),
            FluidNavBarIcon(svgPath: 'assets/navbar/account.svg'),
          ] ),
        ),
);
 
  }
}
