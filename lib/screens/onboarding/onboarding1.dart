import 'package:flutter/material.dart';
import 'package:real_estate/constans/color.dart';
import 'package:real_estate/constans/image_url.dart';
import 'package:real_estate/screens/onboarding/onboarding2.dart';
import 'package:real_estate/widgets/auth/bouttom_auth.dart';


import '../../widgets/blue_shadow.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            // صورة الخلفية
            Positioned.fill(
              child: Image.asset(
                AppImageAsset.onboarding1,
                fit: BoxFit.cover,
              ),
            ),

            // طبقة التعتيم الزرقاء
            const BlueShadow(),

            // العنوان
            const Center(
              child: Text(
                'عقاري',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,
                ),
              ),
            ),

            // الزر
            BottumAuth(
              title: 'ابدأ الآن',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => Onboarding2()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
