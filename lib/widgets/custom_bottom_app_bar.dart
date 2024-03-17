import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgHome,
        activeIcon: ImageConstant.imgHome,
        type: BottomBarEnum.Home,
        isSelected: true),
    BottomMenuModel(
      icon: ImageConstant.imgVuesaxLinearHeart,
      activeIcon: ImageConstant.imgVuesaxLinearHeart,
      type: BottomBarEnum.Vuesaxlinearheart,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgBag,
      activeIcon: ImageConstant.imgBag,
      type: BottomBarEnum.Bag,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUser,
      activeIcon: ImageConstant.imgUser,
      type: BottomBarEnum.User,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(15.h),
      ),
      child: Text(''),
    );
  }
}


// _Widget bottomAppBar(){
//   return BottomAppBar(
//     shape: CircularNotchedRectangle(),
//     color: theme.colorScheme.onPrimary.withOpacity(1),
//     child: SizedBox(
//       height: 22.v,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: List.generate(
//           bottomMenuList.length,
//               (index) {
//             return InkWell(
//               onTap: () {
//                 for (var element in bottomMenuList) {
//                   element.isSelected = false;
//                 }
//                 bottomMenuList[index].isSelected = true;
//                 widget.onChanged?.call(bottomMenuList[index].type);
//                 setState(() {});
//               },
//               child: bottomMenuList[index].isSelected
//                   ? Container(
//                 decoration: AppDecoration.fillPrimary.copyWith(
//                   borderRadius: BorderRadiusStyle.roundedBorder20,
//                 ),
//                 child: CustomImageView(
//                   imagePath: bottomMenuList[index].activeIcon,
//                   height: 22.adaptSize,
//                   width: 22.adaptSize,
//                   color: theme.colorScheme.onPrimary.withOpacity(1),
//                   margin: EdgeInsets.only(
//                     top: 10.v,
//                     bottom: 9.v,
//                   ),
//                 ),
//               )
//                   : CustomImageView(
//                 imagePath: bottomMenuList[index].icon,
//                 height: 22.adaptSize,
//                 width: 22.adaptSize,
//                 color: theme.colorScheme.primary,
//               ),
//             );
//           },
//         ),
//       ),
//     ),
//   );
// }



enum BottomBarEnum {
  Home,
  Vuesaxlinearheart,
  Bag,
  User,
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
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
