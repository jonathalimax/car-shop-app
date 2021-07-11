import 'package:car_shop_app/features/profile/profile.screen.dart';
import 'package:car_shop_app/features/store/store.screen.dart';
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
    StoreScreen(),
    ProfileScreen(),
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
      bottomNavigationBar: SafeArea(child: buildBottomBar()),
    );
  }

  SalomonBottomBar buildBottomBar() {
    return SalomonBottomBar(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      currentIndex: _SelectedTab.values.indexOf(_selectedTab),
      onTap: _handleIndexChanged,
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: Icon(Icons.directions_car_outlined),
          title: Text("Veículos"),
          selectedColor: CustomColors.blue,
        ),

        SalomonBottomBarItem(
          icon: Icon(Icons.storefront_rounded),
          title: Text("Loja"),
          selectedColor: CustomColors.blue,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: Icon(Icons.account_circle_outlined),
          title: Text("Meu Perfil"),
          selectedColor: CustomColors.blue,
        ),
      ],
    );
  }
}
