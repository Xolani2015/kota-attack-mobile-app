// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kota_attack_mobile_app/app/pages/welcome_page/welcome_page.dart';
import 'package:kota_attack_mobile_app/app/widgets/app_template.dart';
import 'package:kota_attack_mobile_app/app/widgets/app_text.dart';
import 'package:kota_attack_mobile_app/configurations/configurations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size.height;
    return AppTemplate(
        pageBody: Column(
      children: [
        _headerWidget(mediaQuery),
        Row(
          children: [
            Expanded(
                child: Container(
              color: Configuration().colors.primaryWhite,
              height: mediaQuery * 0.65,
            ))
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              color: Configuration().colors.primaryColor,
              height: mediaQuery * 0.05,
            ))
          ],
        ),
      ],
    ));
  }

  Row _headerWidget(double mediaQuery) {
    return Row(
      children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Configuration().colors.primaryColor,
          height: mediaQuery * 0.3,
          child: Column(
            children: [
              SizedBox(
                height: mediaQuery * 0.07,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WelcomePage(),
                                ),
                              );
                            },
                            child: Icon(Icons.arrow_back)),
                      ],
                    ),
                  ),
                  Expanded(
                      child: AppText(
                    text: 'Register',
                    fontSize: Configuration().fontSizes.normalText2,
                    fontWeight: FontWeight.bold,
                  ))
                ],
              ),
              SizedBox(
                height: mediaQuery * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      AppText(
                        text: 'Sign In',
                        fontSize: Configuration().fontSizes.headerText,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ))
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}
