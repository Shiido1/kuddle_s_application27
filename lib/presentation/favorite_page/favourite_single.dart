import 'package:kuddle_s_application27/presentation/favorite_five_screen/widgets/favoritefive_item_widget.dart';
import 'package:kuddle_s_application27/presentation/favorite_four_screen/widgets/favoritefour_item_widget.dart';
import 'package:kuddle_s_application27/presentation/last_book_page/widgets/lastbook_item_widget.dart';

import '../../widgets/custom_elevated_button.dart';
import '../favorite_three_screen/widgets/favoritethree_item_widget.dart';
import '../last_book_complete_page/widgets/lastbookcomplete_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore_for_file: must_be_immutable
class FavouriteSingle extends StatefulWidget {
  const FavouriteSingle({Key? key})
      : super(
    key: key,
  );

  @override
  FavouriteSingleState createState() => FavouriteSingleState();
}

class FavouriteSingleState extends State<FavouriteSingle>
    with AutomaticKeepAliveClientMixin<FavouriteSingle> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimary,
          child: Column(
            children: [
              SizedBox(height: 20.v),
              _buildLastBookComplete(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLastBookComplete(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
              context,
              index,
              ) {
            return SizedBox(
              height: 20.v,
            );
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return FavouriteSingleItemWidget();
          },
        ),
      ),
    );
  }


}


class FavouriteSingleItemWidget extends StatelessWidget {
  const FavouriteSingleItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 5.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder13,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 40.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgValeriiaBugaio219x190,
                  height: 108.v,
                  width: 116.h,
                  radius: BorderRadius.circular(
                    15.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 19.h,
                    top: 5.v,
                    bottom: 11.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hotel Royal",
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: 10.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgVectorGray700,
                            height: 13.v,
                            width: 8.h,
                            margin: EdgeInsets.only(
                              top: 1.v,
                              bottom: 15.v,
                            ),
                          ),
                          Container(
                            width: 193.h,
                            margin: EdgeInsets.only(left: 5.h),
                            child: Text(
                              "3/2 Thanon Khao, Vachirapayabal, Dusit.",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 9.v),

                      Text('499/Night'),

                    ],
                  ),
                ),
              ],
            ),
          ),




        ],
      ),
    );
  }
}
