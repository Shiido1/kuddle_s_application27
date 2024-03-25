// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/theme/theme_helper.dart';
import 'package:provider/provider.dart';

import '../../../services/provider/provider_services.dart';

class TourFilterFrame extends StatefulWidget {
  TourFilterFrame({Key? key, required ScrollController scrollController})
      : super(key: key);
  ScrollController? scrollController;

  @override
  State<TourFilterFrame> createState() => _TourFilterFrameState();
}

class _TourFilterFrameState extends State<TourFilterFrame> {
  ScrollController? _scrollController;
  String pickText = '';
  List<String> isTapped = ['Park'];
  String _query = '';
  ProviderServices? providerServices;

  serviceContainer(text, color, containerColor, textValue) => InkWell(
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
                    'Park',
                    isTapped.contains('Park')
                        ? Colors.white
                        : theme.colorScheme.primary,
                    isTapped.contains('Park')
                        ? theme.colorScheme.primary
                        : theme.colorScheme.primary.withOpacity(.05),
                    'Park'),
                SizedBox(
                  width: 14,
                ),
                serviceContainer(
                    'Museum',
                    isTapped.contains('Museum')
                        ? Colors.white
                        : theme.colorScheme.primary,
                    isTapped.contains('Museum')
                        ? theme.colorScheme.primary
                        : theme.colorScheme.primary.withOpacity(.05),
                    'Museum'),
                SizedBox(
                  width: 14,
                ),
                serviceContainer(
                    'Lake City',
                    isTapped.contains('Lake City')
                        ? Colors.white
                        : theme.colorScheme.primary,
                    isTapped.contains('Lake City')
                        ? theme.colorScheme.primary
                        : theme.colorScheme.primary.withOpacity(.05),
                    'City'),
                SizedBox(
                  width: 14,
                ),
                serviceContainer(
                    'Resort',
                    isTapped.contains('Resort')
                        ? Colors.white
                        : theme.colorScheme.primary,
                    isTapped.contains('Resort')
                        ? theme.colorScheme.primary
                        : theme.colorScheme.primary.withOpacity(.05),
                    'Resort'),
                SizedBox(
                  width: 14,
                ),
                serviceContainer(
                    'Garden',
                    isTapped.contains('Garden')
                        ? Colors.white
                        : theme.colorScheme.primary,
                    isTapped.contains('Garden')
                        ? theme.colorScheme.primary
                        : theme.colorScheme.primary.withOpacity(.05),
                    'Garden'),

                // SizedBox(
                //   width: 14,
                // ),
                // serviceContainer(
                //     'Companion',
                //     isTapped.contains('Companion')
                //         ? Colors.white
                //         : theme.colorScheme.primary,
                //     isTapped.contains('Companion')
                //         ? theme.colorScheme.primary
                //         : theme.colorScheme.primary.withOpacity(.05),
                //     'Companion'),
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
