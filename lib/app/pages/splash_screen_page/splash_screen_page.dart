// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:kota_attack_mobile_app/app/widgets/app_text.dart';
import 'package:kota_attack_mobile_app/configurations/configurations.dart';
import 'package:kota_attack_mobile_app/configurations/constants/app_colors.dart';
import 'package:kota_attack_mobile_app/configurations/constants/app_image_assets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHomePage();
  }

  _navigateToHomePage() async {
    await Future.delayed(
      const Duration(milliseconds: 2500),
    );
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const MyHomePage(title: 'Kota Attack'),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: mediaQuery * 0.15,
                  color: Configuration().colors.primaryAmber,
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: mediaQuery * 0.65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: 'Kota Attack',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      Center(child: Image.asset(ImageAsset.appLogo)),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: mediaQuery * 0.2,
                  color: Configuration().colors.primaryAmber,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
