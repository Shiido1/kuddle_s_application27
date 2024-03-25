// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/theme/theme_helper.dart';
import 'package:provider/provider.dart';

import '../../../services/provider/provider_services.dart';

class FlightModalFilterFrame extends StatefulWidget {
  FlightModalFilterFrame({Key? key, required ScrollController scrollController})
      : super(key: key);
  ScrollController? scrollController;

  @override
  State<FlightModalFilterFrame> createState() => _FlightModalFilterFrameState();
}

class _FlightModalFilterFrameState extends State<FlightModalFilterFrame> {
  ScrollController? _scrollController;
  String pickText = '';
  List<String> isTapped = ['Economy'];
  String _query = '';
  ProviderServices? providerServices;

  serviceContainer(
    text,
    color,
    containerColor,
    textValue
  ) =>
      InkWell(
        onTap: () {
          pickText = textValue;
          if (isTapped.contains(text)) {
          } else if (!isTapped.contains(text)) {
            isTapped.clear();
            isTapped.add(text);
          } else {
            isTapped.remove(text);
          }
          print(isTapped.toString());

          providerServices!.notifyListeners();
          setState(() {});
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
              color: containerColor, borderRadius: BorderRadius.circular(20)),
          child: Text(
            text,
            style: theme.textTheme.labelLarge!.copyWith(color: color),
          ),
        ),
      );

  serviceFilterOption(text, color, containerColor, ontap) => InkWell(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 26),
          decoration: BoxDecoration(
              color: containerColor, borderRadius: BorderRadius.circular(26)),
          child: Text(
            text,
            style: theme.textTheme.titleMedium!.copyWith(color: color),
          ),
        ),
      );

  @override
  void initState() {
    _scrollController = widget.scrollController;

    providerServices = Provider.of<ProviderServices>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: 4,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Filter",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            "Service Type",
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                serviceContainer(
                  'Economy',
                  isTapped.contains('Economy')
                      ? Colors.white
                      : theme.colorScheme.primary,
                  isTapped.contains('Economy')
                      ? theme.colorScheme.primary
                      : theme.colorScheme.primary.withOpacity(.05),'Economy'
                ),
                SizedBox(
                  width: 14,
                ),
                serviceContainer(
                  'Premium Economy',
                  isTapped.contains('Premium Economy')
                      ? Colors.white
                      : theme.colorScheme.primary,
                  isTapped.contains('Premium Economy')
                      ? theme.colorScheme.primary
                      : theme.colorScheme.primary.withOpacity(.05),'Premium'
                ),
                SizedBox(
                  width: 14,
                ),
                serviceContainer(
                  'Business',
                  isTapped.contains('Business')
                      ? Colors.white
                      : theme.colorScheme.primary,
                  isTapped.contains('Business')
                      ? theme.colorScheme.primary
                      : theme.colorScheme.primary.withOpacity(.05),'Business'
                ),
                SizedBox(
                  width: 14,
                ),
                serviceContainer(
                  'First',
                  isTapped.contains('First')
                      ? Colors.white
                      : theme.colorScheme.primary,
                  isTapped.contains('First')
                      ? theme.colorScheme.primary
                      : theme.colorScheme.primary.withOpacity(.1),'First'
                ),
                SizedBox(
                  width: 14,
                ),
                serviceContainer(
                  'Multiple',
                  isTapped.contains('Multiple')
                      ? Colors.white
                      : theme.colorScheme.primary,
                  isTapped.contains('Multiple')
                      ? theme.colorScheme.primary
                      : theme.colorScheme.primary.withOpacity(.05),'Multiple'
                ),
                // SizedBox(
                //   width: 14,
                // ),
                // serviceContainer(
                //   'Other',
                //   isTapped.contains('Other')
                //       ? Colors.white
                //       : theme.colorScheme.primary,
                //   isTapped.contains('Other')
                //       ? theme.colorScheme.primary
                //       : theme.colorScheme.primary.withOpacity(.1),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              serviceFilterOption('Reset', Colors.white, Colors.blue, () {
                _query = '';
                providerServices!.query = '';
                setState(() {});
                providerServices!.notifyListeners();
                Navigator.pop(context);
              }),
              SizedBox(
                width: 30,
              ),
              serviceFilterOption(
                  'Apply Filter', Colors.white, theme.colorScheme.primary, () {
                _query = pickText;
                providerServices!.query = pickText;
                setState(() {});
                providerServices!.notifyListeners();
                Navigator.pop(context);
              }),
            ],
          )
        ],
      ),
    );
  }
}
