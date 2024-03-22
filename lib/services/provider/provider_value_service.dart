import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/services/provider/provider_services.dart';

class ProviderValueServices extends ValueNotifier<ProviderServices> {
  ProviderValueServices(ProviderServices providerServices)
      : super(providerServices);
}

  // String pickText = '';
  // List<String> isTapped = ['Spa'];

  // String _query = '';

  // serviceContainer(
  //   text,
  //   color,
  //   containerColor,
  // ) =>
  //     InkWell(
  //       onTap: () {
  //         pickText = text;
  //         if (isTapped.contains(text)) {
  //         } else if (!isTapped.contains(text)) {
  //           isTapped.clear();
  //           isTapped.add(text);
  //         } else {
  //           isTapped.remove(text);
  //         }
  //         print(isTapped.toString());
  //         // setState(() {});
  //         notifyListeners();
  //       },
  //       child: Container(
  //         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
  //         decoration: BoxDecoration(
  //             color: containerColor, borderRadius: BorderRadius.circular(20)),
  //         child: Text(
  //           text,
  //           style: theme.textTheme.labelLarge!.copyWith(color: color),
  //         ),
  //       ),
  //     );

  // serviceFilterOption(text, color, containerColor, ontap) => InkWell(
  //       onTap: ontap,
  //       child: Container(
  //         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 26),
  //         decoration: BoxDecoration(
  //             color: containerColor, borderRadius: BorderRadius.circular(26)),
  //         child: Text(
  //           text,
  //           style: theme.textTheme.titleMedium!.copyWith(color: color),
  //         ),
  //       ),
  //     );

  // void showBottomModalFilter(BuildContext? context) {
  //   showModalBottomSheet(
  //       context: context!,
  //       isScrollControlled: true,
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(14))),
  //       builder: (context) => DraggableScrollableSheet(
  //             expand: false,
  //             initialChildSize: .4,
  //             maxChildSize: .9,
  //             minChildSize: .32,
  //             builder: (context, scrollController) => SingleChildScrollView(
  //               padding: EdgeInsets.symmetric(horizontal: 16),
  //               controller: scrollController,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   SizedBox(
  //                     height: 20,
  //                   ),
  //                   Align(
  //                     alignment: Alignment.center,
  //                     child: Column(
  //                       children: [
  //                         Container(
  //                           height: 4,
  //                           width: 60,
  //                           decoration: BoxDecoration(
  //                               color: Colors.grey.shade400,
  //                               borderRadius: BorderRadius.circular(10)),
  //                         ),
  //                         SizedBox(
  //                           height: 20,
  //                         ),
  //                         Text(
  //                           "Filter",
  //                           style: theme.textTheme.titleLarge!.copyWith(
  //                             color: theme.colorScheme.primary,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 20,
  //                   ),
  //                   Divider(
  //                     color: Colors.grey.shade400,
  //                   ),
  //                   SizedBox(
  //                     height: 18,
  //                   ),
  //                   Text(
  //                     "Service Type",
  //                     style: theme.textTheme.titleLarge!.copyWith(
  //                       color: theme.colorScheme.primary,
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                   Row(
  //                     children: [
  //                       serviceContainer(
  //                         'Spa',
  //                         isTapped.contains('Spa')
  //                             ? Colors.white
  //                             : theme.colorScheme.primary,
  //                         isTapped.contains('Spa')
  //                             ? theme.colorScheme.primary
  //                             : Colors.white,
  //                       ),
  //                       SizedBox(
  //                         width: 14,
  //                       ),
  //                       serviceContainer(
  //                         'Gym',
  //                         isTapped.contains('Gym')
  //                             ? Colors.white
  //                             : theme.colorScheme.primary,
  //                         isTapped.contains('Gym')
  //                             ? theme.colorScheme.primary
  //                             : Colors.white,
  //                       ),
  //                       SizedBox(
  //                         width: 14,
  //                       ),
  //                       serviceContainer(
  //                         'Theater',
  //                         isTapped.contains('Theater')
  //                             ? Colors.white
  //                             : theme.colorScheme.primary,
  //                         isTapped.contains('Theater')
  //                             ? theme.colorScheme.primary
  //                             : Colors.white,
  //                       ),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: 100,
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       serviceFilterOption('Reset', Colors.white, Colors.blue,
  //                           () {
  //                         _query = '';
  //                         Navigator.pop(context);
  //                         notifyListeners();
  //                       }),
  //                       SizedBox(
  //                         width: 30,
  //                       ),
  //                       serviceFilterOption('Apply Filter', Colors.white,
  //                           theme.colorScheme.primary, () {
  //                         _query = pickText;
  //                         Navigator.pop(context);
  //                         notifyListeners();
  //                       }),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ));
  //   notifyListeners();
  // }

