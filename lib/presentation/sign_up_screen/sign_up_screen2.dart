import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kuddle_s_application27/apiservices/validator.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/services/provider/provider_services.dart';
import 'package:kuddle_s_application27/widgets/custom_checkbox_button.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool rememberMeCheckbox = false;
  bool _obscureText = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);

    // _passwordVisible = false;

    // deviceInfo = DeviceInfoPlugin();
    // // try and print deviceInfo to see all required stuffs then get the device name and pass it to the registration function
    // _getId();
    super.initState();
  }

  void signup(context) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('working')));
  }

  void signUp(context) async {
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text('working here too')));

    if (_formKey.currentState!.validate()) {
      setState(() {});
      providerServices?.register(map: {
        // "type": "1",
        // "device_id": device!,
        // "device_type": Platform.isIOS ? "iPhone" : "android",
        // "device_name": deviceInfo.toString(),
        // "device_token": "$deviceToken",
        "username": usernameController.text.trim(),
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
        "emailAddress": emailController.text.trim(),
        "phoneNumber": phoneNumberController.text.trim(),
        "password": passwordController.text.trim(),
      }, context: context);
    }
  }

  // void signUp(context) async {
  //   try {
  //     providerServices?.register(map: {
  //       "username": usernameController.text.trim(),
  //       "firstName": firstNameController.text.trim(),
  //       "lastName": lastNameController.text.trim(),
  //       "emailAddress": emailController.text.trim(),
  //       "phoneNumber": phoneNumberController.text.trim(),
  //       "password": passwordController.text.trim(),
  //     }, context: context);

  //     // ScaffoldMessenger.of(context)
  //     //     .showSnackBar(SnackBar(content: Text('worked')));
  //     // print({prov_registerModel!.user!.email!});
  //     // If the registration is successful, you can navigate or perform other actions
  //     // Navigator.pushReplacementNamed(context, '/home'); // Replace '/home' with your desired route
  //   } catch (error) {
  //     // Handle errors, show error message, or perform other actions
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Error: $error')));
  //   }
  // }



  // Future<Map<String, dynamic>> signUp(context) async {
  //   Dio _dio = Dio();
  //   PrettyDioLogger _dioLogger = PrettyDioLogger(
  //     requestHeader: true,
  //     requestBody: true,
  //     responseHeader: true,
  //     responseBody: true,
  //   );
  //   _dio.interceptors.add(_dioLogger);
  //
  //   try {
  //     Map<String, dynamic> credentials = {
  //       "username": usernameController.text.trim(),
  //       "firstName": firstNameController.text.trim(),
  //       "lastName": lastNameController.text.trim(),
  //       "emailAddress": emailController.text.trim(),
  //       "phoneNumber": phoneNumberController.text.trim(),
  //       "password": passwordController.text.trim(),
  //     };
  //
  //     Response response =
  //     await _dio.post("https://maczuby.com/signup", data: credentials);
  //
  //     // Check the response status code and handle accordingly
  //     if (response.statusCode == 200) {
  //       // Registration successful
  //       // You can handle the response data here if needed
  //
  //       // Return the JSON data
  //       return response.data;
  //     } else {
  //       // Registration failed
  //       String errorMessage = 'Error: ${response.statusCode}';
  //       if (response.data != null && response.data is Map) {
  //         // Check if there is a detailed error message in the response body
  //         errorMessage = response.data['message'] ?? errorMessage;
  //       }
  //
  //       // Throw an exception with the error message
  //       throw Exception(errorMessage);
  //     }
  //   } on DioError catch (e) {
  //     // Handle Dio errors
  //     String errorMessage = 'DioError: ${e.message}';
  //     if (e.response != null) {
  //       // Check if there is a detailed error message in the response body
  //       errorMessage = e.response!.data['message'] ?? errorMessage;
  //     }
  //
  //     // Throw an exception with the error message
  //     throw Exception(errorMessage);
  //   } catch (error) {
  //     // Handle other errors
  //     throw Exception('Error: $error');
  //   }
  // }


  // void signUp(context) async {
  //   Dio _dio = Dio();
  //   PrettyDioLogger _dioLogger = PrettyDioLogger(
  //     requestHeader: true,
  //     requestBody: true,
  //     responseHeader: true,
  //     responseBody: true,
  //   );
  //   _dio.interceptors.add(_dioLogger);
  //
  //   try {
  //     Map<String, dynamic> credentials = {
  //       "username": usernameController.text.trim(),
  //       "firstName": firstNameController.text.trim(),
  //       "lastName": lastNameController.text.trim(),
  //       "emailAddress": emailController.text.trim(),
  //       "phoneNumber": phoneNumberController.text.trim(),
  //       "password": passwordController.text.trim(),
  //     };
  //
  //     Response response =
  //         await _dio.post("https://maczuby.com/signup", data: credentials);
  //
  //     // Check the response status code and handle accordingly
  //     if (response.statusCode == 200) {
  //       // Registration successful
  //       // You can handle the response data here
  //     } else {
  //       // Registration failed
  //       String errorMessage = 'Error: ${response.statusCode}';
  //       if (response.data != null && response.data is Map) {
  //         // Check if there is a detailed error message in the response body
  //         errorMessage = response.data['message'] ?? errorMessage;
  //       }
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text(errorMessage),
  //       ));
  //     }
  //   } on DioError catch (e) {
  //     // Handle Dio errors
  //     String errorMessage = 'DioError: ${e.message}';
  //     if (e.response != null) {
  //       // Check if there is a detailed error message in the response body
  //       errorMessage = e.response!.data['message'] ?? errorMessage;
  //     }
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text(errorMessage),
  //     ));
  //   } catch (error) {
  //     // Handle other errors
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Error: $error')));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // Tablet or larger screen, you can customize for tablets if needed
              return buildTabletLayout();
            } else {
              // Mobile screen
              return buildMobileLayout();
            }
          },
        ),
      ),
    );
  }

  Widget buildMobileLayout() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowLeft,
                height: 31.0,
                width: 31.0,
                alignment: Alignment.centerLeft,
                onTap: () {
                  onTapImgArrowLeft(context);
                },
              ),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 233.0,
                  child: Text(
                    "Create Your \nAccount",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        theme.textTheme.displayMedium!.copyWith(height: 1.39),
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextFormField(
                    validator: Validators.validateEmail(),
                    controller: emailController,
                    hintText: "Email",
                    textInputType: TextInputType.name,
                    prefix: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 17.h, vertical: 20.v),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgEmail1,
                            height: 12.v,
                            width: 18.h)),
                    prefixConstraints: BoxConstraints(maxHeight: 53.v)),
              ),

              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextFormField(
                  validator: Validators.validateString(),
                  controller: firstNameController,
                  hintText: "First Name",
                  textInputType: TextInputType.name,
                  prefix: Icon(Icons.person_2_sharp),
                ),
              ),

              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextFormField(
                  validator: Validators.validateString(),
                  controller: lastNameController,
                  hintText: "LastName ",
                  textInputType: TextInputType.name,
                  prefix: Icon(Icons.person_2_outlined),
                ),
              ),

              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextFormField(
                  validator: Validators.validatePhone(),
                  controller: phoneNumberController,
                  hintText: "Phone number",
                  textInputType: TextInputType.phone,
                  prefix: Icon(Icons.phone_android),
                ),
              ),

              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextFormField(
                    validator: Validators.validateString(),
                    controller: usernameController,
                    hintText: "Username",
                    textInputType: TextInputType.text,
                    prefix: Icon(Icons.person_2_outlined)),
              ),

              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextFormField(
                  validator: Validators.validatePlainPassword(),
                  controller: passwordController,
                  hintText: "Password",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                  prefix: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),

              // ... Other form fields
              SizedBox(height: 20.0),
              _buildRememberMeCheckbox(context),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => signUp(context),
                child: Consumer<ProviderServices>(
                  builder: (_, value, __) => Center(
                    child: value.isLoading == true
                        ? const SpinKitCircle(
                            color: Colors.yellow,
                          )
                        : CustomElevatedButton(
                            onPressed: () {
                              signUp(context);
                            },
                            height: 53.0,
                            text: "Sign up",
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            buttonStyle: CustomButtonStyles.outlinePrimary,
                            buttonTextStyle:
                                CustomTextStyles.titleMediumUrbanist,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabletLayout() {
    // Customize for tablet layout if needed
    return Center(
      child: Text(
        "Tablet Layout - Not Implemented Yet",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  Widget _buildRememberMeCheckbox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          rememberMeCheckbox = !rememberMeCheckbox;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Row(
          children: [
            Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4.0),
                color: rememberMeCheckbox ? Colors.black : Colors.white,
              ),
              child: rememberMeCheckbox
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16.0,
                    )
                  : null,
            ),
            SizedBox(width: 10.0),
            Text(
              "Remember me",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
