import 'package:flutter/material.dart';
import 'package:real_estate/constans/color.dart';
import 'package:real_estate/constans/image_url.dart';
import '../../widgets/auth/bouttom_auth.dart';
import '../../widgets/onboarding/image_widget.dart';
import '../../widgets/onboarding/text_widget.dart';
import 'onboarding3.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
             ImageWidget(
              url: AppImageAsset.onboarding2,
            ),

            Expanded(
              child: Center(
                child: TextWidget(
                  title: 'مرحبا بك',
                  subtitle:
                  'اكتشف أفضل العقارات للشراء أو الإيجار بكل سهولة وفي مكان واحد',
                ),
              ),
            ),

             BottumAuth(
                title: 'التالي',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Onboarding3()));
                },
              ),

          ],
        ),
      ),
    );
  }
}
