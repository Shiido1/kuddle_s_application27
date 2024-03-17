import '../last_book_complete_page/widgets/lastbookcomplete_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore_for_file: must_be_immutable
class LastBookCompletePage extends StatefulWidget {
  const LastBookCompletePage({Key? key})
      : super(
          key: key,
        );

  @override
  LastBookCompletePageState createState() => LastBookCompletePageState();
}

class LastBookCompletePageState extends State<LastBookCompletePage>
    with AutomaticKeepAliveClientMixin<LastBookCompletePage> {
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
            return LastbookcompleteItemWidget();
          },
        ),
      ),
    );
  }
}
