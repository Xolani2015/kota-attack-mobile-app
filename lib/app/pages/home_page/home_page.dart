// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kota_attack_mobile_app/app/widgets/app_button.dart';
import 'package:kota_attack_mobile_app/app/widgets/app_dialogs.dart';
import 'package:kota_attack_mobile_app/app/widgets/app_template.dart';
import 'package:kota_attack_mobile_app/app/widgets/app_text.dart';
import 'package:kota_attack_mobile_app/configurations/configurations.dart';
import 'package:kota_attack_mobile_app/configurations/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum LoadingButtonStates {
  none,
  signIn,
  google,
  facebook,
}

class _HomePageState extends State<HomePage> {
  LoadingButtonStates _loadingButtonStates = LoadingButtonStates.none;
  bool _isDropdownOpen = false;
  // Initial Selected Value

  void showAuthDialog(LoadingButtonStates loadingButton) async {
    if (loadingButton == LoadingButtonStates.google) {
      setState(() {
        _loadingButtonStates = LoadingButtonStates.google;
      });
      await Future.delayed(
        const Duration(milliseconds: 2500),
      );
      setState(() {
        _loadingButtonStates = LoadingButtonStates.none;
      });
      // ignore: use_build_context_synchronously
      AppDialogs(
        context: context,
      ).showGalleryPlayBackDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var colors = Configuration().colors;
    return AppTemplate(
        pageBody: Column(
      children: [
        SizedBox(
          height: mediaQueryHeight * 0.03,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              height: mediaQueryHeight * 0.15,
              color: colors.primaryWhite,
            )),
            Expanded(
                flex: 2,
                child: Container(
                  height: mediaQueryHeight * 0.07,
                  color: colors.primaryColor,
                  child: Icon(
                    Icons.menu,
                    size: mediaQueryHeight * 0.04,
                  ),
                )),
            Expanded(
                flex: 9,
                child: Container(
                  height: mediaQueryHeight * 0.05,
                  color: colors.primaryWhite,
                ))
          ],
        ),
        AppText(
          text: 'Create your kota',
          fontSize: mediaQueryHeight * 0.03,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: mediaQueryHeight * 0.02,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: mediaQueryHeight * 0.1,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              kotabox_widget(mediaQueryHeight, colors),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: mediaQueryHeight * 0.02),
                width: mediaQueryHeight * 0.1,
                decoration: BoxDecoration(
                    color: colors.primaryBlack,
                    border: Border.all(
                      width: mediaQueryHeight * 0.003,
                      color: colors.primaryBlack,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              kotabox_widget(mediaQueryHeight, colors),
              kotabox_widget(mediaQueryHeight, colors),
              kotabox_widget(mediaQueryHeight, colors),
            ],
          ),
        ),
        SizedBox(
          height: mediaQueryHeight * 0.02,
        ),
        Container(
          height: mediaQueryHeight * 0.2,
          width: mediaQueryHeight * 0.25,
          decoration: BoxDecoration(
            border:
                const Border(bottom: BorderSide(color: Colors.white, width: 2)),
            image: DecorationImage(
              image: AssetImage('assets/images/products/kotas/kota1.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: mediaQueryHeight * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQueryHeight * 0.03),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  if (!_isDropdownOpen) {
                    setState(() {
                      _isDropdownOpen = true;
                    });
                  } else {
                    setState(() {
                      _isDropdownOpen = false;
                    });
                  }
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQueryHeight * 0.03),
                          color: colors.primaryBlack,
                          height: mediaQueryHeight * 0.07,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text: 'Select Source',
                                    color: colors.primaryWhite,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: mediaQueryHeight * 0.04,
                                        width: mediaQueryHeight * 0.04,
                                        color: colors.primaryWhite,
                                      ),
                                      SizedBox(
                                        width: mediaQueryHeight * 0.02,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        color: colors.primaryWhite,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: mediaQueryHeight * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: 'Do want to add a drink ?',
                          fontSize: mediaQueryHeight * 0.018,
                        ),
                        AppButton(
                            text: 'YES',
                            textColor: colors.primaryBlack,
                            color: colors.primaryWhite,
                            textFontWeight: FontWeight.bold,
                            textSize: mediaQueryHeight * 0.015,
                            onPressed: () {})
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: mediaQueryHeight * 0.13),
                    child: Row(
                      children: [
                        AppText(
                          text: 'Total',
                          fontSize: Configuration().fontSizes.normalText,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: mediaQueryHeight * 0.2),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                              width: mediaQueryHeight,
                              height: mediaQueryHeight * 0.06,
                              text: 'Checkout',
                              textSize: mediaQueryHeight * 0.016,
                              textColor: colors.primaryWhite,
                              color: colors.primaryBlack,
                              textFontWeight: FontWeight.bold,
                              onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                  _isDropdownOpen
                      ? Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: mediaQueryHeight * 0.15,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 227, 227, 227),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container()
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: mediaQueryHeight * 0.03,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              height: mediaQueryHeight * 0.037,
              color: colors.primaryColor,
            ))
          ],
        )
      ],
    ));
  }

  Container kotabox_widget(double mediaQueryHeight, ColourScheme colors) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: mediaQueryHeight * 0.012),
      width: mediaQueryHeight * 0.1,
      decoration: BoxDecoration(
          border: Border.all(
            width: mediaQueryHeight * 0.003,
            color: colors.primaryColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
