import '../flights_page/widgets/flights_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore_for_file: must_be_immutable
class FlightsPage extends StatefulWidget {
  const FlightsPage({Key? key})
      : super(
          key: key,
        );

  @override
  FlightsPageState createState() => FlightsPageState();
}

class FlightsPageState extends State<FlightsPage>
    with AutomaticKeepAliveClientMixin<FlightsPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40.v),
                Padding(
                  padding: EdgeInsets.only(left: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBestDeals(context),
                      SizedBox(height: 29.v),
                      _buildFlights(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBestDeals(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Best Deals",
            style: CustomTextStyles.titleLarge23,
          ),
          Padding(
            padding: EdgeInsets.only(top: 11.v),
            child: Text(
              "View All",
              style: CustomTextStyles.bodyMediumRegular_1,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFlights(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 220.v,
        crossAxisCount: 3,
        mainAxisSpacing: 18.h,
        crossAxisSpacing: 18.h,
      ),
      physics: BouncingScrollPhysics(),
      itemCount: 9,
      itemBuilder: (context, index) {
        return FlightsItemWidget();
      },
    );
  }
}
