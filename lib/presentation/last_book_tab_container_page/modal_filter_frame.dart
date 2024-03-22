// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/theme/theme_helper.dart';
import 'package:provider/provider.dart';

import '../../services/provider/provider_services.dart';

class ModalFilterFrame extends StatefulWidget {
  ModalFilterFrame({Key? key, required ScrollController scrollController})
      : super(key: key);
  ScrollController? scrollController;

  @override
  State<ModalFilterFrame> createState() => _ModalFilterFrameState();
}

class _ModalFilterFrameState extends State<ModalFilterFrame> {
  ScrollController? _scrollController;
  String pickText = '';
  List<String> isTapped = ['Spa'];
  String _query = '';
  ProviderServices? providerServices;

  serviceContainer(
    text,
    color,
    containerColor,
  ) =>
      InkWell(
        onTap: () {
          pickText = text;
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
          Row(
            children: [
              serviceContainer(
                'Spa',
                isTapped.contains('Spa')
                    ? Colors.white
                    : theme.colorScheme.primary,
                isTapped.contains('Spa')
                    ? theme.colorScheme.primary
                    : Colors.white,
              ),
              SizedBox(
                width: 14,
              ),
              serviceContainer(
                'Gym',
                isTapped.contains('Gym')
                    ? Colors.white
                    : theme.colorScheme.primary,
                isTapped.contains('Gym')
                    ? theme.colorScheme.primary
                    : Colors.white,
              ),
              SizedBox(
                width: 14,
              ),
              serviceContainer(
                'Theater',
                isTapped.contains('Theater')
                    ? Colors.white
                    : theme.colorScheme.primary,
                isTapped.contains('Theater')
                    ? theme.colorScheme.primary
                    : Colors.white,
              ),
            ],
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
