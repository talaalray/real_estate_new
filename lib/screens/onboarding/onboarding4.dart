import 'package:flutter/material.dart';
import 'package:real_estate/constans/color.dart';
import 'package:real_estate/constans/image_url.dart';
import 'package:real_estate/screens/auth/login.dart';
import '../../widgets/auth/bouttom_auth.dart';
import '../../widgets/onboarding/image_widget.dart';
import '../../widgets/onboarding/text_widget.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            ImageWidget(
              url: AppImageAsset.onboarding4,
            ),

            Expanded(
              child: Center(
                child: TextWidget(
                  title: 'هل لديك عقار للبيع أو للإيجار؟',
                  subtitle:
                  'اعرضه خلال دقائق وابدأ في تلقي الطلبات من المهتمين',
                ),
              ),
            ),

            BottumAuth(
              title: 'التالي',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
              },
            ),

          ],
        ),
      ),
    );
  }
}