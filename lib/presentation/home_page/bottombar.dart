import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/image_constant.dart';

enum BottomBarEnum {
  Home,
  Vuesaxlinearheart,
  Bag,
  User,
}

class BottomMenuModel {
  final String icon;
  final String activeIcon;
  final BottomBarEnum type;
  bool isSelected;
  Color itemColor;

  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
    this.isSelected = false,
  }) : itemColor = isSelected ? Colors.white : Colors.transparent;

  void updateColor() {
    itemColor = isSelected ? Colors.blue : Colors.transparent;
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndexx = 0;
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      activeIcon: ImageConstant.imgHome,
      type: BottomBarEnum.Home,
      isSelected: false,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgVuesaxLinearHeart,
      activeIcon: ImageConstant.imgVuesaxLinearHeart,
      type: BottomBarEnum.Vuesaxlinearheart,
      isSelected: false,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgBag,
      activeIcon: ImageConstant.imgBag,
      type: BottomBarEnum.Bag,
      isSelected: false,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUser,
      activeIcon: ImageConstant.imgUser,
      type: BottomBarEnum.User,
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar Example"),
      ),
      body: Center(
        child: Text('Selected Tab: $_currentIndexx'),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndexx,
      onTap: (index) {
        setState(() {
          _currentIndexx = index;
          for (var i = 0; i < bottomMenuList.length; i++) {
            bottomMenuList[i].isSelected = (i == index);
          }
        });
      },
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.transparent,
      items: bottomMenuList.map((item) {
        return BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color: item.isSelected ? Colors.blue : null,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              item.isSelected ? item.activeIcon : item.icon,
              width: 24,
              height: 24,
              color: item.isSelected ? Colors.black : null,
            ),
          ),
          label: '',
        );
      }).toList(),
    );
  }

  void selectItem(int index) {
    setState(() {
      _currentIndexx = index;
      for (var i = 0; i < bottomMenuList.length; i++) {
        bottomMenuList[i].isSelected = (i == index);
      }
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: MyBottomNavigationBar(),
  ));
}
