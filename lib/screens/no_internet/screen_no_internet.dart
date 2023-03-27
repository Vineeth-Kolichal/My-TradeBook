import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:my_tradebook/main.dart';
import 'package:my_tradebook/screens/home/screen_home.dart';
import 'package:my_tradebook/screens/intro/screen_intro.dart';
import 'package:my_tradebook/screens/login/screen_login.dart';
import 'package:my_tradebook/screens/splash_screen/screen_splash.dart';
import 'package:my_tradebook/widgets/widget_loading_alert.dart';

class ScreenNoInternet extends StatefulWidget {
  const ScreenNoInternet({super.key});

  @override
  State<ScreenNoInternet> createState() => _ScreenNoInternetState();
}

class _ScreenNoInternetState extends State<ScreenNoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/no_internet.png',
              scale: 2,
            ),
            sizedBoxTen,
            const Text(
              'Ooops!',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepPurple),
            ),
            sizedBoxTen,
            const Text(
              'Slow or no internet connection\n Check your inernet settings.',
              textAlign: TextAlign.center,
            ),
            sizedBoxTen,
            ElevatedButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const WidgetLoadingAlert(
                      duration: 2000,
                    );
                  },
                );
                Get.offAll(const ScreenSplash());
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}