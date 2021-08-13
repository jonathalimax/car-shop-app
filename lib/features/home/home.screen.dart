import 'package:car_shop_app/features/favorites/favorites.screen.dart';
import 'package:car_shop_app/features/profile/profile.screen.dart';
import 'package:flutter/material.dart';
import 'package:car_shop_app/features/feed/vehicle.feed.screen.dart';
import 'package:car_shop_app/wrappers/custom.colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

enum _SelectedTab { products, sales, store }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    VehicleFeedScreen(),
    FavoritesScreen(),
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
          icon: FaIcon(
            FontAwesomeIcons.carAlt,
            size: 22,
          ),
          title: Text("Veículos"),
          selectedColor: CustomColors.blue,
        ),

        SalomonBottomBarItem(
          icon: FaIcon(
            FontAwesomeIcons.solidHeart,
            size: 22,
          ),
          title: Text("Favoritos"),
          selectedColor: Colors.redAccent,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: FaIcon(
            FontAwesomeIcons.solidUserCircle,
            size: 22,
          ),
          title: Text("Perfil"),
          selectedColor: CustomColors.blue,
        ),
      ],
    );
  }
}
