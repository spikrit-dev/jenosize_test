import 'dart:async';

import 'package:flutter/material.dart';

import '../../../configs/images.dart';
import '../../../route.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const double _splashIconSize = 50;

  @override
  void initState() {
    scheduleMicrotask(() async {
      await AppImages.precacheAssets(context);
      await Future.delayed(const Duration(milliseconds: 400));
      await AppNavigator.replaceWith(Routes.wrapper);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AppImages.digitloader,
              width: _splashIconSize,
              height: _splashIconSize,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              'Jenosize',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
