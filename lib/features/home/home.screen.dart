import 'package:flutter/material.dart';
import 'package:car_shop_app/features/feed/vehicle.feed.screen.dart';
import 'package:car_shop_app/classes/custom.colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

enum _SelectedTab { products, sales, store }

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    VehicleFeedScreen(),
    VehicleFeedScreen(),
    VehicleFeedScreen()
  ];

  var _selectedTab = _SelectedTab.products;

  void _onPageChanged(int index) {
    setState(() {
      _selectedTab = _SelectedTab.values[index];
    });
  }

  void _handleIndexChanged(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  SalomonBottomBar buildBottomBar() {
    return SalomonBottomBar(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 15),
      currentIndex: _SelectedTab.values.indexOf(_selectedTab),
      onTap: _handleIndexChanged,
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: Icon(Icons.car_rental),
          title: Text("Veículos"),
          selectedColor: CustomColors.darkPurple,
        ),

        SalomonBottomBarItem(
          icon: Icon(Icons.store_mall_directory_rounded),
          title: Text("Loja"),
          selectedColor: CustomColors.darkPurple,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: Icon(Icons.account_circle),
          title: Text("Meu Perfil"),
          selectedColor: CustomColors.darkPurple,
        ),
      ],
    );
  }
}
