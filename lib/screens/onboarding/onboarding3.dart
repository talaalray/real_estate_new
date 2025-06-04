import 'package:flutter/material.dart';
import 'package:real_estate/constans/color.dart';
import 'package:real_estate/constans/image_url.dart';
import '../../widgets/auth/bouttom_auth.dart';
import '../../widgets/onboarding/image_widget.dart';
import '../../widgets/onboarding/text_widget.dart';
import 'onboarding4.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            ImageWidget(
              url: AppImageAsset.onboarding3,
            ),

            Expanded(
              child: Center(
                child: TextWidget(
                  title: 'ابحث عن بيت أحلامك!',
                  subtitle:
                  'استخدم الفلاتر الذكية للعثور على العقار المناسب حسب الموقع،السعر والمساحة',
                ),
              ),
            ),

            BottumAuth(
              title: 'التالي',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => Onboarding4()));
              },
            ),

          ],
        ),
      ),
    );
  }
}