import 'package:flutter_svg/svg.dart';
import '../../widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import '../home_page/home_page.dart';


class PaymentSucessScreen extends StatefulWidget {
  const PaymentSucessScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<PaymentSucessScreen> createState() => _PaymentSucessScreenState();
}

class _PaymentSucessScreenState extends State<PaymentSucessScreen> {

  int selectedChipIndex = 0;
  int _currentIndexx = 0;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: buildBottomNavigationBar(),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 142.adaptSize,
                width: 142.adaptSize,
                padding: EdgeInsets.symmetric(
                  horizontal: 41.h,
                  vertical: 43.v,
                ),
                decoration: AppDecoration.fillGreen.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder71,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgVectorOnprimary51x58,
                  height: 51.v,
                  width: 58.h,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              SizedBox(height: 29.v),
              SizedBox(
                width: 281.h,
                child: Text(
                  "Payment successfully \ncompleted",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.headlineMediumMedium,
                ),
              ),
              SizedBox(height: 37.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowLeftPrimary16x16,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(bottom: 2.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(selectedIndex: 2,),
                          ),
                        );
                      },
                      child: Text(
                        "View Booking ",
                        style: CustomTextStyles.titleSmall15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndexx,
      onTap: (index) {
        // Use a switch statement to navigate to different pages based on the index
        switch (index) {
          case 0:
          case 1:
          case 2:
          case 3:
          // Navigate to the Home page with the selected index
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(selectedIndex: _currentIndexx),
              ),
            );
            setState(() {

            });
            break;

        // Add more cases for other pages if needed
        }

        // Update the selected index
        selectItem(index);
      },

      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.transparent,
      items: bottomMenuList.map((item) {
        return BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color: item.isSelected ? Color(0xff003B95) : null,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              item.isSelected ? item.activeIcon : item.icon,
              width: 24,
              height: 24,
              color: item.isSelected ? Colors.white : null,
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



}


class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
    this.isSelected = false,
  });

  String icon;
  String activeIcon;
  BottomBarEnum type;
  bool isSelected;
  Color itemColor = Colors.transparent; // Add a color property

  // Update the color property based on selection
  void updateColor() {
    itemColor = isSelected ? Colors.blue : Colors.transparent;
  }
}