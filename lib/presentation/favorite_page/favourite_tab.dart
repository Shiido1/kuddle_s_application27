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
import 'package:intl/intl.dart';

class FavoritePageTab extends StatefulWidget {
  const FavoritePageTab({Key? key}) : super(key: key);

  static const List<int> numbers = [1, 2, 3, 4, 5];

  @override
  State<FavoritePageTab> createState() => _FavoritePageTabState();
}

class _FavoritePageTabState extends State<FavoritePageTab> {
  late List<Favorite> favoritesList;

  @override
  void initState() {
    super.initState();
    initializeFavorites();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Call the method to show the list when dependencies change

    if (Navigator.of(context).canPop()) {
      // Trigger the refresh when returning from another page
      initializeFavorites();
    }
    initializeFavorites();
  }

  Future<void> initializeFavorites() async {
    try {
      var list = await getFavoritesList();
      setState(() {
        favoritesList = list;
      });
      print('Favorites List: $favoritesList');
    } catch (e) {
      print('Error getting favorites list: $e');
    }
  }

  Future<List<Favorite>> getFavoritesList() async {
    var favoritesBox = await Hive.openBox<Favorite>('favoritesBox');
    return favoritesBox.values.toList();
  }

  void _removeFromFavorites(BuildContext context, Favorite favorite) async {
    bool confirmRemove = await showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you really want to remove ${favorite.name} from favorites?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text('No'),
            ),
          ],
        );
      },
    );

    if (confirmRemove == true) {
      try {
        var favoritesBox = await Hive.openBox<Favorite>('favoritesBox');
        await favoritesBox.delete(favorite.key); // Assuming 'key' is a unique identifier for each favorite
        initializeFavorites(); // Refresh the favorites list after removal
      } catch (e) {
        print('Error removing from favorites: $e');
      }
    }
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
              body:
                  TabBarView(
                children: [
                  _buildGridViewTab(builderContext),
                  _buildListViewTab(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _buildListTile(Favorite favorite) {
    return ListTile(
      contentPadding: EdgeInsets.all(16.0),
      leading: Image.network(
        'https://api.maczuby.com/images/${favorite.image}',
        width: 80.0,
        fit: BoxFit.cover,
      ),
      title: Text(
        favorite.name,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        currencyFormatter.format(favorite.price),
        style: TextStyle(fontSize: 14.0, color: Colors.green),
      ),
      onTap: () {
        // Add any onTap functionality here
      },
    );
  }

  Widget _buildFavoriteCardd(Favorite favorite) {
    return Card(
      // You can customize the Card widget as needed
      child: _buildListTile(favorite),
    );
  }

  Widget _buildListViewTab(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, top: 24.v, right: 16.h),
      child: favoritesList.isEmpty
          ? Center(child: Text('No favorites yet. Add favorites to see them here.'))
          : ListView.builder(
        itemCount: favoritesList.length,
        itemBuilder: (context, index) {
          return _buildListTile(favoritesList[index]);
        },
      ),
    );
  }





  Widget _buildGridViewTab(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, top: 24.v, right: 16.h),
      child: favoritesList.isEmpty
          ? Center(child: Text('No favorites yet. Add favorites to see them here.')) : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: favoritesList.length,
        itemBuilder: (context, index) {
          return _buildFavoriteCard(favoritesList[index]);
        },
      ),
    );
  }
  final NumberFormat currencyFormatter = NumberFormat.currency(symbol: '₦');

  // Widget _buildFavoriteCard(Favorite favorite) {
  //   return Card(
  //     // You can customize the Card widget as needed
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         // Display the image
  //         Expanded(
  //           child: Image.network(
  //             'https://api.maczuby.com/images/${favorite.image}',
  //             width: double.infinity,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //         // Display the name
  //         Padding(
  //           padding: EdgeInsets.all(8.0),
  //           child: Text(
  //             favorite.name,
  //             style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //         // Display the price
  //         Padding(
  //           padding: EdgeInsets.all(8.0),
  //           child: Text(
  //             currencyFormatter.format(favorite.price),
  //             style: TextStyle(fontSize: 14.0, color: Colors.green),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //

  Widget _buildFavoriteCard(Favorite favorite) {
    return Card(
      // You can customize the Card widget as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the image
          Expanded(
            child: Image.network(
              'https://api.maczuby.com/images/${favorite.image}',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Display the name
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              favorite.name,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          // Display the price
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              currencyFormatter.format(favorite.price),
              style: TextStyle(fontSize: 14.0, color: Colors.green),
            ),
          ),
          // Align the button to the right
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                _removeFromFavorites(context, favorite);
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.delete, color: Colors.red),
              ),
            ),
          ),
        ],
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
