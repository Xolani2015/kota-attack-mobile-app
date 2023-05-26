import 'package:flutter/material.dart';
import 'package:kota_attack_mobile_app/app/widgets/app_button.dart';
import 'package:kota_attack_mobile_app/app/widgets/app_template.dart';
import 'package:kota_attack_mobile_app/app/widgets/app_text.dart';
import 'package:kota_attack_mobile_app/configurations/configurations.dart';
import 'package:kota_attack_mobile_app/configurations/constants/app_image_assets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size.height;
    return AppTemplate(
      pageBody: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                color: Configuration().colors.primaryColor,
                height: mediaQuery * 0.1,
              )),
            ],
          ),
          _logoWidget(mediaQuery),
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Configuration().colors.primaryColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                  ),
                ),
                height: mediaQuery * 0.35,
                child: Column(children: [
                  SizedBox(
                    height: mediaQuery * 0.05,
                  ),
                  Row(
                    children: [
                      AppText(
                        text: 'Welcome',
                        fontWeight: FontWeight.bold,
                        fontSize: Configuration().fontSizes.hearderText2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppText(
                          text:
                              'The best kotas ekasi, we deliver quality kotas to our customers in the quickest speeds possible',
                          fontWeight: FontWeight.normal,
                          fontSize: Configuration().fontSizes.normalText2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery * 0.03,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: AppButton(
                            text: 'Sign In',
                            textColor: Configuration().colors.primaryWhite,
                            color: Configuration().colors.primaryBlack,
                            onPressed: () {},
                          )),
                      Expanded(child: Container()),
                      Expanded(
                          flex: 3,
                          child: AppButton(
                            text: 'Sign Up',
                            textColor: Configuration().colors.primaryBlack,
                            color: Configuration().colors.primaryWhite,
                            onPressed: () {},
                          ))
                    ],
                  )
                ]),
              ))
            ],
          )
        ],
      ),
    );
  }

  Row _logoWidget(double mediaQuery) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Configuration().colors.primaryWhite,
            height: mediaQuery * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: mediaQuery * 0.05,
                ),
                AppText(
                  text: 'Kota Attack',
                  fontWeight: FontWeight.bold,
                  fontSize: Configuration().fontSizes.headerText,
                ),
                Center(child: Image.asset(ImageAsset.appLogo)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
