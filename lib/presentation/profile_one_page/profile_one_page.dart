import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/delete_bottomsheet/delete_bottomsheet.dart';
import 'package:kuddle_s_application27/presentation/log_out_bottomsheet/log_out_bottomsheet.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../apiservices/cloudinary_service.dart';
import '../../main_core/session_manager.dart';
import '../../pages/bookings/model/user_detail_model.dart';
import '../../services/provider/provider_services.dart';


class ProfileOnePage extends StatefulWidget {
 const ProfileOnePage({Key? key}) : super(key: key);


  @override
  State<ProfileOnePage> createState() => _ProfileOnePageState();
}



class _ProfileOnePageState extends State<ProfileOnePage> {


  ProviderServices? providerServices;
  String? finalUrl = ImageConstant.imgEllipse12;

  final cloudinary = Cloudinary.signedConfig(
    apiKey: '955764993975826',
    apiSecret: 'v2gxxTAcWGLbC6NY1_f-x5aBWdA',
    cloudName: 'db0mhnvvo',
  );


  // final cloudinary = Cloudinary.unsignedConfig(
  //   cloudName: 'db0mhnvvo',
  // );


  getAuthUserID() async {
    String? userID = SessionManager.instance.authUserID;
    return userID;
  }

  void addAvatar(context) async {
    // Get the values from your controllers or any other dynamic source

    // Update the profile
    var userId = await getAuthUserID();
    // Set the values in the map
    var updateMap = {
      "userID": "$userId",
      "avatarURL": "$finalUrl"
    };


    providerServices?.addAvatar(map: updateMap, context: context);
    setState(() {
      providerServices?.userData?.result.first.avatar = finalUrl;
    });
  }



  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getUserDetails();
    finalUrl = providerServices?.userData!.result!.first!.avatar!.toString();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    setState(() {
      providerServices?.userData?.result.first.avatar = finalUrl;
    });
    super.didChangeDependencies();
  }

  // Example using signed upload
  void uploadImage() async {
    try {
      final ImagePicker _picker = ImagePicker();

      // Use ImagePicker to get the path of the selected image
      XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        String imagePath = pickedFile.path;

        // Specify other optional parameters as needed
        String folder = 'https://api.cloudinary.com/v1_1/db0mhnvvo/upload';
        CloudinaryResourceType resourceType = CloudinaryResourceType.image;
        Map<String, dynamic> optParams = {'key': 'value'};

        // Perform the upload
        CloudinaryResponse response = await cloudinary.upload(
          file: imagePath,
          folder: folder,
          resourceType: resourceType,
          optParams: optParams,
          // Add a progress callback if needed
          progressCallback: (count, total) {
            // Handle progress updates
          },
        );

        // Handle the response
        if (response.isResultOk) {
          print('Image uploaded successfully: ${response.secureUrl}');
          addAvatar(context);

        } else {
          print('Error uploading image: ${response.error}');
        }
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

// Example using unsigned upload




  Future<ImageSource?> _showImageSourceDialog(ImagePicker picker) async {
    return showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Select Image Source',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDialogButton(
                onPressed: () {
                  Navigator.pop(context, ImageSource.camera);
                },
                label: 'Camera',
              ),
              _buildDialogButton(
                onPressed: () {
                  Navigator.pop(context, ImageSource.gallery);
                },
                label: 'Gallery',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDialogButton({required VoidCallback onPressed, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
            color: Colors.blue, // Adjust the color as needed
          ),
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white, // Adjust the text color as needed
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }



  void unsignedUploadImage() async {
    try {
      final ImagePicker _picker = ImagePicker();

      ImageSource? selectedSource = await _showImageSourceDialog(_picker);

      if (selectedSource != null) {
        // Use ImagePicker to get the path of the selected image
        XFile? pickedFile = await _picker.pickImage(
          source: selectedSource,
          imageQuality: 80,
          maxHeight: 600,
          maxWidth: 800,
        );

        if (pickedFile != null) {
          String imagePath = pickedFile.path;

          // Specify other optional parameters as needed
          String uploadPreset = 'jcgkqq0x';
          String folder = 'https://api.cloudinary.com/v1_1/db0mhnvvo/upload';
          CloudinaryResourceType resourceType = CloudinaryResourceType.image;
          Map<String, dynamic> optParams = {'key': 'value'};

          try {
            // Perform the upload
            CloudinaryResponse response = await cloudinary.unsignedUpload(
              file: imagePath,
              uploadPreset: uploadPreset,
              folder: folder,
              resourceType: resourceType,
              optParams: optParams,
              // Add a progress callback if needed
              progressCallback: (count, total) {
                // Handle progress updates
              },
            );

            // Handle the response
            if (response.isResultOk) {
              print('Image uploaded successfully: ${response.secureUrl}');
              finalUrl = response.secureUrl.toString();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('updated Profile')));
              addAvatar(context);
            } else {
              print('Error uploading image: ${response.error}');
            }
          } catch (e) {
            print('Error uploading image: $e');
          }
        } else {
          print('No image selected');
        }
      } else {
        print('No image source selected');
      }
    } catch (e) {
      print('Error: $e');
    }
  }




  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: finalUrl == null ? CircularProgressIndicator() : Consumer<ProviderServices>(
            builder: (_, provider, __) {
              // Check if provider or walletData is null before accessing data
              if (provider.userData?.status != "Success") {
                return Center(child: const CircularProgressIndicator());
              }

              UserInfo userInfo = provider.userData!.result.first!;

              final String avatarImagePath = userInfo.avatar ?? ImageConstant.imgEllipse12;

              print('${userInfo.avatar}');

              return SingleChildScrollView(
                padding: EdgeInsets.only(top: 29.v),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 225.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 106.adaptSize,
                          width: 106.adaptSize,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CustomImageView(
                                imagePath: userInfo.avatar ?? ImageConstant.imgEllipse12,

                                // imagePath: ('${userInfo.avatar ?? ImageConstant.imgEllipse12),
                                height: 106.adaptSize,
                                width: 106.adaptSize,
                                radius: BorderRadius.circular(53.h),
                                alignment: Alignment.center,
                              ),
                              GestureDetector(
                                onTap: () {
                                  unsignedUploadImage();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 6.v),
                                  child: CustomIconButton(
                                    height: 28.adaptSize,
                                    width: 28.adaptSize,
                                    padding: EdgeInsets.all(7.h),
                                    decoration: IconButtonStyleHelper.fillPrimary,
                                    alignment: Alignment.bottomRight,
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgIcOutlineModeEditOutline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 17.v),
                      Align(
                        alignment: Alignment.center,
                        child: Text("${userInfo.firstName}", style: theme.textTheme.titleLarge),
                      ),
                      SizedBox(height: 13.v),
                      Align(
                        alignment: Alignment.center,
                        child: Text("${userInfo.emailAddress}", style: CustomTextStyles.bodyMediumRegular15),
                      ),
                      SizedBox(height: 20.v),
                      Divider(),
                      SizedBox(height: 40.v),
                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the home page
                            Navigator.pushNamed(context, AppRoutes.profileScreen); // Replace with your actual route
                          },
                          child: _buildInfo(
                            context,
                            userImage: ImageConstant.imgUser,
                            editProfileLabel: "Edit Profile",
                          ),
                        ),
                      ),
                      SizedBox(height: 36.v),
                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the Ewallet page
                            Navigator.pushNamed(context, AppRoutes.eWalletScreen); // Replace with your actual route
                          },
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgVuesaxLinearEmptyWallet,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 19.h),
                                child: Text("E-wallet", style: CustomTextStyles.titleSmall15_1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 35.v),
                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the Notification page
                            Navigator.pushNamed(context, AppRoutes.notificationOneScreen); // Replace with your actual route
                          },
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgNotification,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 19.h),
                                child: Text("Notification", style: CustomTextStyles.titleSmall15_1),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // SizedBox(height: 36.v),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 24.h),
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       // Navigate to the Security page
                      //       Navigator.pushNamed(context, AppRoutes.notificationScreen); // Replace with your actual route
                      //     },
                      //     child: Row(
                      //       children: [
                      //         CustomImageView(
                      //           imagePath: ImageConstant.imgSearchPrimary,
                      //           height: 20.adaptSize,
                      //           width: 20.adaptSize,
                      //         ),
                      //         Padding(
                      //           padding: EdgeInsets.only(left: 19.h),
                      //           child: Text("Security", style: CustomTextStyles.titleSmall15_1),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 35.v),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 24.h),
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       // Navigate to the Profile One screen
                      //       Navigator.pushNamed(context, AppRoutes.lastBookCompletePage); // Replace with your actual route
                      //     },
                      //     child: _buildInfo(
                      //       context,
                      //       userImage: ImageConstant.imgInfo,
                      //       editProfileLabel: "Edit Profile",
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 36.v),
                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true, // Set to true for a full-screen modal
                              builder: (BuildContext context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height - 400,
                                  // Adjust the height as needed
                                  child: LogOutBottomsheet(),
                                );
                              }, // Corrected this line
                            );
                            // Navigator.pushNamed(context, AppRoutes.signInScreen); // Replace with your actual route
                          },
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgArrowRight,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 19.h, top: 3.v),
                                child: Text("Log Out", style: CustomTextStyles.titleSmall15_1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 36.v),

                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the Notification page

                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true, // Set to true for a full-screen modal
                              builder: (BuildContext context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height - 400,
                                  // Adjust the height as needed
                                  child: DeleteBottomsheet(),
                                );
                              }, // Corrected this line
                            );

                            // Navigator.pushNamed(context, AppRoutes.notificationOneScreen); // Replace with your actual route
                          },
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgClosePrimary,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 19.h),
                                child: Text("Delete Account", style: CustomTextStyles.titleSmall15_1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 32.v),
                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.blue, // Choose a suitable color
                              size: 20.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'For Enquiries, Call',
                                    style: CustomTextStyles.titleSmall15_1
                                  ),
                                  SizedBox(height: 5.v),
                                  GestureDetector(
                                    onTap: () {
                                      // Launch the caller app
                                      _launchCallerApp('+2347047456706'); // Replace with your actual phone number
                                    },
                                    child: Text(
                                      '+2347047456706', // Replace with your actual phone number
                                      style: TextStyle(
                                        fontSize: 14.adaptSize,
                                        color: Colors.blue, // Choose a suitable color
                                        // decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),



                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _launchCallerApp(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Section Widget
 PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(

          // imagePath: ImageConstant.imgArrowLeftPrimary,
          margin: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 12.v),
          onTap: () {
           // onTapArrowLeft(context);
          }),
      title:
      AppbarTitle(text: "Profile", margin: EdgeInsets.only(left: 14.h)));
 }

 /// Common widget
 Widget _buildInfo(
     BuildContext context, {
      required String userImage,
      required String editProfileLabel,
     }) {
  return Row(children: [
   CustomImageView(
       imagePath: userImage, height: 20.adaptSize, width: 20.adaptSize),
   Padding(
       padding: EdgeInsets.only(left: 19.h),
       child: Text(editProfileLabel,
           style: CustomTextStyles.titleSmall15_1
               .copyWith(color: theme.colorScheme.primary)))
  ]);
 }

 /// Navigates back to the previous screen.
 onTapArrowLeft(BuildContext context) {
  Navigator.pop(context);
 }

  void showLoading() {}
}
