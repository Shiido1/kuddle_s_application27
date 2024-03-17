import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/favorite_five_screen/favorite_five_screen.dart';
import 'package:kuddle_s_application27/presentation/favorite_one_screen/favorite_one_screen.dart';
import 'package:kuddle_s_application27/presentation/favorite_page/favourite_single.dart';
import 'package:kuddle_s_application27/presentation/last_book_complete_page/last_book_complete_page.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_trailing_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import '../../models/favourites.dart';
import '../favorite_four_screen/favorite_four_screen.dart';
import '../favorite_page/widgets/favorite_item_widget.dart';
import '../favorite_three_screen/favorite_three_screen.dart';
import '../favorite_two_screen/favorite_two_screen.dart';

class FavoritePageTab extends StatefulWidget {
  const FavoritePageTab({Key? key}) : super(key: key);

  static const List<int> numbers = [1, 2, 3, 4, 5];

  @override
  State<FavoritePageTab> createState() => _FavoritePageTabState();
}




class _FavoritePageTabState extends State<FavoritePageTab> {

  @override
  void initState() {
    super.initState();
    initializeFavorites();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Navigator.of(context).canPop()) {
      // Trigger the refresh when returning from another page
      initializeFavorites();
    }

    // Call the method to show the list when dependencies change
    initializeFavorites();
  }

  Future<void> initializeFavorites() async {
    try {
      var favoritesList = await getFavoritesList();
      print('Favorites List: $favoritesList');
    } catch (e) {
      print('Error getting favorites list: $e');
    }
  }

  Future<List<Favorite>> getFavoritesList() async {
    var favoritesBox = await Hive.openBox<Favorite>('favoritesBox');
    return favoritesBox.values.toList();
  }


  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Builder(
        builder: (BuildContext builderContext) {
          return SafeArea(
            child: Scaffold(
              appBar: _buildAppBar(builderContext),
              body:  FavoritePageTab.numbers.length > 8 ? TabBarView(
                children: [
                  _buildGridViewTab(builderContext),
              FavouriteSingle()
                ],
              ) : Center(child: Text('No favourites yet')),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridViewTab(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, top: 24.v, right: 16.h),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 220.v,
          crossAxisCount: 2,
          mainAxisSpacing: 18.h,
          crossAxisSpacing: 18.h,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) {
          return FavoriteItemWidget();
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        // imagePath: ImageConstant.imgArrowLeftPrimary,
        margin: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 12.v),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarTitle(text: "Favorites", margin: EdgeInsets.only(left: 14.h)),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgVuesaxLinearElement3Primary,
          margin: EdgeInsets.only(left: 15.h, top: 16.v, right: 15.h),
          onTap: () {
            onTapFirstTab(context);
          },
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgVuesaxLinearFatrowsBlue700,
          margin: EdgeInsets.only(left: 11.h, top: 16.v, right: 30.h),
          onTap: () {
            onTapSecondTab(context);
          },
        ),
      ],
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  onTapFirstTab(BuildContext context) {
    DefaultTabController.of(context)?.animateTo(0);
  }

  onTapSecondTab(BuildContext context) {
    DefaultTabController.of(context)?.animateTo(1);
  }
}
